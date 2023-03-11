#!/bin/bash

# if [ ! -f "/usr/bin/python" ] && [ -f "/usr/bin/python3" ]; then sudo ln -s /usr/bin/python3 /usr/bin/python; fi

LDFLAGS=-L/usr/lib/x86_64-linux-gnu/ CFLAGS=-static ./configure

make "$@"

cd pysrc/
make source "$@"
sudo make install
