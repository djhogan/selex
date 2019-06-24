fwd_fastq=$1
rev_fastq=$2
cutadapt \
  -a "^TAGGGAAGAGAAGGACATATGAT...TTGACTAGTACATGACCACTTGA" \
  -A "^TCAAGTGGTCATGTACTAGTCAA...ATCATATGTCCTTCTCTTCCCTA" \
  --discard-untrimmed \
  --pair-filter=both \
  -o r1.out -p r2.out \
  "$fwd_fastq" "$rev_fastq"
