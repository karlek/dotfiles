set print asm-demangle on
set breakpoint pending on
set disassembly flavor intel

# Necessary to align stack on stack overflow exploits.
unset environment LINES
unset environment COLUMNS
