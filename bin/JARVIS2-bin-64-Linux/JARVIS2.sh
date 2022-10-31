#!/bin/bash
#
HELP=0;
ABOUT=0;
DECOMPRESS=0;
INSTALL=0;
SHOW=0;
TYPE=0;
LEVEL=9;
BLOCK="24MB";
THREADS="8";
#
################################################################################
#
SHOW_MENU () {
  echo " -------------------------------------------------------";
  echo "                                                        ";
  echo " JARVIS2, v1.0. High reference-free compression of DNA  ";
  echo "                sequences, FASTA data, and FASTQ data.  ";
  echo "                                                        ";
  echo " Program options ---------------------------------------";
  echo "                                                        ";
  echo " -h, --help                   Show this,                ";
  echo " -a, --about                  Show program information, ";
  echo " -c, --install                Install/compile programs, ";
  echo " -s, --show                   Show compression levels,  ";
  echo "                                                        ";
  echo " -l <INT>, --level <INT>      JARVIS2 compression level,";
  echo " -b <INT>, --block <INT>      Block size to be splitted,";
  echo " -t <INT>, --threads <INT>    Number of JARVIS2 threads,";
  echo "                                                        ";
  echo " -dn, --dna                   Assume DNA sequence type, ";
  echo " -fa, --fasta                 Assume FASTA data type,   ";
  echo " -fq, --fastq                 Assume FASTQ data type,   ";
  echo " -au, --automatic             Detect data type (def),   ";
  echo "                                                        ";
  echo " -d, --decompress             Decompression mode,       ";
  echo "                                                        ";
  echo " Input options -----------------------------------------";
  echo "                                                        ";
  echo " -i <FILE>, --input <FILE>    Input DNA filename.       ";
  echo "                                                        ";
  echo " Example -----------------------------------------------";
  echo "                                                        ";
  echo " ./JARVIS2.sh --block 16MB -t 8 -i sample.seq           ";
  echo " ./JARVIS2.sh --decompress -t 4 -i sample.seq.tar       ";
  echo "                                                        ";
  echo " -------------------------------------------------------";
  }
#
################################################################################
#
CHECK_INPUT () {
  FILE=$1
  if [ -f "$FILE" ];
    then
    echo "Input filename: $FILE"
    else
    echo -e "\e[31mERROR: input file not found!\e[0m";
    SHOW_MENU;
    exit;
    fi
  }
#
################################################################################
#
Program_installed () {
  if ! [ -x "$(command -v $1)" ];
    then
    echo -e "\e[41mERROR\e[49m: $1 is not installed." >&2;
    echo -e "\e[42mTIP\e[49m: Try: ./JARVIS2.sh --install" >&2;
    exit 1;
    fi
  }
#
################################################################################
#
SHOW_HEADER () {
  echo "                                                        ";
  echo " [JARVIS2 :: DNA, FASTA, and FASTQ Extensions]          ";
  echo "                                                        ";
  echo " Release year: 2021,                                    ";
  echo " Version: 1.0                                           ";
  echo " Author: D. Pratas                                      ";
  echo " Language: Bash / C                                     ";
  echo " License: GPL v3                                        ";
  echo "                                                        ";
  }
#
################################################################################
#
SHOW_LEVELS () {
  ./JARVIS2 -s
  }
#
################################################################################
#
MERGE_DNA () {
  INPUT="$1";    # "Filename"
  THREADS="$2";  # "8"
  #
  tar -xvf $INPUT 1> .DEC_F_JV2;
  #
  mapfile -t FILES < .DEC_F_JV2;
  #
  D_NAMES="";
  IDX_T=1;
  IDX_POS=1;
  #
  for file in "${FILES[@]}" #
    do
    ./JARVIS2 -d $file 2> .tmp_report_$file &
    if [[ "$IDX_T" -eq "$THREADS" ]] || [[ "${#FILES[@]}" -eq "$IDX_POS" ]]
      then
      wait;
      IDX_T=0;
      fi
    ((++IDX_T));
    ((++IDX_POS));
    done
  #
  rm -f $INPUT.out;
  for file in "${FILES[@]}" #
    do
    cat $file.jd >> $INPUT.out;
    rm -f $file.jd $file .tmp_report_$file
    done
  #
  rm -f .DEC_F_JV2
  }
#
################################################################################
#
SPLIT_DNA () {
  #
  INPUT="$1";
  SIZE="$2";
  THREADS="$3";
  LEVEL="$4";
  #
  split --bytes=$SIZE --verbose $INPUT $INPUT- \
  | tr -d "\'" | awk '{ print $3;}' > .ENC_F_JV2 2> .tmp_report;
  #
  mapfile -t FILES < .ENC_F_JV2;
  #
  C_NAMES="";
  IDX_T=1;
  IDX_POS=1;
  #
  for file in "${FILES[@]}" #
    do
    ./JARVIS2 $LEVEL $file 2> .tmp_report_$file &
    if [[ "$IDX_T" -eq "$THREADS" ]] || [[ "${#FILES[@]}" -eq "$IDX_POS" ]]
      then
      wait;
      IDX_T=0;
      fi
    C_NAMES+=" $file.jc ";
    ((++IDX_T));
    ((++IDX_POS));
    done
  #
  tar -cvf $INPUT.tar $C_NAMES 1>> .tmp_report 2>> .tmp_err;
  for file in "${FILES[@]}" #
    do
    rm -f $file.jc $file .tmp_report_$file;
    done
  #
  rm -f .ENC_F_JV2 .tmp_report .tmp_err;
  }	
#
################################################################################
#
if [[ "$#" -lt 1 ]];
  then
  HELP=1;
  fi
#
POSITIONAL=();
#
while [[ $# -gt 0 ]]
  do
  i="$1";
  case $i in
    -h|--help|?)
      HELP=1;
      shift
    ;;
    -a|--about|--version)
      ABOUT=1;
      shift
    ;;
    -c|--install|--compile)
      INSTALL=1;
      shift
    ;;
    -d|--decompress|--uncompress|--decompression)
      DECOMPRESS=1;
      shift
    ;;
    -l|--level|--compression-level|--jarvis2-level|--mode)
      LEVEL="$2";
      shift 2;
    ;;
    -b|--block)
      BLOCK="$2";
      shift 2;
    ;;
    -dn|--dna|--adn|--DNA|--genomic)
      TYPE=1;
      shift 1;
    ;;
    -fa|--fas|--fasta|--FASTA|--Fasta)
      TYPE=2;
      shift 1;
    ;;
    -fq|--faq|--fastq|--FASTQ|--Fastq)
      TYPE=3;
      shift 1;
    ;;
    -au|--automatic|--automat|--auto)
      TYPE=0;
      shift 1;
    ;;
    -t|--threads)
      THREADS="$2";
      shift 2;
    ;;
    -s|--show)
      SHOW=1;
      shift;
    ;;
    -i|--input)
      INPUT="$2";
      shift 2;
    ;;
    -*) # unknown option with small
    echo "Invalid arg ($1)!";
    echo "For help, try: ./JARVIS2.sh -h"
    exit 1;
    ;;
  esac
  done
#
set -- "${POSITIONAL[@]}" # restore positional parameters
#
################################################################################
#
if [[ "$HELP" -eq "1" ]];
  then
  SHOW_MENU;
  exit;
  fi
#
################################################################################
#
if [[ "$SHOW" -eq "1" ]];
  then
  SHOW_LEVELS;
  exit;
  fi
#
################################################################################
#
if [[ "$ABOUT" -eq "1" ]];
  then
  SHOW_HEADER;
  exit;
  fi
#
################################################################################
#
if [[ "$INSTALL" -eq "1" ]];
  then
  echo "Running installation ...";
  cp extra/MergeFastaStreams .
  cp extra/MergeFastqStreams .
  cp extra/SplitFastaStreams .
  cp extra/SplitFastqStreams .
  cp extra/XScoreC .
  cp extra/XScoreD .
  cp extra/bzip2 .
  cp extra/bbb .
  echo "Done!"; 
  exit;
  fi
#
################################################################################
#
if [[ "$DECOMPRESS" -eq "0" ]];
  then
  # COMPRESSION
  #
  CHECK_INPUT "$INPUT";
  #
  Program_installed "./JARVIS2";
  #
  if [[ "$TYPE" -eq "0" ]];
    then
    FIRST=`head -c 1 < $INPUT`;
    if [[ "$FIRST" = ">" ]];
      then 
      TYPE=2;
      elif [[ "$FIRST" = "@" ]];
      then
      TYPE=3;
      else
      TYPE=1;
      fi
    fi
  #
  declare -a TYPE_NAME=("other" "DNA sequence" "FASTA" "FASTQ");  
  #
  echo "Running data type: ${TYPE_NAME[$TYPE]}";
  echo "Maximum Blocksize: $BLOCK";
  echo "Number of threads: $THREADS";
  echo "Compression level: $LEVEL";
  echo "Compressing data ...";
  #
  if [[ "$TYPE" -eq "1" ]]; # DNA SEQUENCE =====================================
    then
    #
    SPLIT_DNA "$INPUT" "$BLOCK" "$THREADS" "$LEVEL"
    wait
    echo "Done!";
    ls -lah $INPUT.tar | awk '{ print "TOTAL:\t"$5; }'
    rm -f DNA.JV2.tar .rep_out_enc
    echo "Compressed file: $INPUT.tar";
    #
    elif [[ "$TYPE" -eq "2" ]]; # FASTA DATA ===================================
    then
    #
    Program_installed "./SplitFastaStreams";
    Program_installed "./bbb";
    Program_installed "./bzip2";
    Program_installed "./JARVIS2";
    ./SplitFastaStreams < $INPUT
    SPLIT_DNA "DNA.JV2" "$BLOCK" "$THREADS" "$LEVEL" &
    ./bbb cfm10q HEADERS.JV2 HEADERS.JV2.bbb &
    ./bzip2 -f EXTRA.JV2 &
    wait
    tar -cvf $INPUT.tar DNA.JV2.tar EXTRA.JV2.bz2 HEADERS.JV2.bbb 1> .rep_out_ec
    echo "Done!";
    ls -lah HEADERS.JV2.bbb | awk '{ print "HEADS:\t"$5; }'
    ls -lah DNA.JV2.tar | awk '{ print "DNA:\t"$5; }'
    ls -lah EXTRA.JV2.bz2 | awk '{ print "EXTRA:\t"$5; }'
    echo "------";
    ls -lah $INPUT.tar | awk '{ print "TOTAL:\t"$5; }'
    rm -f DNA.JV2.tar EXTRA.JV2 HEADERS.JV2 .rep_out_ec
    echo "Compressed file: $INPUT.tar";
    #
    else # FASTQ DATA ==========================================================
    #
    Program_installed "./SplitFastqStreams";
    Program_installed "./bbb";
    Program_installed "./bzip2";
    Program_installed "./XScoreC";
    Program_installed "./JARVIS2";
    ./SplitFastqStreams < $INPUT
    SPLIT_DNA "DNA.JV2" "$BLOCK" "$THREADS" "$LEVEL" &
    ./bzip2 -f N.JV2 &
    ./bbb cfm10q HEADERS.JV2 HEADERS.JV2.bbb &
    ./XScoreC -l 2 QUALITIES.JV2 1> .tmp_report_out_xc 2> .tmp_report_err_xc &
    wait
    tar -cvf $INPUT.tar DNA.JV2.tar N.JV2.bz2 HEADERS.JV2.bbb QUALITIES.JV2.co 1> .rep_main_info;
    echo "Done!";
    ls -lah HEADERS.JV2.bbb | awk '{ print "HEADS:\t"$5; }'
    ls -lah DNA.JV2.tar | awk '{ print "DNA:\t"$5; }'
    ls -lah N.JV2.bz2 | awk '{ print "Ns:\t"$5; }'
    ls -lah QUALITIES.JV2.co | awk '{ print "QUALS:\t"$5; }'
    echo "------";
    ls -lah $INPUT.tar | awk '{ print "TOTAL:\t"$5; }'
    rm -f DNA.JV2 N.JV2 HEADERS.JV2 QUALITIES.JV2 .rep_main_info \
    .tmp_report_out_xc .tmp_report_err_xc;
    echo "Compressed file: $INPUT.tar";
    #	    
    fi
  #
  else 
  # DECOMPRESSION:
  # 
  # Make sure file exits else die
  CHECK_INPUT "$INPUT";
  #
  if [[ "$TYPE" -eq "1" ]]; # DNA SEQUENCE =====================================
    then
    Program_installed "./JARVIS2";
    #
    echo "Decompressing data ...";
    MERGE_DNA "$INPUT" "$THREADS"
    wait
    echo "Done!";
    echo "Decompressed file: $INPUT.out";
    #
    elif [[ "$TYPE" -eq "2" ]]; # FASTA DATA ===================================
    then
    #
    echo "Number of threads: $THREADS";
    Program_installed "./MergeFastaStreams";
    Program_installed "./bbb";
    Program_installed "./bzip2";
    Program_installed "./JARVIS2";
    echo "Decompressing data ...";
    tar -xvf $INPUT 1> .rep_out_dec
    MERGE_DNA "DNA.JV2.tar" "$THREADS" &
    ./bzip2 -d -f EXTRA.JV2.bz2 &
    ./bbb -fqd HEADERS.JV2.bbb HEADERS.JV2 &
    wait
    mv DNA.JV2.tar.out DNA.JV2
    ./MergeFastaStreams > $INPUT.out
    rm -f DNA.JV2.jc DNA.JV2.tar.out EXTRA.JV2.bz2 HEADERS.JV2.bbb .rep_out_dec
    echo "Done!";
    echo "Decompressed file: $INPUT.out";
    #
    else # FASTQ DATA ==========================================================
    #
    echo "Number of threads: $THREADS";
    Program_installed "./MergeFastqStreams";
    Program_installed "./bbb";
    Program_installed "./bzip2";
    Program_installed "./XScoreD";
    Program_installed "./JARVIS2";
    echo "Decompressing data ...";
    tar -xvf $INPUT 1> .rep_main_info;
    ./bbb dqf HEADERS.JV2.bbb HEADERS.JV2 &
    MERGE_DNA "DNA.JV2.tar" "$THREADS" &
    ./bzip2 -d -f N.JV2.bz2 &
    ./XScoreD -d QUALITIES.JV2.co 1> .tmp_report_out_xd 2> .tmp_report_err_xd &
    wait
    mv DNA.JV2.tar.out DNA.JV2
    mv QUALITIES.JV2.de QUALITIES.JV2
    ./MergeFastqStreams > $INPUT.out
    rm -f DNA.JV2.jc DNA.JV2.tar.out N.JV2.bz2 HEADERS.JV2.bbb \
    QUALITIES.JV2.co .rep_main_info .tmp_report_out_xd .tmp_report_err_xd ;
    echo "Decompressed file: $INPUT.out";
    #
    fi
  fi
#
################################################################################
#
