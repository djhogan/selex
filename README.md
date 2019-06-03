# Requirements

- tre-agrep
- Perl

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

# Extracting Oligomers

Forward and reverse primers were used as delimiters for the oligomers. Up to
3 mismatches or indels were permitted in matching the forward and reverse
primers. The oligomers were then filtered by length. Those as short as 18 and
as long as 22 nucleotides were kept. Oligomers were not filtered based on
quality as it was assumed that if the primers were found and the sequence was
the requisite length, it was highly unlikely to be an erroneous read.

# Tabulating Kmers

Kmers (k=5, ..., 15) were counted for each round and then joined with results
from the other rounds. Counts of zero were clamped to a lower bound of 1 to
avoid singularities when calculating fold-change. This was deemed acceptable
based on both practical and theoretical grounds: (1) due to undersampling it is
highly unlikely that a species were to completely disappead, rather the
sequencing depth or sampling depth was insufficient to capture the species 
(2) at low counts, fold-change is exaggerated due to undersampling these
region, the affect of clamping to would only reduce this exaggeration, which is
typically desirable anyway.

# Choosing K with KL Divergence

The Kullback-Leibler divergence is a pseudo-distance metric for probability
distributions. We use it to measure the difference in the kmer distributions
before and after selection. A high Kullback-Leibler divergence between before
and after suggests a substantial change in kmer distirbution, which in turn
suggests substantial selective pressure (enrichment and depletion) occurring 
across sequences. We use the Kullback-Leibler divergence to select the most 
relevant k. We found the optimal k to be 12.

Coincidentally, when filtering out kmers with fewer than 10 species, 
the most enriched species were found when k=12.

# Variance Stabilization with the Square Root Transformation
The square root was used to transform frequencies into variance-stable values. 

# Filtering with Negative Control

* Drop kmers that have both counts less than 20 (insufficient sampling)
* Fit an error model
