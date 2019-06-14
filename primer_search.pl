use List::Util qw(min);

$k = shift @ARGV;
$primer5 = shift @ARGV;
$primer3 = shift @ARGV;
$m = length($primer5);

@score = ();
while (<STDIN>){
  chomp $_;
  $n = length($_);
  $min = $k+1;
  $min_pos = undef;
  for ($i = 0; $i < ($n+1); $i++){
    $score[$i][0] = 0;
  }
  for ($j = 0; $j < ($m+1); $j++){
    $score[0][$j] = $j;
  }
  for ($i = 0; $i < $n; $i++){
    for ($j = 0; $j < $m; $j++){
      if ($score[$i][$j] > $k){
        $score[$i+1][$j+1] = $k + 1;
        last;
      }
      $penalty = substr($_, $i, 1) eq substr($primer5, $j, 1) ? 0 : 1;
      $score[$i+1][$j+1] = min(
        $score[$i+1][$j] + 1,
        $score[$i][$j] + $penalty,
        $score[$i][$j+1] + 1);
      if ($j+1 == $m and $score[$i+1][$m] < $min) {
        $min = $score[$i+1][$m];
        $min_pos = $i+1;
      }
    }
  }
  $trimmed = substr($_, $min_pos);
  print "$trimmed\n" if defined($min_pos);
}

=cut
@score = ();
for ($i = 0; $i < ($n+1); $i++){
  for ($j = 0; $j < ($m+1); $j++){
    $score[$i][$j] = $k+1;
  }
}


for ($j = 0; $j < ($m+1); $j++){
  for ($i = 0; $i < ($n+1); $i++){
    if (defined $score[$i][$j]){
      print "$score[$i][$j] ";
    } else {
      print "  ";
    }
  }
  print "\n";
}

