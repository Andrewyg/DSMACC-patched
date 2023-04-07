#!/bin/bash

set -e

# if [ ! -f "/usr/bin/python" ] && [ -f "/usr/bin/python3" ]; then sudo ln -s /usr/bin/python3 /usr/bin/python; fi

LDFLAGS=-L/usr/lib/x86_64-linux-gnu/ CFLAGS=-static ./configure

make "$@"

#cd pysrc/
#make source "$@"
#read -p "We're going to run command in `sudo`, press enter than type your password."
#sudo make install
