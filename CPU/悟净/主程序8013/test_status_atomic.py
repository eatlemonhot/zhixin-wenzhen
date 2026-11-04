import json,threading,tempfile,unittest
from pathlib import Path
from unittest.mock import patch
from probe_system.common import dump,read_json,atomic_replace

class AtomicStatus(unittest.TestCase):
    def test_reader_recovers_from_replace_window(self):
        with patch('probe_system.common._read_json_once',side_effect=[PermissionError('sharing'),FileNotFoundError('replace window'),{'state':'completed'}]),patch('probe_system.common.time.sleep'):
            self.assertEqual(read_json('status.json'),{'state':'completed'})
    def test_persistent_read_error_propagates(self):
        with patch('probe_system.common._read_json_once',side_effect=PermissionError('persistent')) as mocked,patch('probe_system.common.time.sleep'):
            with self.assertRaises(PermissionError):read_json('status.json')
            self.assertEqual(mocked.call_count,20)
    def test_transient_permission_error_retries_without_partial_json(self):
        with tempfile.TemporaryDirectory() as folder:
            target=Path(folder)/'status.json';dump(target,{'state':'running'})
            original=atomic_replace;attempts=[]
            def replace(source,destination):
                attempts.append(1)
                self.assertEqual(json.loads(target.read_text())['state'],'running')
                if len(attempts)<3:raise PermissionError('simulated Windows sharing violation')
                return original(source,destination)
            with patch('probe_system.common.atomic_replace',replace),patch('probe_system.common.time.sleep'):
                dump(target,{'state':'completed'})
            self.assertEqual(len(attempts),3);self.assertEqual(json.loads(target.read_text())['state'],'completed')
            self.assertFalse(list(Path(folder).glob('*.tmp')))
    def test_persistent_error_is_propagated_and_old_state_retained(self):
        with tempfile.TemporaryDirectory() as folder:
            target=Path(folder)/'status.json';dump(target,{'state':'running'})
            with patch('probe_system.common.atomic_replace',side_effect=PermissionError('persistent')) as mocked,patch('probe_system.common.time.sleep'):
                with self.assertRaises(PermissionError):dump(target,{'state':'completed'})
                self.assertEqual(mocked.call_count,20)
            self.assertEqual(json.loads(target.read_text())['state'],'running')
            self.assertFalse(list(Path(folder).glob('*.tmp')))
    def test_concurrent_pollers_see_complete_json(self):
        with tempfile.TemporaryDirectory() as folder:
            target=Path(folder)/'status.json';dump(target,{'sequence':0,'payload':'x'*5000})
            stop=threading.Event();errors=[]
            def reader():
                while not stop.is_set():
                    try:
                        obj=read_json(target);assert len(obj['payload'])==5000
                    except BaseException as exc:errors.append(repr(exc));stop.set()
            threads=[threading.Thread(target=reader) for _ in range(4)]
            for t in threads:t.start()
            try:
                for i in range(1,101):dump(target,{'sequence':i,'payload':'x'*5000})
            finally:
                stop.set()
                for t in threads:t.join(2)
            self.assertEqual(errors,[]);self.assertEqual(json.loads(target.read_text())['sequence'],100)

if __name__=='__main__':unittest.main(verbosity=2)
