#!/bin/sh

ind=8735
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
ind=8765
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
ind=9035
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
ind=9065
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
ind=9135
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
ind=9165
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
ind=9565
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
ind=9765
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt

for ind in $(seq 7000 100 9900)
do
./p2.out cor_jij_0.$ind.txt $1 module.txt >> p2.txt
done
./p2.out cor_jij_1.000.txt $1 module.txt >> p2.txt