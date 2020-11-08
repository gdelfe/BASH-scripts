# This script merges the nodes which are in the clusters with their coordinates.
#
# bash script -- Gino Del Ferraro -- January 2017
#
# Argument 1: file with the node_ind / node_clust
#
# Argument 2: file with the MNI coordinates of the act voxel above the threshold
#
# Argument 3: output file

if [ $# -eq 3 ]; then # exactly 3 argument was passed..use it..its available in $1, $2 and $3
echo "Arguments: $1 $2 $3"
else # either 0 or <3 arguments were passed...error out.
echo "Incorrect number of arguments passed"
exit 1
fi


rm "$3"
while read -r line # read the file in argument 1, i.e node in the module
do
NR=$(echo $line | awk '{print $1}') # read value of the line
module=$(echo $line | awk '{print $5}')
sed -n "$NR","$NR"'p' "$2" | awk '{print $0,'$module'}' >> "$3" # print coordinate x y z, module
done < "$1"
