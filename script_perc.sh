#
# How to run: ./script_perc.sh N eps
#
# where N is the size of the matrix
# eps is the epsilon threshold for the Jij
#
#!/bin/sh
rm k2.txt
#
ind=8735
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt
ind=8765
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt
ind=9035
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt
ind=9065
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt
ind=9135
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt
ind=9165
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt
ind=9765
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt

for ind in $(seq 8000 100 9900)
do
./perc_plot K_0.$ind.txt $1 $2 | awk -v ind="$ind" '{print "0."ind, $0}' >>  k2.txt
done
