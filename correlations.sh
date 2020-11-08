#!/bin/sh
for ind in $(seq 70 1 99)
do
awk -f make_jij.awk Jij_$ind > jij_thresh_$ind.txt
done
