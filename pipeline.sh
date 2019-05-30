grep -v '^@\|^\+' \
  | awk 'NR%2{print}' \
  | tee \
  >(bash primer_trim.sh TAGGGAAGAGAAGGACATATGAT TTGACTAGTACATGACCACTTGA) \
  >(bash primer_trim.sh TCAAGTGGTCATGTACTAGTCAA ATCATATGTCCTTCTCTTCCCTA) \
  >/dev/null
