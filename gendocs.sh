#!/bin/sh

# Clone the faux repo if it isn't there
if [ ! -d "faux" ]; then
  git clone https://github.com/fauxOS/faux.git
fi

# Ease of use alias
alias doc="./node_modules/.bin/documentation build -f md"

## Userspace ##
echo "Starting userspace"

# sys
doc faux/src/userspace/lib/syscalls.js -o docs/userspace/sys.md
echo "built sys"


echo "done!"
