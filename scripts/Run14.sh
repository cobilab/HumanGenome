#!/bin/bash
#
# Install tools:
conda install -c bioconda seqtk -y
#
rm -fr nncp-2021-06-01.tar.gz nncp-2021-06-01/
wget https://bellard.org/nncp/nncp-2021-06-01.tar.gz
tar -vxzf nncp-2021-06-01.tar.gz
cd nncp-2021-06-01/
make
cp nncp ../
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
time ./nncp c HS.seq HS.nncp 1> report_c_stdout.txt 2> report_c_stderr.txt

# Data decompression:
time ./nncp d HS.nncp Hs.seq.de 1> report_d_stdout.txt 2> report_d_stderr.txt;
#
# Lossless validation:
cmp HS.seq.de HS.seq > cmp.txt;
#
