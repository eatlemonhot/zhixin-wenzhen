import sqlite3
from pathlib import Path
from .common import need, digest, ReceiveError


class Ledger:
    def __init__(self, path):
        Path(path).parent.mkdir(parents=True, exist_ok=True)
        self.db = sqlite3.connect(str(path), timeout=10)
        self.db.executescript('''
        CREATE TABLE IF NOT EXISTS observations (
            key TEXT PRIMARY KEY, result_hash TEXT NOT NULL, binding_hash TEXT NOT NULL);
        CREATE TABLE IF NOT EXISTS frames (
            frame_key TEXT PRIMARY KEY, physical_key TEXT UNIQUE NOT NULL, observation_key TEXT NOT NULL);
        ''')

    def claim_batch(self, claims):
        retransmissions = 0
        try:
            self.db.execute('BEGIN IMMEDIATE')
            for claim in claims:
                key = digest(claim['condition'])
                binding_hash = digest(claim['binding'])
                previous = self.db.execute('SELECT result_hash,binding_hash FROM observations WHERE key=?', (key,)).fetchone()
                if previous:
                    unbound_hash = digest(dict(status='unbound', role=None, excitation_verification='not_available', issues=['CPU_REQUEST_BINDING_MISSING']))
                    upgrade = previous == (claim['result_digest'], unbound_hash) and claim['binding']['status'] == 'matched_to_cpu_request'
                    need(previous == (claim['result_digest'], binding_hash) or upgrade, 'CONDITION_REUSED_OR_CHANGED')
                    if upgrade:
                        self.db.execute('UPDATE observations SET binding_hash=? WHERE key=?', (binding_hash,key))
                    retransmissions += 1
                    continue
                self.db.execute('INSERT INTO observations VALUES(?,?,?)', (key, claim['result_digest'], binding_hash))
                for frame in claim['frames']:
                    frame_key = digest([frame['session'], frame['frame_id']])
                    # No ADC/route identity is supplied by the feature packet.
                    # Same channel/tick in one acquisition session cannot count
                    # as an independent capture just by changing its frame ID.
                    physical = digest([frame['session'], frame['channel'], frame['tick']])
                    need(self.db.execute('SELECT 1 FROM frames WHERE frame_key=? OR physical_key=?',
                                         (frame_key, physical)).fetchone() is None, 'FRAME_REUSED_ACROSS_CONDITIONS_OR_ROLES')
                    self.db.execute('INSERT INTO frames VALUES(?,?,?)', (frame_key, physical, key))
            self.db.commit()
            return retransmissions
        except Exception:
            self.db.rollback()
            raise

    def close(self):
        self.db.close()
