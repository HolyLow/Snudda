#!/bin/bash

network="tinySim"
basedir="./networks"
networkdir="$basedir/$network"
size="100"

snudda init $networkdir --size $size --overwrite
snudda place $networkdir
snudda detect $networkdir
snudda prune $networkdir
snudda input $networkdir --input snudda/data/config/input-tinytest-v8.json --time 1.0
mpiexec -np 2 python -m snudda.simulate ${networkdir}/network-pruned-synapses.hdf5 ${networkdir}/input-spikes.hdf5 --time 0.01 --voltOut ${networkdir}/simulation/volt.txt
