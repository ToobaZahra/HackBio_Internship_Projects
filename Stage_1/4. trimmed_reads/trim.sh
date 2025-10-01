#!/bin/bash
mkdir -p trimmed_reads

# Colab-specific conda activation
source /usr/local/etc/profile.d/conda.sh
conda activate funtools

SAMPLES=(
  "ACBarrie"
  "Alsen"
  "Baxter"
  "Chara"
  "Drysdale"
)

for SAMPLE in "${SAMPLES[@]}"; do

  fastp \
    -i "raw_reads/${SAMPLE}_R1.fastq.gz" \
    -I "raw_reads/${SAMPLE}_R2.fastq.gz" \
    -o "trimmed_reads/${SAMPLE}_R1.fastq.gz" \
    -O "trimmed_reads/${SAMPLE}_R2.fastq.gz" \
    --html "trimmed_reads/${SAMPLE}_fastp.html" 
done