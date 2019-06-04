# Method

## Sequence Trimming

Forward and reverse primers were used as delimiters for the oligomers. Up to
3 mismatches or indels were permitted in matching the forward and reverse
primers. The oligomers were then filtered by length. Those as short as 18 and
as long as 22 nucleotides were kept. Oligomers were not filtered based on
quality as it was assumed that if the primers were found and the sequence was
the requisite length, it was highly unlikely to be an erroneous read.

Sequence data was extracted from the FASTQ files and its reverse complement was
appended. The sequence data with its reverse complement was searched for the 5'
and 3' primers. Up to 2 differences were allowed between the known primer
sequences and the matches found. The sequence between the primers were
extracted and filtered by length. Only oligmers of length 20 were kept.

## Kmer Extraction

The oligomers were decomposed into k-mers. For example, for k=9 the oligomer

```
ATGCGCGGCGCAGCG
```

is decomposed into the following sequences.

```
ATGCGCC
 TGCGCCA
  GCGCGAD
```

## Choosing K Using KL-Divergence

Kmers (k=5, ..., 15) were counted for each round and then joined with results
from the other rounds. Counts of zero were clamped to a lower bound of 1 to
avoid singularities when calculating fold-change. This was deemed acceptable
based on both practical and theoretical grounds: (1) due to undersampling it is
highly unlikely that a species were to completely disappead, rather the
sequencing depth or sampling depth was insufficient to capture the species 
(2) at low counts, fold-change is exaggerated due to undersampling these
region, the affect of clamping to would only reduce this exaggeration, which is
typically desirable anyway.

The Kullback-Leibler divergence is a pseudo-distance metric for probability
distributions. We use it to measure the difference in the kmer distributions
before and after selection. A high Kullback-Leibler divergence between before
and after suggests a substantial change in kmer distirbution, which in turn
suggests substantial selective pressure (enrichment and depletion) occurring 
across sequences. We use the Kullback-Leibler divergence to select the most 
relevant k. We found the optimal k to be 12.

Coincidentally, when filtering out kmers with fewer than 10 species, 
the most enriched species were found when k=12.

## Variance Stabilization with the Square Root Transformation

Before checking enriched species, species with fewer than 10 count in BOTH
rounds were filtered because the sampling was not sufficient to conclude
enrichment. Additionally, a square root transform was applied to frequencies to 
account for heteroskedasticity. The affect of which is seen below.

![before normalization](raw.png)
![after normalization](sqrt.png)

# Results

![maximally enriched](kmers.png)

## Filtering with Negative Control

The same process was run 
* Drop kmers that have both counts less than 20 (insufficient sampling)
* Fit an error model

# Results

The best k-mers came


