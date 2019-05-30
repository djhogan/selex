grep -v '^@\|^\+' \
  | awk 'NR%2{print}' \
  | tee \
  >(bash primer_trim.sh TAGGGAAGAGAAGGACATATGAT TTGACTAGTACATGACCACTTGA) \
  >(bash primer_trim.sh TCAAGTGGTCATGTACTAGTCAA ATCATATGTCCTTCTCTTCCCTA) \
  >/dev/null \
  | awk '(length($0)>=18 && length($0)<=22){print}'
