try:
    import fcntl as fcntl
except ImportError:
    import msvcrt
    class _WindowsLocks:
        LOCK_EX=2;LOCK_NB=4;LOCK_UN=8
        @staticmethod
        def flock(handle,operation):
            fd=handle if isinstance(handle,int) else handle.fileno()
            if not isinstance(handle,int):handle.flush();handle.seek(0)
            try:msvcrt.locking(fd,msvcrt.LK_UNLCK if operation&_WindowsLocks.LOCK_UN else msvcrt.LK_NBLCK,1)
            except OSError as e:raise BlockingIOError(str(e)) from None
    fcntl=_WindowsLocks()
