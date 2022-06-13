#!/bin/bash
#
# Install tools:
rm MFCompress-linux64-1.01.tgz MFCompress-linux64-1.01/ -fr
wget http://sweet.ua.pt/ap/software/mfcompress/MFCompress-linux64-1.01.tgz
tar -xvzf MFCompress-linux64-1.01.tgz
cp MFCompress-linux64-1.01/MFCompressC .
cp MFCompress-linux64-1.01/MFCompressD .
conda install -c bioconda seqtk -y
#
# Download T2T chm13 v2.0 genome:
rm -f chm13v2.0.fa.gz
wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa.gz
#
# Filter non ACGT data:
gunzip -f -k chm13v2.0.fa.gz;
seqtk seq -U chm13v2.0.fa > HS.fa;
#
# Data compression:
time ./MFCompressC -o HS.mfc -v -1 -p 1 -t 1 HS.fa 1> report_c_stdout.txt 2> report_c_stderr.txt;
#
# Data decompression:
time ./MFCompressD -v -o HS.d HS.mfc 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.fa HS.d > cmp.txt;
#
