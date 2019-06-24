#!/usr/bin/env perl

$k = $ARGV[0];
%kmers = ();
while (<STDIN>){
  chomp;
  $slen = length;
  for ($i=0; $i < $slen-$k+1; $i++){
    $kmer = substr($_, $i, $k);
    $kmers{$kmer}++;
  }
}

for $key (keys %kmers){
  print "$key\t$kmers{$key}\n";
}
