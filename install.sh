#!/bin/bash

LDFLAGS=-L/usr/lib/x86_64-linux-gnu/ CFLAGS=-static ./configure

make "$@"

cd pysrc/
make source "$@"
sudo make install
