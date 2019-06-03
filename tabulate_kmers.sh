for i in `seq 5 15`
do
  echo $i started
  join -o auto -e 0 -a 1 -a 2 \
    <(perl count_kmers.pl $i <protein_r1 | sort) \
    <(perl count_kmers.pl $i <protein_r2 | sort) \
    | perl add_freq_column.pl \
    >kmers/$i
  echo $i finished
done

