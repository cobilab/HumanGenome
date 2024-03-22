
## <b>How compressible is a human genome sequence?</b> ##

<br>

<p align="justify">This repository provides information-reproducibility on how compressible a human genome sequence is (T2T Chm13 version 2.0 [<a href="https://doi.org/10.1126/science.abj6987">article</a>,<a href="https://s3-us-west-2.amazonaws.com/human-pangenomics/T2T/CHM13/assemblies/analysis_set/chm13v2.0.fa.gz">sequence</a>]) using different data compressors.</p>

### Results: ###

The 3,117,292,120 human DNA symbols have been compressed (lossless) to

<br>
<div align="center">


| Rank     |Bytes       |Bps    |Time (m)|RAM (GB)| Program | Replication | Factor (*) |
|----------|------------|-------|--------|--------|---------|-----------|--------|
| 1        |543,855,534 | 1.395 | 381    | 28.8   | JARVIS2 | ![Run52](https://github.com/pratas/HumanGenome/blob/main/scripts/Run52.sh) |![30%](https://progress-bar.dev/30) |
| 2        |544,059,173 | 1.396 | 389    | 28.8   | JARVIS2 | ![Run51](https://github.com/pratas/HumanGenome/blob/main/scripts/Run51.sh) |![30%](https://progress-bar.dev/30) |
| 3        |544,267,353 | 1.396 | 420    | 27.4   | JARVIS2 | ![Run50](https://github.com/pratas/HumanGenome/blob/main/scripts/Run50.sh) |![30%](https://progress-bar.dev/30) |
| 4        |544,292,577 | 1.397 | 399    | 26.9   | JARVIS2 | ![Run49](https://github.com/pratas/HumanGenome/blob/main/scripts/Run49.sh) |![30%](https://progress-bar.dev/30) |
| 5        |545,960,947 | 1.401 | 283    | 26.9   | JARVIS2 | ![Run48](https://github.com/pratas/HumanGenome/blob/main/scripts/Run48.sh) |![30%](https://progress-bar.dev/30) |
| 6        |549,594,830 | 1.410 | 284    | 11     | JARVIS2 | ![Run47](https://github.com/pratas/HumanGenome/blob/main/scripts/Run47.sh) |![30%](https://progress-bar.dev/30) |
| 7        |550,041,600 | 1.411 | 340    | 18.8   | JARVIS2 | ![Run45](https://github.com/pratas/HumanGenome/blob/main/scripts/Run45.sh) |![29%](https://progress-bar.dev/29) |
| 8        |550,051,840 | 1.411 | 309    | 18.8   | JARVIS2 | ![Run43](https://github.com/pratas/HumanGenome/blob/main/scripts/Run43.sh) |![29%](https://progress-bar.dev/29) |
| 9        |550,379,520 | 1.412 | 279    | 18.7   | JARVIS2 | ![Run42](https://github.com/pratas/HumanGenome/blob/main/scripts/Run42.sh) |![29%](https://progress-bar.dev/29) |
| 10       |554,823,680 | 1.423 | 253    | 18.7   | JARVIS2 | ![Run44](https://github.com/pratas/HumanGenome/blob/main/scripts/Run44.sh) |![29%](https://progress-bar.dev/29) |
| 11       |554,985,480 | 1.424 | 219    | 4.1    | JARVIS2 | ![Run46](https://github.com/pratas/HumanGenome/blob/main/scripts/Run46.sh) |![29%](https://progress-bar.dev/29) |
| 12       |555,412,871 | 1.425 | 690    | 24.8   | GeCo3   | ![Run39](https://github.com/pratas/HumanGenome/blob/main/scripts/Run39.sh) |![29%](https://progress-bar.dev/29) |
| 13       |555,679,745 | 1.426 | 616    | 24.3   | GeCo3   | ![Run32](https://github.com/pratas/HumanGenome/blob/main/scripts/Run32.sh) |![29%](https://progress-bar.dev/29) |
| 14       |555,977,522 | 1.427 | 488    | 22.2   | GeCo3   | ![Run31](https://github.com/pratas/HumanGenome/blob/main/scripts/Run31.sh) |![29%](https://progress-bar.dev/29) |
| 15       |556,415,717 | 1.428 | 427    | 19.7   | GeCo3   | ![Run27](https://github.com/pratas/HumanGenome/blob/main/scripts/Run27.sh) |![29%](https://progress-bar.dev/29) |
| 16       |557,100,364 | 1.430 | 428    | 17.2   | GeCo3   | ![Run26](https://github.com/pratas/HumanGenome/blob/main/scripts/Run26.sh) |![29%](https://progress-bar.dev/29) |
| 17       |557,438,004 | 1.431 | 426    | 15.7   | GeCo3   | ![Run24](https://github.com/pratas/HumanGenome/blob/main/scripts/Run24.sh) |![29%](https://progress-bar.dev/29) |
| 18       |557,995,100 | 1.432 | 406    | 14.6   | GeCo3   | ![Run23](https://github.com/pratas/HumanGenome/blob/main/scripts/Run23.sh) |![28%](https://progress-bar.dev/28) |
| 19       |558,343,430 | 1.433 | 396    | 13.3   | GeCo3   | ![Run20](https://github.com/pratas/HumanGenome/blob/main/scripts/Run20.sh) |![28%](https://progress-bar.dev/28) |
| 20       |559,124,034 | 1.435 | 425    | 11.6   | GeCo3   | ![Run11](https://github.com/pratas/HumanGenome/blob/main/scripts/Run11.sh) |![28%](https://progress-bar.dev/28) |
| 21       |560,694,405 | 1.439 | 354    | 12.8   | GeCo3   | ![Run10](https://github.com/pratas/HumanGenome/blob/main/scripts/Run10.sh) |![28%](https://progress-bar.dev/28) |
| 22       |560,982,904 | 1.440 | 416    | 8.1    | GeCo3   | ![Run25](https://github.com/pratas/HumanGenome/blob/main/scripts/Run25.sh) |![28%](https://progress-bar.dev/28) |
| 23       |561,644,781 | 1.441 | 280    | 11.3   | GeCo3   | ![Run9](https://github.com/pratas/HumanGenome/blob/main/scripts/Run9.sh) |![28%](https://progress-bar.dev/28) |
| 24       |562,253,393 | 1.443 | 281    | 11.3   | GeCo3   | ![Run5](https://github.com/pratas/HumanGenome/blob/main/scripts/Run5.sh) |![28%](https://progress-bar.dev/28) |
| 25       |564,282,192 | 1.448 | 222    | 6.3    | GeCo3   | ![Run4](https://github.com/pratas/HumanGenome/blob/main/scripts/Run4.sh) |![28%](https://progress-bar.dev/28) |
| 26       |564,613,120 | 1.449 | 82     | 4.5    | JARVIS2 | ![Run53](https://github.com/pratas/HumanGenome/blob/main/scripts/Run53.sh) |![28%](https://progress-bar.dev/28) |
| 27       |564,913,725 | 1.450 | 262    | 7.3    | GeCo3   | ![Run3](https://github.com/pratas/HumanGenome/blob/main/scripts/Run3.sh) |![28%](https://progress-bar.dev/28) |
| 28       |566,108,106 | 1.453 | 54     | 8.4    | JARVIS2 | ![Run54](https://github.com/pratas/HumanGenome/blob/main/scripts/Run54.sh) |![27%](https://progress-bar.dev/27) |
| 29       |566,387,531 | 1.454 | 215    | 6.3    | GeCo3   | ![Run2](https://github.com/pratas/HumanGenome/blob/main/scripts/Run2.sh) |![27%](https://progress-bar.dev/27) |
| 30       |575,830,095 | 1.478 | 94     | 2.9    | GeCo3   | ![Run41](https://github.com/pratas/HumanGenome/blob/main/scripts/Run41.sh) |![26%](https://progress-bar.dev/26) |
| 31       |576,296,690 | 1.479 | 37     | 5.9    | JARVIS2 | ![Run55](https://github.com/pratas/HumanGenome/blob/main/scripts/Run55.sh) |![26%](https://progress-bar.dev/26) |
| 32       |577,672,973 | 1.482 | 88     | 1.9    | GeCo3   | ![Run40](https://github.com/pratas/HumanGenome/blob/main/scripts/Run40.sh) |![26%](https://progress-bar.dev/26) |
| 33       |578,588,274 | 1.485 | 101    | 3.3    | GeCo3   | ![Run1](https://github.com/pratas/HumanGenome/blob/main/scripts/Run1.sh) |![26%](https://progress-bar.dev/26) |
| 34       |581,917,199 | 1.493 | 97     | 1.8    | GeCo3   | ![Run17](https://github.com/pratas/HumanGenome/blob/main/scripts/Run17.sh) |![25%](https://progress-bar.dev/25) |
| 35       |583,746,074 | 1.498 | 86     | 3.3    | GeCo3   | ![Run21](https://github.com/pratas/HumanGenome/blob/main/scripts/Run21.sh) |![25%](https://progress-bar.dev/25) |
| 36       |589,813,339 | 1.514 | 17,465 | 0.6    | nncp    | ![Run14](https://github.com/pratas/HumanGenome/blob/main/scripts/Run14.sh) |![24%](https://progress-bar.dev/24) |
| 37       |603,726,643 | 1.549 | 71     | 3.3    | GeCo3   | ![Run22](https://github.com/pratas/HumanGenome/blob/main/scripts/Run22.sh) |![23%](https://progress-bar.dev/23) |
| 38       |607,749,667 | 1.560 | 22     | 2.5    | MFCompress | ![Run30](https://github.com/pratas/HumanGenome/blob/main/scripts/Run30.sh) |![22%](https://progress-bar.dev/22) |
| 39       |607,835,665 | 1.560 | 48     | 1.8    | GeCo2   | ![Run8](https://github.com/pratas/HumanGenome/blob/main/scripts/Run8.sh) |![22%](https://progress-bar.dev/22) |
| 40       |609,579,746 | 1.564 | 171    | 13.8   | JARVIS  | ![Run18](https://github.com/pratas/HumanGenome/blob/main/scripts/Run18.sh) |![22%](https://progress-bar.dev/22) |
| 41       |612,331,601 | 1.571 | 4,588  | 1.6    | paq8l   | ![Run12](https://github.com/pratas/HumanGenome/blob/main/scripts/Run12.sh) |![21%](https://progress-bar.dev/21) |
| 42       |614,339,951 | 1.577 | 39     | 28.5   | bsc-m03 | ![Run38](https://github.com/pratas/HumanGenome/blob/main/scripts/Run38.sh) |![21%](https://progress-bar.dev/21) |
| 43       |614,919,247 | 1.578 | 39     | 20.4   | bsc-m03 | ![Run37](https://github.com/pratas/HumanGenome/blob/main/scripts/Run37.sh) |![21%](https://progress-bar.dev/21) |
| 44       |618,241,906 | 1.587 | 39     | 16.3   | bsc-m03 | ![Run36](https://github.com/pratas/HumanGenome/blob/main/scripts/Run36.sh) |![21%](https://progress-bar.dev/21) |
| 45       |619,369,574 | 1.590 | 20     | 2.0    | GeCo2   | ![Run7](https://github.com/pratas/HumanGenome/blob/main/scripts/Run7.sh) |![21%](https://progress-bar.dev/21) |
| 46       |619,837,647 | 1.591 | 12     | 0.6    | MFCompress | ![Run29](https://github.com/pratas/HumanGenome/blob/main/scripts/Run29.sh) |![21%](https://progress-bar.dev/21) |
| 47       |620,837,061 | 1.593 | 39     | 11.2   | bsc-m03 | ![Run35](https://github.com/pratas/HumanGenome/blob/main/scripts/Run35.sh) |![20%](https://progress-bar.dev/20) |
| 48       |625,647,034 | 1.606 | 38     | 5.6    | bsc-m03 | ![Run34](https://github.com/pratas/HumanGenome/blob/main/scripts/Run34.sh) |![20%](https://progress-bar.dev/20) |
| 49       |625,753,521 | 1.606 | 11     | 0.6    | MFCompress | ![Run28](https://github.com/pratas/HumanGenome/blob/main/scripts/Run28.sh) |![20%](https://progress-bar.dev/20) |
| 50       |628,342,060 | 1.613 | 18     | 0.5    | GeCo2   | ![Run6](https://github.com/pratas/HumanGenome/blob/main/scripts/Run6.sh) |![19%](https://progress-bar.dev/19) |
| 51       |639,222,915 | 1.640 | 43     | 0.8    | NAF-22  | ![Run16](https://github.com/pratas/HumanGenome/blob/main/scripts/Run16.sh) |![18%](https://progress-bar.dev/18) |
| 52       |646,062,792 | 1.658 | 84     | 0.6    | lzma -9 | ![Run15](https://github.com/pratas/HumanGenome/blob/main/scripts/Run15.sh) |![17%](https://progress-bar.dev/17) |
| 53       |661,591,088 | 1.698 | 36     | 0.05   | bsc-m03 | ![Run33](https://github.com/pratas/HumanGenome/blob/main/scripts/Run33.sh) |![15%](https://progress-bar.dev/15) |
| 54       |752,793,986 | 1.932 | 5      | 0.001  | bzip2 -9| ![Run19](https://github.com/pratas/HumanGenome/blob/main/scripts/Run19.sh) |![3%](https://progress-bar.dev/3) |
| Baseline |779,323,017 | 2.000 | -      | -      | 2 BPS   |-          |![0%](https://progress-bar.dev/0) |

</div>
<br>

<p align="justify">(*) The base line of 2 bits per symbol is used to calculate the (data compression) Factor, which represents the proportion of the sequence that has been fully compressed and is given by 100-((CompressedBytes*8)/(3117292120*2)*100). The Run1.sh and Run4.sh ran in a Laptop computer running Linux with 11th Gen Intel® Core™ i5-1135G7 @ 2.40GHz × 8, 8 GB of RAM, and an SSD disk of 512 GB. The remaining computations ran in a Desktop computer running Linux with Intel® Core™ i7-6700 CPU @ 3.40GHz × 8, 31,2 GiB RAM, and disk of 3 TB. The ranking is given by the lowest number of bytes (Kolmogorov complexity approximation).</p>

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
| JARVIS          |<a href="https://github.com/cobilab/jarvis">code</a>  | <a href="https://doi.org/10.3390/e21111074">article</a>|
| bzip2 1.0.8     |<a href="https://sourceware.org/bzip2/">code</a>  | <a href="https://sourceware.org/bzip2/">article</a>|
| MFCompress      |<a href="http://sweet.ua.pt/ap/software/mfcompress/MFCompress-linux64-1.01.tgz">code</a>  | <a href="https://doi.org/10.1093/bioinformatics/btt594">article</a>|
| bsc-m03 v0.2.1  |<a href="https://github.com/IlyaGrebnov/bsc-m03">code</a>  | <a href="https://github.com/IlyaGrebnov/bsc-m03">article</a>|
| JARVIS2         |<a href="https://github.com/cobioders/jarvis2">code</a>  | <a href="https://doi.org/10.1109/DCC55655.2023.00037">article</a> |
| JARVIS3         |<a href="https://github.com/cobioders/jarvis3">code</a>  | - |
| Zstandard       |<a href="https://github.com/facebook/zstd">code</a>  | <a href="https://facebook.github.io/zstd/">base</a> |

</div>
<br>

### Reproducibility: ###

Change directory and give permitions:
<pre>
cd scripts/
chmod +x Run*.sh
</pre>

To replicate each run, use the respective replication script.
