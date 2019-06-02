#!/usr/bin/env bash

primer5=$1
primer3=$2

grep -v '^@\|^\+' \
  | awk 'NR%2{print}' \
  | tee \
  >(perl -ne 'chomp;tr/ATGC/TACG/;print scalar reverse . "\n"') \
  | bash primer_trim.sh "${primer5}" "${primer3}" \
  | awk '(length($0)>=18 && length($0)<=22){print}'

  # TAGGGAAGAGAAGGACATATGAT TTGACTAGTACATGACCACTTGA \
