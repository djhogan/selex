awk '($2>=10||$3>=10)&&rand()<0.01{print}' <89aa/kmers/8 \
  | sort -n -k 4,4 \
  | gnuplot -p -e 'set term pngcairo size 400,200 font "sans,10"; set title "Before VarStab"; plot "-" using (column(0)):($5-$4) notitle' \
  >raw.png

awk '($2>=10||$3>=10)&&rand()<0.01{print}' <89aa/kmers/8 \
  | sort -n -k 4,4 \
  | gnuplot -p -e 'set term pngcairo size 400,200 font "sans,10"; set title "After VarStab"; plot "-" using (column(0)):(sqrt($5)-sqrt($4)) notitle' \
  >sqrt.png
