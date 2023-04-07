#!/bin/bash

#set -xe
set -e

USAGE="Usage: ./run.sh <kpp> <Init_Cons> <time_step_interval> [<ModelName>]"

if [ "$1" = "-h" ]; then
    echo $USAGE
    exit 1
fi
if [ "$#" -le 1 ]; then
    echo "Missing arguments"
    echo $USAGE
    exit 1
fi
if [ "$#" -le 2 ]; then
    echo "Assuming dt=1200."
else
    vi +":%s/dt = \d*\.$/dt = $3./" +':wq' ../driver.f90
    exit 2
fi
if [ "$#" -le 3 ]; then
    NAME="UserModel"
else
    NAME=$4
fi

# Patching subset kpp
vi +':e ++ff=dos' +':wq ++ff=unix' $1
vi +':%s/^\s*CALL mcm_constants/! CALL mcm_constants/' +':wq' $1
vi +':%s/= :/= DUMMY :/g' +':wq' $1
vi +':%s/^ = IGNORE/DUMMY = IGNORE/' +':wq' $1

ln -fs $1 user_mcm_subset.kpp

make $NAME.Spec_1.dat.timeseries
