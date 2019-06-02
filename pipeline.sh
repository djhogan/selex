grep -v '^@\|^\+' \
  | awk 'NR%2{print}' \
  | tee \
  >(perl -ne 'chomp;tr/ATGC/TACG/;print scalar reverse . "\n"') \
  | bash primer_trim.sh TAGGGAAGAGAAGGACATATGAT TTGACTAGTACATGACCACTTGA \
  #>(bash primer_trim.sh TCAAGTGGTCATGTACTAGTCAA ATCATATGTCCTTCTCTTCCCTA) \
  | awk '(length($0)>=18 && length($0)<=22){print}'
