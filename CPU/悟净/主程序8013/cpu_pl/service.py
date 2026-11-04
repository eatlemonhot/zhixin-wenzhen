from .adapter import align
from .ledger import Ledger


def receive_results(documents, ledger_path, requests=None):

    results, matrix, binary, claims = align(documents, requests)
    ledger = Ledger(ledger_path)
    try:
        repeats = ledger.claim_batch(claims)
    finally:
        ledger.close()
    return dict(full_results=results, observations=matrix, aligned_f6_le=binary,
                retransmissions_not_new_measurements=repeats, model_usable=False, npu_executed=False)
