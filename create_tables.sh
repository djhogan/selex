format_rows(){
  printf "Sequence Cnt1 Cnt2 Freq1 Freq2 V1 V2 Delta\n"
  printf -- "---- ---- ---- ---- ---- ---- ---- ----\n"
  while IFS=' ' read -a line
  do
    printf "%s %d %d %0.3f %0.3f %0.3f %0.3f %0.3f\n" "${line[@]}"
  done
}

tabularize(){
  awk '{$8=$7-$6;print}' <$1.dat \
    | sort -nrk 8,8 \
    | head -n 10 \
    | format_rows \
    | column -s' ' -t \
    >$1.tbl
}

tabularize 89aa
tabularize NC
