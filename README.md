
## <b>How compressible is a human genome?</b> ##

This repository provides information-reproducibility on how compressible a human genome is (T2T Chm13 version 2.0) using <b>GeCo3</b> ([Article](https://doi.org/10.1093/gigascience/giaa119), [Code](https://github.com/cobilab/geco3)) with specific models in the setup parameters.

### Results:




### Reproducibility:

#### Install tools:
<pre>
conda install -c bioconda geco3 -y
conda install -c bioconda seqtk -y
</pre>

#### Download T2T chm13 v2.0 genome:
<pre>
wget https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa.gz
</pre>

#### Filter non ACGT data:

<pre>
gunzip -k chm13v2.0.fa.gz; 
seqtk seq -U chm13v2.0.fa | tr -d -c "ACGT" > HS.seq;
</pre>
or
<pre>
zcat chm13v2.0.fa.gz | grep -v ">" | tr -d -c "ACGT" > HS.seq;
</pre>

#### Data compression:

<pre>
time GeCo3 -v -tm 3:1:0:0:0.7/0:0:0 -tm 19:1000:1:20:0.9/3:20:0.9 HS.seq 1> report_c_stdout.txt 2> report_c_stderr.txt;
</pre>
Notice that the models used here are -tm 3:1:0:0:0.7/0:0:0 -tm 19:1000:1:20:0.9/3:20:0.9 . These models can be optimized in balance with the computational RAM and time, and the data compression ratio.

#### Data decompression:
<pre>
time GeDe3 -v HS.seq.co 1> report_d_stdout.txt 2> report_d_stderr.txt;
</pre>

#### Lossless validation:
<pre>
cmp HS.seq.de HS.seq > cmp.txt;
</pre>

