# Extract Exact Matches

Run the perl script `exact_matches.pl`.

```
$ perl -n exact_matches.pl <FASTQ_FILE
```

This will produce several files.

- good_fwd
- good_rev
- bad_fwd
- bad_rev

We'll make sure we didn't lose any lines in the process as a sanity check.
Check that the results returned by these two commands are equivalent.

```
$ grep -v '^@' xaa | grep -v '^+' | wc -l
$ cat good_fwd good_rev bad | wc -l
```

# Recover Inexact Matches

Run agrep (provided by the tre Homebrew package) to recover inexact matches.
Diminishing returns beyond a cost of 6.

```
grep '^@' bad_fwd | agrep --record-number --colour --show-cost -E 6 "${FWD_PATTERN}" >okay_fwd
grep '^@' bad_rev | agrep --record-number --colour --show-cost -E 6 "${RC_PATTERN}" >okay_rev
```

Record number is reported so that we can look up the FASTQ quality information
in the original file.

The match is coloured so we can isolate it from the flanking regions.

The cost is reported in case it becomes useful.

# Rejoin "Okay" Sequences with FASTQ Quality Information

What script for this?

# Quality Fitlering

# Kmer Tabulation

The above pipeline is run for both round 1 and round 2. Kmers are tabulated for
K = 1, 2, ..., 20 for both rounds. The results for each round are then merged
as follows. 

## Distribution Support

Drop Kmers that have a count less than 5. Take the union of the remaining Kmers
from each round. Calculate enrichment for the resulting set.

# Choosing Optimal Kmer Length

* Small Kmers will have large counts
* Small Kmers might have enrichment
* Large Kmers will have smaller counts
* Large Kmers might have enrichment
* An enrichment in Large Kmers will result in enrichment of smaller, constituent Kmers
* A small enrichmed Kmer versus a large enriched Kmer?
