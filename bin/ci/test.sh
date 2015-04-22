#!/bin/bash -e

# make a command fail
if [ $FEATURE -gt 2 ]; then
    echo "FEATURE -gt 2"
    non-existent-cmd
    echo "[log] non-existent-cmd exit $?"
fi

# not expecting to see this
echo "[log] echo exit $?"
