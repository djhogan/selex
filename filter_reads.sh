awk 'NR%4==2{print}' \
  | awk 'length($1)==20{print}'
