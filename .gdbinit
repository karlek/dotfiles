unset environment LINES
unset environment COLUMNS
source /usr/share/pwndbg/gdbinit.py

set hexdump-bytes 128

set print asm-demangle on
set show-flags on
set context-clear-screen on
set context-register-changed-color red,bold
set context-register-changed-marker " --> "
set disasm-branch-color yellow

set memory-data-color blue
set memory-heap-color purple,bold
set memory-rodata-color green
set memory-stack-color light-yellow,bold
set context-register-color green

# Light theme
set syntax-highlight-style default
# Dark theme
set syntax-highlight-style fruity

# Print all syntax highlighting themes.
# from pygments.styles import STYLE_MAP
# print(sorted(STYLE_MAP.keys()))

# get base address
define base
python
import pwndbg
import traceback

def get_base():
    file = pwndbg.file.get_file(pwndbg.proc.exe)
    maps = pwndbg.vmmap.get()
    if not maps:
        traceback.print_exc()
        print(pwndbg.color.red("Error while getting program's memory maps"))
        print(pwndbg.color.red("Make sure you start the program first"))
        return

    cmd = "set $code = %s" % hex(pwndbg.elf.exe().address)
    gdb.execute(cmd)
    print(cmd)
    for page in maps:
        cmd = ""
        if page.offset == 0: # is base
            if "libc-" in page.objfile or "libc.so.6" in page.objfile: # libc
                cmd = "set $libc = %s" % hex(page.vaddr)
            elif "[heap]" in page.objfile: # heap
                cmd = "set $heap = %s" % hex(page.vaddr)
        if len(cmd):
            gdb.execute(cmd)
            print(cmd)

get_base()
end
end

