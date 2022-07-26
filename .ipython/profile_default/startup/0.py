from contextlib import contextmanager as _contextmanager

@_contextmanager
def _GlobalImport():
    yield

    import inspect

    outer_frame = inspect.getouterframes(inspect.currentframe())[2].frame
    arg_values  = inspect.getargvalues(outer_frame)
    locals      = arg_values.locals

    globals().update(locals)

def _public(func):
    globals()[func.__name__] = func
    return func

def _init_dbg():
    # dbg()
    # dbg(anything)
    # https://github.com/gruns/icecream
    with _GlobalImport():
        from icecream import ic as dbg
        dbg.configureOutput(prefix='dbg| ')

def _init_snoop():
    # @snoop()
    # with snoop():
    # https://github.com/cool-RR/PySnooper/blob/master/ADVANCED_USAGE.md
    with _GlobalImport():
        from pysnooper import snoop

def _init_profiled():
    from pyinstrument import Profiler

    @_public
    @_contextmanager
    def profiled(*args, open_in_browser=False, **kwargs):
        profiler = Profiler(*args, **kwargs)
        profiler.start()
        yield
        profiler.stop()

        if open_in_browser:
            profiler.open_in_browser()
            return

        profiler.print()

def _time_unit(seconds):
    unit = None
    value = None
    if seconds < 1e-6:
        value = seconds * 1e9
        unit = "ns"
    elif seconds < 1e-3:
        value = seconds * 1e6
        unit = "μs"
    elif seconds < 1:
        value = seconds * 1e3
        unit = "ms"
    elif seconds < 60:
        value = seconds
        unit = "s"
    elif seconds < 3600:
        value = seconds*60
        unit = "M"
    else:
        value = seconds*3600
        unit = "H"

    return f"{value:.2f}{unit}"


def _init_timed():
    import time
    from functools import wraps
    from rich import print as rprint

    @_public
    def timed(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            before = time.monotonic()
            result = func(*args, **kwargs)
            after = time.monotonic()
            total = after-before
            rprint(f"[red bold]{func.__name__}[/red bold][grey]:[/grey] took [blue]{_time_unit(total)}[/blue]")
            return result
        return wrapper

def _init_rich():
    # print([1, 2, 3])
    # https://rich.readthedocs.io/en/latest/reference/init.html#rich.print
    # and
    # https://rich.readthedocs.io/en/latest/reference/console.html#rich.console.Console
    #
    # inspect(print)
    # https://rich.readthedocs.io/en/latest/reference/init.html#rich.inspect
    from rich import pretty
    # from rich import print as rprint
    from rich import inspect as rinspect

    # Allows pretty printing for bare variables in REPL.
    pretty.install()

    # globals()["print"]   = rprint
    globals()["inspect"] = rinspect

def _init_progress():
    from rich.progress import Progress, TextColumn, BarColumn, TaskProgressColumn, MofNCompleteColumn, TimeElapsedColumn, TimeRemainingColumn

    @_public
    def progress(seq):
        columns = [
            TextColumn("[progress.description]"),
            BarColumn(bar_width=None),
            TaskProgressColumn(),
            MofNCompleteColumn(),
            TimeElapsedColumn(),
            TimeRemainingColumn(),
        ]
        progress = Progress(*columns)
        with progress:
            yield from progress.track(seq)

def _init_print_json():
    with _GlobalImport():
        from rich import print_json

def _init_random_string():
    import string
    import random

    @_public
    def random_string(n):
        blacklist = '"\'\\`"'
        alphabet = "".join([c for c in set(string.printable) - set(string.whitespace) - set(blacklist)])
        elems = random.choices(alphabet, k=n)
        return "".join(elems)

def _init_logging():
    import sys
    from rich import print as rprint

    def log_stub(style, char, msg, *args, **kwargs):
        rprint(f"[{style}]\[{char}] {msg}[/{style}]", file=sys.stderr)
        for arg in args:
            rprint(f"\t{arg}")
        for k, v in kwargs.items():
            rprint(f"\t{k}={v}", file=sys.stderr)

    @_public
    def debug(msg, *args, **kwargs):
        log_stub("blue", "?", msg, *args, **kwargs)

    @_public
    def info(msg, *args, **kwargs):
        log_stub("green", "+", msg, *args, **kwargs)

    @_public
    def warning(msg, *args, **kwargs):
        log_stub("yellow", "*", msg, *args, **kwargs)

    @_public
    def error(msg, *args, **kwargs):
        log_stub("red", "!", msg, *args, **kwargs)

    @_public
    def critical(msg, *args, **kwargs):
        log_stub("red bold", "#", msg, *args, **kwargs)

def _register_pager_magic():
    from contextlib import redirect_stdout
    import io

    from IPython.core.magic import register_line_magic
    from IPython.core import page

    @register_line_magic
    def pager(line):
        f = io.StringIO()
        with redirect_stdout(f):
            eval(line)
        page.pager_page(f.getvalue())

def _init_repl():
    from IPython import embed
    @_public
    def repl():
        embed()

def _init_iex():
    with _GlobalImport():
        from ipdb import iex

def _init_retry():
    with _GlobalImport():
        from retry import retry

def _init_hex():
    from binascii import hexlify, unhexlify
    @_public
    def hex(m, **kwargs):
        if isinstance(m, int):
            return __builtin__.hex(m, **kwargs)[2:]
        if isinstance(m, str):
            return hexlify(m.encode("utf-8")).decode("utf-8")
        return hexlify(m).decode("utf-8")

    @_public
    def unhex(m):
        return unhexlify(m)

def _init_binary():
    @_public
    def binary(m):
        return bin(int(hex(m), 16))[2:]

    @_public
    def unbinary(m):
        return unhex(hex(int(m, 2)))

def _init_requests_ignore():
    import requests
    requests.packages.urllib3.disable_warnings

def _init_hexdump():
    from pwn import hexdump as _hexdump
    from pwn import default_style

    @_public
    def hexdump(buf, **kwargs):
        print(_hexdump(buf, total=False, style=default_style, **kwargs))

def _init_urlcode():
    from urllib.parse import quote, unquote

    @_public
    def urlencode(m):
        return quote(m)
    @_public
    def urldecode(m):
        return unquote(m)

def _init_base64():
    from base64 import b64encode, b64decode, urlsafe_b64encode, urlsafe_b64decode

    @_public
    def base64_encode(m):
        if isinstance(m, str):
            return b64encode(m.encode("utf-8")).decode("utf-8")
        return b64encode(m).decode("utf-8")

    @_public
    def base64_decode(m):
        return b64decode(m)

    @_public
    def base64u_encode(m):
        if isinstance(m, str):
            return urlsafe_b64encode(m.encode("utf-8")).decode("utf-8")
        return urlsafe_b64encode(m).decode("utf-8")
    @_public
    def base64u_decode(m):
        return urlsafe_b64decode(m)

def _init_crypto():
    from Crypto.Cipher import AES
    from Crypto.Cipher.AES import MODE_CBC
    from Crypto.Util.Padding import pad, unpad

    @_public
    def aes_cbc_encrypt(key, iv, plaintext):
        aes = AES.new(key, iv=iv, mode=MODE_CBC)
        ciphertext = aes.encrypt(pad(plaintext, aes.block_size))
        return ciphertext

    @_public
    def aes_cbc_decrypt(key, iv, ciphertext):
        aes = AES.new(key, iv=iv, mode=MODE_CBC)
        plaintext = unpad(aes.decrypt(ciphertext), aes.block_size)
        return plaintext


def _init_xor():
    with _GlobalImport():
        from pwn import xor

def _init_hashes():
    with _GlobalImport():
        from hashlib import md5, sha1, sha256, pbkdf2_hmac

def _init_chunks():
    @_public
    def chunks(lst, n):
        """Yield successive n-sized chunks from lst."""
        for i in range(0, len(lst), n):
            yield lst[i:i + n]

def _init_time_helpers():
    @_public
    class Time:
        def __init__(self, time_str=None, days=0, hours=None, minutes=None):
            self.days = days
            if time_str:
                self.time_str = time_str

                if ":" not in time_str:
                    self.hours = int(time_str)
                    self.minutes = 0
                    return

                parts = time_str.split(":")
                if len(parts) != 2:
                    raise ValueError("Malformed hour str")

                self.hours, self.minutes = [int(p) for p in parts]
            else:
                self.hours = hours
                self.minutes = minutes

        def __add__(self, other):
            hours    = self.hours + other.hours
            minutes  = self.minutes + other.minutes
            days     = self.days + other.days
            hours   += minutes // 60
            minutes  = minutes % 60
            days    += hours // 24
            hours    = hours % 24

            return Time.from_time_parts(days, hours, minutes)

        def __str__(self):
            s = f"{self.hours:02}:{self.minutes:02}"
            if self.days:
                s += f" +{self.days} day{'s' if self.days >= 2 else ''}"
            return s

        def __repr__(self):
            return self.__str__()

        @classmethod
        def from_time_parts(cls, days, hours, minutes):
            return cls(days=days, hours=hours, minutes=minutes)


def _init():
    _init_rich()

    _init_logging()
    _init_snoop()
    _init_dbg()
    _init_repl()
    _init_progress()
    _init_print_json()
    _init_random_string()

    _init_hex()
    _init_binary()
    _init_hexdump()
    _init_urlcode()
    _init_base64()
    _init_crypto()
    _init_xor()
    _init_hashes()
    _init_chunks()

    _init_profiled()
    _init_timed()
    _init_iex()
    _init_retry()

    _init_time_helpers()

    _init_requests_ignore()

    _register_pager_magic()

_init()
