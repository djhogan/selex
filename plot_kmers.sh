for i in `seq 5 7`
do 
  awk '$2>=10||$3>=10{print}' <kmers/$i \
    | gnuplot -e 'set terminal pngcairo; 
      set yrange [0.5:1.5]; 
      set style fill transparent solid 0.35 noborder; 
      set style circle radius screen 0.002; 
      set arrow from graph 0, first 1 to graph 1, first 1 nohead;
      plot "-" using ($4):($5/$4):($1) with circles' \
    >~/Dropbox/$i.png
done
