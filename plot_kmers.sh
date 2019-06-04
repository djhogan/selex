cleanup(){
  rm NC.dat 89aa.dat
}

trap cleanup EXIT

for dataset in NC 89aa
do
  for cutoff in 10
  do
    awk -v cutoff=$cutoff '($5>=$4)&&($2>=cutoff||$3>=cutoff)&&(sqrt($5)-sqrt($4)>=0.05){print}' \
      <"$dataset/kmers/12" \
      >"$dataset.$cutoff.dat"
  done
done
gnuplot -e 'set terminal svg mouse;
plot "89aa.10.dat" using (sqrt($4)):(sqrt($5)-sqrt($4)):1 with labels hypertext point pt 1 lc rgb "blue" title "89aa",
     "NC.10.dat"   using (sqrt($4)):(sqrt($5)-sqrt($4)):1 with labels hypertext point pt 2 lc rgb "red"  title "NC"' >kmers.10.svg
