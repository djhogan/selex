awk '($3-$2)>=2{print}' \
  | gnuplot -p -e 'set terminal svg mouse; plot "-" using 2:($3-$2):1 with labels
  hypertext point pt 7 ps 0.5'
