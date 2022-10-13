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
time ./JARVIS2.sh --level "-lr 0.01 -hs 42 -rm 500:12:0.1:0.9:7:0.4:1:0.2:220000 -cm 1:1:0:0.7/0:0:0:0 -cm 7:1:0:0.7/0:0:0:0 -cm 12:1:1:0.85/0:0:0:0"  --block 560MB --threads 6 --dna --input HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt;
ls -la HS.seq.tar 1>> report_c_stdout.txt 2>> report_c_stderr.txt;
#
# Data decompression:
time ./JARVIS2.sh  --decompress --threads 6 --dna --input HS.seq.tar 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq.tar.out HS.seq > cmp.txt;
#
