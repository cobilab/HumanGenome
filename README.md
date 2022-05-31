<br>

## <b>How compressible is a human genome sequence?</b> ##

<br>

<p align="justify">This repository provides information-reproducibility on how compressible a human genome is (T2T Chm13 version 2.0) using <b>GeCo3</b> (<a href="https://doi.org/10.1093/gigascience/giaa119">article</a>, <a href="https://github.com/cobilab/geco3">code</a>) as a data compressor with specific models in the setup parameters.</p>

### Results: ###

GeCo3 compressed the 3,117,292,070 human DNA symbols (using one core) to:

<br>
<div align="center">


| Rank     |Bytes       |Bps    | Time (m) | RAM (GB) | Program | Replicate | Factor |
|----------|------------|-------|----------|----------|---------|-----------|--------|
| 1        |560,694,405 | 1.439 | 354      | 12.8     | GeCo3   | Run10.sh  |![28%](https://progress-bar.dev/28) |
| 2        |561,644,781 | 1.441 | 280      | 11.3     | GeCo3   | Run9.sh   |![28%](https://progress-bar.dev/28) |
| 3        |562,253,393 | 1.443 | 281      | 11.3     | GeCo3   | Run5.sh   |![28%](https://progress-bar.dev/28) |
| 4        |564,282,192 | 1.448 | 222      | 6.3      | GeCo3   | Run4.sh   |![28%](https://progress-bar.dev/28) |
| 5        |564,913,725 | 1.450 | 262      | 7.3      | GeCo3   | Run3.sh   |![28%](https://progress-bar.dev/28) |
| 6        |566,387,531 | 1.454 | 215      | 6.3      | GeCo3   | Run2.sh   |![27%](https://progress-bar.dev/27) |
| 7        |578,588,274 | 1.485 | 101      | 3.3      | GeCo3   | Run1.sh   |![26%](https://progress-bar.dev/26) |
| 8        |607,835,665 | 1.560 | 48       | 1.8      | GeCo2   | Run8.sh   |![22%](https://progress-bar.dev/22) |
| 9        |619,369,574 | 1.590 | 20       | 2.0      | GeCo2   | Run7.sh   |![21%](https://progress-bar.dev/21) |
| 10       |628,342,060 | 1.613 | 18       | 0.5      | GeCo2   | Run6.sh   |![19%](https://progress-bar.dev/19) |
| Baseline |779,323,017 | 2.000 | -        | -        | 2 BPS   |-          |![0%](https://progress-bar.dev/0) |

</div>
<br>

<p align="justify">The base line of 2 bits per symbol is used to calculate the (data compression) Factor. The Run1.sh and Run4.sh ran in a Laptop computer running Linux with 11th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8, 8 GB of RAM, and an SSD disk of 512 GB. The remaining computations ran in a Laptop computer running Linux with Intel® Core™ i7-8650U CPU @ 1.90GHz × 8, 16 GB RAM, and an SSD of 512 GB. The ranking is given by the lowest number of bytes (Kolmogorov complexity approximation). Decompression is approximately symmetric.</p>

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
./Run5.sh
./Run6.sh
./Run7.sh
./Run8.sh
./Run9.sh
./Run10.sh
</pre>

