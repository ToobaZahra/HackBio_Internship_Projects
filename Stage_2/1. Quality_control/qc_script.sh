#!/bin/bash
# This script is used to perform quality control for our RNA-seq data for C. elegans

# Activate conda environment ONCE at the beginning
source /usr/local/etc/profile.d/conda.sh
conda activate funtools

# create directories for output
mkdir -p qc

# Process all files with FastQC
for filename in clean_files/*.fq; do
    fastqc -o qc/ $filename
done