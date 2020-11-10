# bash script
activation_map = "$1" # read the file where to get the maximum value of voxel coordinate i,j,k
NIFTI_file_4D = "$2" # read the NIFTI 4D file that contains the time series
#
i_max=$(tail -n 1 "$1" | awk '{print $1}') # i coordinate max value
echo $i_max
j_max=$(tail -n 1 "$1" | awk '{print $2}') # j coordinate max value
echo $j_max
k_max=$(tail -n 1 "$1" | awk '{print $3}') # k coordinate max value
echo $k_max
for k in $(seq 0 1 $k_max)
do
    for j in $(seq 0 1 $j_max)
    do
        for i in $(seq 0 1 $i_max)
        do
#nifti_tool -disp_ts $i $j $k -input language_4D_tlrc.nii | tail -n 1 >> time_series_all.txt
            echo $i $j $k >> values.txt
        done
    done
done



