#!/bin/bash
# This script is used to perform quality control for our RNA-seq data for C. elegans

# Colab-specific conda activation
source /usr/local/etc/profile.d/conda.sh
conda activate funtools

# create directories for output
mkdir -p mapped

for infile in trim/*.fq ; do
    outfile=$(basename "$infile" .fq)
    STAR --genomeDir genome/genomeIndex --readFilesIn "$infile" --outFileNamePrefix mapped/"$outfile"_ --outSAMtype BAM SortedByCoordinate --outSAMattributes All
done
