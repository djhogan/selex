for i in `seq 5 20`
do
  perl count_kmers.pl $i <protein_r1 >kmers/r1.$i &
  perl count_kmers.pl $i <protein_r2 >kmers/r2.$i &
done
