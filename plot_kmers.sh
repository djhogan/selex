for dataset in NC 89aa
do
  awk '($5>=$4)&&($2>=10||$3>=10)&&(sqrt($5)-sqrt($4)>=0.1){print}' \
    <"$dataset/r1" \
    >"$dataset.dat"
done
cat "$dataset.dat" <(echo e) "$dataset.dat" \
  | gnuplot -e 'set terminal svg mouse
plot "-" using (sqrt($4)):(sqrt($5)-sqrt($4)):1 with labels hypertext point pt 7 ps 0.5,
     "-" using (sqrt($4)):(sqrt($5)-sqrt($4)):1 with points'
