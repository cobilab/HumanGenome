#!/bin/bash
#
# Install tools:
# conda install -c bioconda seqtk -y
# git clone https://github.com/cobilab/jarvis3
# cd jarvis3/src/
# make
# cp JARVIS3 ../../
# cd ../../
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
time ./JARVIS3 -lr 0.01 -hs 248 -cm 1:1:0:0.9/0:0:0:0 -cm 3:1:0:0.9/0:0:0:0 -cm 6:1:0:0.9/0:0:0:0 -cm 9:1:0:0.9/0:0:0:0 -cm 11:10:1:0.9/0:0:0:0 -cm 14:200:1:0.9/1:10:1:0.9 -rm 300:14:0.88:7:0.85:0:0.01:4 -rm 300:14:0.88:7:0.85:2:0.01:4 -rm 500:12:0.88:7:0.85:0:0.01:15 HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt;
ls -la HS.seq.tar 1>> report_c_stdout.txt 2>> report_c_stderr.txt;
#
# Data decompression:
time ./JARVIS3 -d HS.seq.jc 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq.jc.jd HS.seq > cmp.txt;
#
