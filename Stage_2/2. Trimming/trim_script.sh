%%writefile trim_script_colab.sh
#!/bin/bash
# This script is used to perform quality control for our RNA-seq data for C. elegans

# Colab-specific conda activation
source /usr/local/etc/profile.d/conda.sh
conda activate funtools

# create directories for output
mkdir -p trim

for filename in clean_files/*.fq; do
    base=$(basename "$filename" .fq)
    fastp -i "$filename" -o "trim/${base}_trim.fq" -h "trim/${base}_report.html"
done