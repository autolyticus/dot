python
import sys

# set this to the path of the pretty printer
sys.path.insert(0, '/home/g/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/etc')

import gdb_rust_pretty_printing

gdb_rust_pretty_printing.register_printers(gdb)
end
