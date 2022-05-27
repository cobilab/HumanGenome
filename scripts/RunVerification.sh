#!/bin/bash
#
# Install tools:
conda install -c bioconda geco3 -y
conda install -c bioconda seqtk -y
#
# Download T2T chm13 v2.0 genome:
rm -f chm13v2.0.fa.gz
wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa.gz
#
# Filter non ACGT data:
gunzip -k chm13v2.0.fa.gz; 
seqtk seq -U chm13v2.0.fa | tr -d -c "ACGT" > HS.seq;
#
# Data compression:
time GeCo3 -v -tm 3:1:0:0:0.7/0:0:0 -tm 19:1000:1:20:0.9/3:20:0.9 HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt;
#
# Data decompression:
time GeDe3 -v HS.seq.co 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq.de HS.seq > cmp.txt;
#
