echo "Running Glasso for $1"
matlab -nodisplay -nojvm -r 'G_lasso; exit;' > out_"$1".txt
echo "Done with Glasso for $1"