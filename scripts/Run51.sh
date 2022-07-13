#!/bin/bash
#
# Install tools:
conda install -c bioconda seqtk -y
cp ../bin/JARVIS2-bin-64-Linux.zip .
unzip -o JARVIS2-bin-64-Linux.zip
cd JARVIS2-bin-64-Linux/
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
time ./JARVIS2 -lr 0.005 -hs 86 -rm 2000:15:1:0.9:7:0.3:1:0.2:250000 -cm 1:1:0:0.7/0:0:0:0 -cm 4:1:0:0.85/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 11:1:1:0.85/0:0:0:0 -cm 14:20:1:0.85/1:1:1:0.9 HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt;
#
# Data decompression:
time ./JARVIS -d HS.seq.jc 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq.jc.jd HS.seq > cmp.txt;
#
