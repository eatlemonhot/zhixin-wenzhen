import socket
import time
from .common import need, strict_json, ReceiveError, MAX_DOCUMENT_BYTES, MAX_BATCH_BYTES, MAX_CONDITIONS


def decode_file(path, framing='json'):
    from pathlib import Path
    need(Path(path).stat().st_size <= MAX_BATCH_BYTES, 'INPUT_TOO_LARGE')
    documents = []
    with Path(path).open('rb') as stream:
        if framing == 'json':
            return [strict_json(stream.read(MAX_DOCUMENT_BYTES+1))]
        while True:
            line = stream.readline(MAX_DOCUMENT_BYTES+2)
            if not line:
                break
            need(len(documents) < MAX_CONDITIONS, 'TOO_MANY_MESSAGES')
            need(line.endswith(b'\n'), 'TRUNCATED_NDJSON')
            need(line.strip(), 'EMPTY_NDJSON_LINE')
            documents.append(strict_json(line))
    need(documents, 'EMPTY_INPUT')
    return documents


def receive_socket(host, port, timeout_s, framing, messages, wire, listen=False, on_listening=None):
    need(0 < timeout_s <= 3600 and 1 <= port <= 65535, 'NETWORK_ARGUMENTS')
    need(type(messages) is int and 1 <= messages <= MAX_CONDITIONS, 'MESSAGE_COUNT')
    need(framing != 'json' or messages == 1, 'JSON_MODE_ONE_DOCUMENT')
    server = connection = None
    deadline = time.monotonic()+timeout_s
    def remaining():
        seconds = deadline-time.monotonic()
        need(seconds > 0, 'RECEIVE_TIMEOUT')
        return seconds
    try:
        if listen:
            server = socket.socket()
            server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            server.bind((host, port))
            server.listen(1)
            if on_listening:
                on_listening(server.getsockname())
            server.settimeout(remaining())
            connection, _ = server.accept()
        else:
            connection = socket.create_connection((host, port), timeout=remaining())
        buffer, documents, received = bytearray(), [], 0
        while True:
            connection.settimeout(remaining())
            data = connection.recv(65536)
            if not data:
                if framing == 'json':
                    return [strict_json(bytes(buffer))]
                need(not buffer, 'TRUNCATED_NDJSON')
                need(len(documents) == messages, 'CONNECTION_CLOSED_BEFORE_EXPECTED_MESSAGES')
                return documents
            received += len(data)
            need(received <= MAX_BATCH_BYTES, 'INPUT_TOO_LARGE')
            wire.write(data)
            buffer.extend(data)
            if framing == 'json':
                need(len(buffer) <= MAX_DOCUMENT_BYTES, 'DOCUMENT_TOO_LARGE')
                continue
            while b'\n' in buffer:
                size = buffer.index(b'\n')
                need(size+1 <= MAX_DOCUMENT_BYTES, 'DOCUMENT_TOO_LARGE')
                line = bytes(buffer[:size])
                del buffer[:size+1]
                need(line.strip(), 'EMPTY_NDJSON_LINE')
                documents.append(strict_json(line))
                need(len(documents) <= messages, 'TOO_MANY_MESSAGES')
            need(len(buffer) <= MAX_DOCUMENT_BYTES, 'DOCUMENT_TOO_LARGE')
            if len(documents) == messages:
                need(not buffer, 'TRAILING_MESSAGE_BYTES')
                return documents
    except (socket.timeout, TimeoutError) as exc:
        raise ReceiveError('RECEIVE_TIMEOUT', str(exc))
    finally:
        if connection:
            connection.close()
        if server:
            server.close()
