#!/bin/bash
#
# Install tools:
conda install -c bioconda seqtk -y
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
time bzip2 -k -z --best HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt

# Data decompression:
time bunzip2 -d HS.seq.bz2 -c > HS.seq.uz2 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq HS.seq.uz2 > cmp.txt;
#
