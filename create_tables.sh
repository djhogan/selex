format_row(){
  while IFS=' ' read -a line
  do
    printf "%s %d %d %0.3f %0.3f %0.3f %0.3f %0.3f\n" ${line[@]}
  done
}

shopt -s expand_aliases
alias tabularize="column -s' ' -t | sed 's/\(\s*\)\s/\1\|/g'"
awk '{$8=$7-$6;print}' <89aa.dat | sort -nrk 8,8 | head -n 10 | format_row | tabularize >89aa.tbl
awk '{$8=$7-$6;print}' <NC.dat | sort -nrk 8,8 | head -n 10 | format_row | tabularize >NC.tbl


