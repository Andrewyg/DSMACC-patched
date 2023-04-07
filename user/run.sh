#!/bin/bash

#set -xe
set -e

if [ "$1" = "-h" ]; then
    echo "Usage: ./run.sh <kpp> <Init_Cons> [<ModelName>]"
    exit 1
fi
if [ "$#" -le 1 ]; then
    echo "Missing arguments"
    echo "Usage: ./run.sh <kpp> <Init_Cons> [<ModelName>]"
    exit 1
fi
if [ "$#" -le 2 ]; then
    NAME="UserModel"
else
    NAME=$3
fi

# Patching subset kpp
vi +':e ++ff=dos' +':wq ++ff=unix' $1
vi +':%s/^\s*CALL mcm_constants/! CALL mcm_constants/' +':wq' $1
vi +':%s/= :/= DUMMY :/g' +':wq' $1
vi +':%s/^ = IGNORE/DUMMY = IGNORE/' +':wq' $1

ln -fs $1 user_mcm_subset.kpp

make $NAME.Spec_1.dat.timeseries
