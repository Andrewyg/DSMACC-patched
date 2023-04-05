#!/bin/bash

set -xe

vi +':e ++ff=dos' +':wq ++ff=unix' $1
vi +':%s/^\s*CALL mcm_constants/! CALL mcm_constants/' +':wq' $1
vi +':%s/= :/= DUMMY :/g' +':wq' $1
vi +':%s/^ = IGNORE/DUMMY = IGNORE/' +':wq' $1
