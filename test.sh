#!/bin/bash -e

# make a command fail
non-existent-cmd
echo "[log] non-existent-cmd exit $?"

# not expecting to see this
echo "[log] echo exit $?"
