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
seqtk seq -U chm13v2.0.fa | tr -d -c "ACGT" > HS.seq;
#
# Data compression:
time ./zstd -10 -o out.zstd HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt;
ls -la zstd-enc.zstd 1>> report_c_stdout.txt 2>> report_c_stderr.txt;
#
# Data decompression:
time ./zstd -d -o zstd-dec.zstd zstd-enc.zstd 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq zstd-dec.zstd > cmp.txt;
#
