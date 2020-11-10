# bash script -- Gino Del Ferraro -- July 2017
#
# Argument 1: name file activation map, i.e. letter@1
#
# Argument 2: value of approximative threshold to cut out the voxels
#
# Argument 3: value of the exact threshold used in the activation map
#
# Argument 4: name of the 4D file NIFTI containing coord and time series, i.e. letter.nii
#
if [ $# -eq 4 ]; then # exactly 3 argument was passed..use it..its available in $1, $2 and $3
echo "Arguments: $1 $2 $3 $4"
else # either 0 or <3 arguments were passed...error out.
echo "Incorrect number of arguments passed"
exit 1
fi
#
#  ----- EXTRACTION -----
#
# extraction of the masking coordinate, i.e. coordinate active and modules
#
3dmaskdump Clust_mask+orig. > mask.txt
awk -f filtering.awk x=2 y=2 z=1 mask.txt > mask_CG_2x2x1.txt
awk '($4!=0){print $0}' mask_CG_2x2x1.txt > mask_active.txt
#
# extraction of voxels and correlations
#
3dmaskdump "$1"[2] > voxel_all.txt
awk -f filtering.awk x=2 y=2 z=1 voxel_all.txt > voxel_CG_2x2x1.txt
awk -v th="$2" '($4> th || $4< -th){print $0}' voxel_CG_2x2x1.txt > voxel_th.txt
#
# merging voxel coordinate, correlations and modules together
#
sort -k4 -g mask_active.txt > sort_mask_active.txt
./nodes_coord_modules_and_corr.sh sort_mask_active.txt voxel_th.txt voxel_th_$3.txt
awk '{print NR,$0}' voxel_th_$3.txt > NoN_nodes_mod.txt
cp NoN_nodes_mod.txt ../NoN/NoN_nodes_mod.txt
#
# extraction of time series
#
./get_act_time_series.sh sort_mask_active.txt "$4" ts_th_$3.txt


