cleanup(){
  rm NC.dat 89aa.dat
}

# trap cleanup EXIT

for dataset in NC 89aa
do
  awk -v cutoff=$cutoff '($5>=$4)&&($2>=cutoff||$3>=cutoff)&&(sqrt($5)-sqrt($4)>=0.05){$6=sqrt($4);$7=sqrt($5);print}' \
    <"$dataset/kmers/12" \
    >"$dataset.dat"
done
gnuplot -e 'set terminal pngcairo font "sans,10";
set xlabel "Normalized Frequency";
set ylabel "Normalized Enrichment";
plot "89aa.dat" using 6:($7-$6):($7-$6>0.11?stringcolumn(1):"") with labels left offset 1,0 point pt 1 lc rgb "blue" title "89aa",
     "NC.dat"   using 6:($7-$6)                                 with                        point pt 2 lc rgb "red"  title "NC"' >kmers.png
