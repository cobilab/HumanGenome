#!/bin/bash
#
# Install tools:
conda install -c bioconda seqtk -y
conda install -c bioconda naf -y
#
# Download T2T chm13 v2.0 genome:
rm -f chm13v2.0.fa.gz
wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa.gz
#
# Filter non ACGT data:
gunzip -k chm13v2.0.fa.gz; 
seqtk seq -U chm13v2.0.fa > HS.seq;
#
# Data compression:
mkdir -p tmp/
time ennaf --temp-dir tmp/ --dna --level 22 HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt

# Data decompression:
time unnaf -o HS.seq.unnaf 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq HS.seq.unnaf > cmp.txt;
#
