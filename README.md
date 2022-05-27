
## <b>How compressible is a human genome?</b> ##

<p align="right">This repository provides information-reproducibility on how compressible a human genome is (T2T Chm13 version 2.0) using <b>GeCo3</b> ([Article](https://doi.org/10.1093/gigascience/giaa119), [Code](https://github.com/cobilab/geco3)) as a data compressor with specific models in the setup parameters.</p>

### Results: ###

GeCo3 compressed the 3,117,292,120 DNA symbols to:

<br>

| Rank |Bytes       |Bps    | Time (m) | Memory (GB) | Script  | Factor |
|------|------------|-------|----------|-------------|---------|--------|
| 1    |578,588,274 | 1.485 | 101      | 3.3         | Run1.sh |![26%](https://progress-bar.dev/26) |

<br>

<p align="justify">The base line of 2 bits per symbol is used to calculate the (data compression) Factor. The computations ran in a Laptop computer running Linux with 11th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8, 8 GB of RAM, and an SSD disk of 512 GB. The ranking is given by the lowest number of bytes (Kolmogorov approximation).</p>

### Parameters

Run1.sh:
<pre>
GeCo3 -v -tm 3:1:0:0:0.7/0:0:0 -tm 19:1000:1:20:0.9/3:20:0.9 HS.seq
</pre>

### Reproducibility: ###

Change directory and give permitions:
<pre>
cd scripts/
chmod +x Run1.sh
</pre>

To replicate each run:
<pre>
./Run1.sh
</pre>

