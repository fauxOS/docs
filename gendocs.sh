#!/bin/sh

# Clone the faux repo if it isn't there
if [ ! -d "faux" ]; then
  echo Cloning Faux
  git clone https://github.com/fauxOS/faux.git
fi

# Pull from github
echo Pulling the latest version of Faux
cd faux
git pull
cd ..

# Ease of use alias
alias doc="./node_modules/.bin/documentation build -f md"

## Userspace ##
echo "Starting userspace"

# sys
doc faux/src/userspace/lib/syscalls.js -o docs/userspace/sys.md
echo "built sys"
# fs
doc faux/src/userspace/lib/fs/**/*.js -o docs/userspace/fs.md
echo "built fs"

echo "done!"
