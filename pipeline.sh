#!/usr/bin/env bash

usage(){
  echo "Usage: $0 PRIMER5 PRIMER3" 1>&2
  exit 1
}

#if [ "$#" -ne 2 ]
#then
#  usage
#fi
#
#PRIMER5=$1
#PRIMER3=$2
PRIMER5="TAGGGAAGAGAAGGACATATGAT"
PRIMER3="TTGACTAGTACATGACCACTTGA"

grep -v '^@\|^\+' \
  | awk 'NR%2{print}' \
  | tee \
  >(perl -ne 'chomp;tr/ATGC/TACG/;print scalar reverse . "\n"') \
  | bash primer_trim.sh "$PRIMER5" "$PRIMER3" \
  | awk '(length($0)==20){print}'
