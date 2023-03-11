#!/bin/bash

set -e

if [ $# -eq 0 ]; then
    echo "Usage: ./runModel.sh <modelName> [<output path>]"
    exit 1
fi

if [ -z "$2" ]; then
    OUTPUT="$1_output.png"
else
    OUTPUT="$2"
fi

python "$1.py"
python plot.py "$1conc.dat" "$OUTPUT"
