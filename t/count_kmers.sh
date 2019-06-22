#!/usr/bin/env bash

actual="$(perl ../count_kmers.pl 3 \
	<count_kmers.1 \
	| awk '{sum+=$2}END{print sum}')"

expected="$(awk 'length($1)>2{n+=(length($1) - 3 + 1)}END{print n}' \
	<count_kmers.1)"

if [ "$actual" -eq "$expected" ]
then
	echo "PASS"
else
	echo "FAIL"
fi

# this test is flawed
actual="$(perl ../count_kmers.pl 3 \
	<count_kmers.1 \
	| sed -n '12p')"

grep -c $(echo $actual | cut -d' ' -f1) <count_kmers.1
