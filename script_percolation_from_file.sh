# bash script -- Gino Del Ferraro -- March 2017
#
# Argument 1: N number of nodes
#
# Argument 2: epsilon, value of the threshold
#
# Argument 3: input file containing the name of the Jij matrices
#
# Argument 4: output file

if [ $# -eq 4 ]; then # exactly 3 argument was passed..use it..its available in $1, $2 and $3
echo "Arguments: $1 $2 $3 output file: $4"
else # either 0 or <3 arguments were passed...error out.
echo "Incorrect number of arguments passed"
exit 1
fi


rm "$4"
while read -r line # read the file in argument 1, i.e activated voxel coordinate
do
./perc $line "$1" "2" >> "$4"
done < "$3" # name input file where to read the matrices Jij
