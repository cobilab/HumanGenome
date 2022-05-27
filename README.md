
## <b>How compressible is a human genome?</b> ##

This repository provides information-reproducibility on how compressible a human genome is (T2T Chm13 version 2.0) using <b>GeCo3</b> ([Article](https://doi.org/10.1093/gigascience/giaa119), [Code](https://github.com/cobilab/geco3)) as a data compressor with specific models in the setup parameters.

### Results: ###

This is the proportion that GeCo3 is still unable to compress from a human genome:

![75%](https://progress-bar.dev/75)

GeCo3 was able to compress 25% (75% still without compression) of a human genome assuming the base line of 2 bits per symbol and the following compression models:
<pre>
GeCo3 -v -tm 3:1:0:0:0.7/0:0:0 -tm 19:1000:1:20:0.9/3:20:0.9 HS.seq
</pre>

GeCo3 required <b>3.3 GB of RAM</b> and <b>200 minutes</b> for computing the compression run on a Laptop computer running Linux with 11th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8, 8 GB of RAM, and an SSD disk of 512 GB.

### Reproducibility: ###

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

