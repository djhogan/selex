grep -v '^@\|^\+' \
  | awk 'NR%2{print}' \
  | tee \
  >(perl -ne 'chomp;tr/ATGC/TACG/;print scalar reverse . "\n"') \
  | bash primer_trim.sh TAGGGAAGAGAAGGACATATGAT TTGACTAGTACATGACCACTTGA \
  | awk '(length($0)>=18 && length($0)<=22){print}'
