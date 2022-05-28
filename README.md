<br>

## <b>How compressible is a human genome?</b> ##

<br>

<p align="justify">This repository provides information-reproducibility on how compressible a human genome is (T2T Chm13 version 2.0) using <b>GeCo3</b> (<a href="https://doi.org/10.1093/gigascience/giaa119">article</a>, <a href="https://github.com/cobilab/geco3">code</a>) as a data compressor with specific models in the setup parameters.</p>

### Results: ###

GeCo3 compressed the 3,117,292,070 human DNA symbols to:

<br>
<div align="center">


| Rank     |Bytes       |Bps    | Time (m) | RAM (GB) | Replicate | Factor |
|----------|------------|-------|----------|----------|-----------|--------|
| 1        |564,437,376 | 1.449 | 219      | 6.3      | Run4.sh   |![28%](https://progress-bar.dev/28) |
| 2        |564,913,725 | 1.450 | 262      | 7.3      | Run3.sh   |![28%](https://progress-bar.dev/28) |
| 3        |566,387,531 | 1.454 | 215      | 6.3      | Run2.sh   |![27%](https://progress-bar.dev/27) |
| 4        |578,588,274 | 1.485 | 101      | 3.3      | Run1.sh   |![26%](https://progress-bar.dev/26) |
| Baseline |779,323,017 | 2.000 | -        | -        | -         |![0%](https://progress-bar.dev/0) |

</div>
<br>

<p align="justify">The base line of 2 bits per symbol is used to calculate the (data compression) Factor. The Run1.sh and Run4.sh ran in a Laptop computer running Linux with 11th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8, 8 GB of RAM, and an SSD disk of 512 GB. The Run2.sh and Run3.sh ran in a Laptop computer running Linux with Intel® Core™ i7-8650U CPU @ 1.90GHz × 8, 16 GB RAM, and an SSD of 512 GB. The ranking is given by the lowest number of bytes (Kolmogorov complexity approximation).</p>

### Parameters:

Run1.sh:
<pre>
GeCo3 -v -tm 3:1:0:0:0.7/0:0:0 -tm 19:1000:1:20:0.9/3:20:0.9 HS.seq
</pre>

Run2.sh:
<pre>
GeCo3 -v -lr 0.03 -hs 64 -tm 3:1:0:1:0.70/0:0:0 -tm 13:50:0:1:0.9/0:1:0.9 -tm 19:1500:1:40:0.88/3:20:0.88 HS.seq
</pre>

Run3.sh:
<pre>
GeCo3 -v -lr 0.03 -hs 72 -tm 1:1:0:0:0.6/0:0:0 -tm 3:1:0:1:0.70/0:0:0 -tm 8:1:0:1:0.85/0:0:0 -tm 13:20:0:1:0.9/0:1:0.9 -tm 20:1500:1:50:0.9/4:10:0.9 HS.seq
</pre>

Run4.sh:
<pre>
GeCo3 -v -lr 0.02 -hs 86 -tm 1:1:0:0:0.6/0:0:0 -tm 3:1:2:0:0.70/0:0:0 -tm 2:1:1:0:0.9/0:0:0 -tm 3:1:0:0:0.8/0:0:0 -tm 6:1:0:0:0.7/0:0:0 -tm 11:20:0:0:0.88/0:0:0 -tm 13:50:1:1:0.89/0:1:0.89 -tm 19:1500:1:40:0.88/3:20:0.88 HS.seq
</pre>


### Reproducibility: ###

Change directory and give permitions:
<pre>
cd scripts/
chmod +x Run*.sh
</pre>

To replicate each run:
<pre>
./Run1.sh
./Run2.sh
./Run3.sh
./Run4.sh
</pre>

