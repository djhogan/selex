dir1=$1
dir2=$2
bash cutadapt.sh "$dir1/r1.fastq" "$dir1/r2.fastq" \
  | perl count_kmers.pl $k \
  > positive
bash cutadapt.sh "$dir2/r1.fastq" "$dir2/r2.fastq" \
  | perl count_kmers.pl $k \
  > negative
