awk '$5/($2>=1?$4:1)>=1.01{print}' \
  | gnuplot -p -e 'set terminal svg mouse; plot "-" using 4:($5/$4):1 with labels hypertext point pt 7 ps 0.5'
