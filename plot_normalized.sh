awk '($2>=10||$3>=10)&&rand()<0.01{print}' <89aa/kmers/8 \
  | sort -n -k 4,4 \
  | gnuplot -p -e 'set term svg; plot "-" using (column(0)):($5-$4) notitle' \
  >raw.svg

awk '($2>=10||$3>=10)&&rand()<0.01{print}' <89aa/kmers/8 \
  | sort -n -k 4,4 \
  | gnuplot -p -e 'set term svg; plot "-" using (column(0)):(sqrt($5)-sqrt($4)) notitle' \
  >sqrt.svg
