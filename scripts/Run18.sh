#!/bin/bash
#
# Install tools:
conda install -c bioconda seqtk -y
conda install -c bioconda jarvis -y
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
time JARVIS -v -rm 2000:12:0.1:0.9:6:0.10:1 -cm 4:1:1:0.7/0:0:0:0 -z 6 HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt

# Data decompression:
time JARVIS -d -o HS.seq.jc 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq HS.seq.jd > cmp.txt;
#
