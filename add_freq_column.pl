#!/usr/bin/env perl

while (<STDIN>){
  chomp;  
  @_ = split;
  $sum1 += @_[1];
  $sum2 += @_[2];
  push @rs, [@_];
}

for $r (@rs){
  $l = join ' ', @$r;
  print "$l " . 100000*$r->[1]/$sum1 . " " . 100000*$r->[2]/$sum2 . "\n";
}
