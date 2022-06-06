
## <b>How compressible is a human genome sequence?</b> ##

<br>

<p align="justify">This repository provides information-reproducibility on how compressible a human genome is (T2T Chm13 version 2.0 [<a href="https://doi.org/10.1126/science.abj6987">article</a>,<a href="https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa.gz">sequence</a>]) using different data compressors.</p>

### Results: ###

The 3,117,292,120 human DNA symbols have been compressed to:

<br>
<div align="center">


| Rank     |Bytes       |Bps    | Time (m) | RAM (GB) | Program | Replication | Factor |
|----------|------------|-------|----------|----------|---------|-----------|--------|
| 1        |(running)   | ?     | ?        | 0.6      | nncp    | ![Run14](https://github.com/pratas/HumanGenome/blob/main/scripts/Run14.sh) |![50%](https://progress-bar.dev/50) |
| 2        |559,124,034 | 1.435 | 425      | 13.3     | GeCo3   | ![Run11](https://github.com/pratas/HumanGenome/blob/main/scripts/Run11.sh) |![28%](https://progress-bar.dev/28) |
| 3        |560,694,405 | 1.439 | 354      | 12.8     | GeCo3   | ![Run10](https://github.com/pratas/HumanGenome/blob/main/scripts/Run10.sh) |![28%](https://progress-bar.dev/28) |
| 4        |561,644,781 | 1.441 | 280      | 11.3     | GeCo3   | ![Run9](https://github.com/pratas/HumanGenome/blob/main/scripts/Run9.sh) |![28%](https://progress-bar.dev/28) |
| 5        |562,253,393 | 1.443 | 281      | 11.3     | GeCo3   | ![Run5](https://github.com/pratas/HumanGenome/blob/main/scripts/Run5.sh) |![28%](https://progress-bar.dev/28) |
| 6        |564,282,192 | 1.448 | 222      | 6.3      | GeCo3   | ![Run4](https://github.com/pratas/HumanGenome/blob/main/scripts/Run4.sh) |![28%](https://progress-bar.dev/28) |
| 7        |564,913,725 | 1.450 | 262      | 7.3      | GeCo3   | ![Run3](https://github.com/pratas/HumanGenome/blob/main/scripts/Run3.sh) |![28%](https://progress-bar.dev/28) |
| 8       |566,387,531 | 1.454 | 215      | 6.3      | GeCo3   | ![Run2](https://github.com/pratas/HumanGenome/blob/main/scripts/Run2.sh) |![27%](https://progress-bar.dev/27) |
| 9       |578,588,274 | 1.485 | 101      | 3.3      | GeCo3   | ![Run1](https://github.com/pratas/HumanGenome/blob/main/scripts/Run1.sh) |![26%](https://progress-bar.dev/26) |
| 10       |581,917,199 | 1.493 | 97      | 1.8      | GeCo3   | ![Run17](https://github.com/pratas/HumanGenome/blob/main/scripts/Run17.sh) |![25%](https://progress-bar.dev/25) |
| 11       |607,835,665 | 1.560 | 48       | 1.8      | GeCo2   | ![Run8](https://github.com/pratas/HumanGenome/blob/main/scripts/Run8.sh) |![22%](https://progress-bar.dev/22) |
| 12       |612,331,601  | 1.571   | 4,588   | 1.6      | paq8l   | ![Run12](https://github.com/pratas/HumanGenome/blob/main/scripts/Run12.sh) |![21%](https://progress-bar.dev/21) |
| 13       |619,369,574 | 1.590 | 20       | 2.0      | GeCo2   | ![Run7](https://github.com/pratas/HumanGenome/blob/main/scripts/Run7.sh) |![21%](https://progress-bar.dev/21) |
| 14       |628,342,060 | 1.613 | 18       | 0.5      | GeCo2   | ![Run6](https://github.com/pratas/HumanGenome/blob/main/scripts/Run6.sh) |![19%](https://progress-bar.dev/19) |
| 15       |639,222,915 | 1.640 | 43       | 0.8      | NAF-22  | ![Run16](https://github.com/pratas/HumanGenome/blob/main/scripts/Run16.sh) |![18%](https://progress-bar.dev/18) |
| 16       |646,062,792 | 1.658 | 84       | 0.6      | lzma -9 | ![Run15](https://github.com/pratas/HumanGenome/blob/main/scripts/Run15.sh) |![17%](https://progress-bar.dev/17) |
| Baseline |779,323,017 | 2.000 | -        | -        | 2 BPS   |-          |![0%](https://progress-bar.dev/0) |

</div>
<br>

<p align="justify">The base line of 2 bits per symbol is used to calculate the (data compression) Factor. The Run1.sh and Run4.sh ran in a Laptop computer running Linux with 11th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8, 8 GB of RAM, and an SSD disk of 512 GB. The remaining computations ran in a Laptop computer running Linux with Intel® Core™ i7-8650U CPU @ 1.90GHz × 8, 16 GB RAM, and an SSD of 512 GB. The ranking is given by the lowest number of bytes (Kolmogorov complexity approximation). Decompression is approximately symmetric.</p>

### Data compression tools ###

<br>
<div align="center">

| Data Compressor | Repository | Description  |
|-----------------|------------|--------------|
| GeCo3           |<a href="https://github.com/cobilab/geco3">code</a>  | <a href="https://doi.org/10.1093/gigascience/giaa119">article</a>|
| GeCo2           |<a href="https://github.com/cobilab/geco2">code</a>  | <a href="https://link.springer.com/chapter/10.1007/978-3-030-23873-5_17">article</a>|
| paq8l           |<a href="http://mattmahoney.net/dc/paq8l.zip">code</a>  | <a href="http://mattmahoney.net/dc/#paq">article</a>|
| nncp v3.1       |<a href="https://bellard.org/nncp/">code</a>  | <a href="https://bellard.org/nncp/nncp_v2.pdf">article</a>|
| NAF             |<a href="https://github.com/KirillKryukov/naf">code</a>  | <a href="https://doi.org/10.1093/bioinformatics/btz144">article</a>|
| lzma 5.2.5      |<a href="https://tukaani.org/xz/">code</a>  | <a href="https://tukaani.org/xz/">article</a>|

</div>
<br>

### Reproducibility: ###

Change directory and give permitions:
<pre>
cd scripts/
chmod +x Run*.sh
</pre>

To replicate each run, use the respective replication script.
