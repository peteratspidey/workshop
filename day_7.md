# steps 
1. raw data
2. quality check
3. trimming
4. assembly
5. quality of assembly
6. gene prediction
7. replicates

 ![My Image](https://github.com/peteratspidey/workshop/blob/main/vivek's%20First%20Illustration(1).jpeg)


# Assembly statistics, assembly quality assessment
* genome assembly statistics
* quality of genome assembly
* gene prediction
* role of replicates in sequencing
## some important terms
`contigs`- (overlapping DNA assembled to represent continous region of genome)
 distributions 
**insert size** - length of the DNA fragments between the adaptors (the actual sequence) 
                - is the total of first read + gaps (if any) + second read
## for assembly quality there are 3 key points
1. `conguity` -  how contigs are there?
2. `completeness` - how much of the genome is captured in assembly as compared to the genome size
3. `correctness` -  do contigs assembled represent genome

## problems in genome assembly
1. **short length reads**
   - Short reads can’t cover long repetitive regions or complex genomic structures.
   - Assemblers struggle to correctly connect reads from these regions.
   - Leads to fragmented assemblies (more contigs, lower N50).
2. **per-base error rates**
   - Sequencing technologies introduce errors in base calling (e.g., substitution, insertion).
   - These errors produce incorrect k-mers, disrupting overlaps and graph structure.
   - Results in gaps, misjoins, or erroneous contigs.
3. **insert size distributions**
   - Variation in insert sizes affects how well paired-end reads can covers gaps.
   - If insert size is too small, paired reads may not covers repeats.
4. **Genome biases** - non random pattern/systematic errors
   - `gc biases` - uneven coverage of regions with high GC and low GC content.
   - `coverage biases` -
       * amplification - genomic region have more mapped than expected.	PCR steps during library prep may preferentially amplify some fragments more than others.
       * due to fragmentation inefficiencies - fewer read mapped than expected
   - `mappablity biases` - 	Repetitive or low-complexity regions are harder to align uniquely, leading to missing or incorrect mapping.
   - `sequence context bias` - Certain motifs (e.g., homopolymers like AAAAA) may cause errors during sequencing or base calling.
   - `positional bias`Ends of reads (especially in older technologies) tend to have higher error rates.

**k-mer distributions**
- A k-mer is a short DNA sequence of length k.
**low-complexity regions**
- less complex-region
- where bases are simple or repeatitive


## assembly is done in two ways
1. **DE-novo assembly**
    -  Assembles a genome from scratch, using only sequencing reads
    -  Does not require a reference genome
    -  Uses overlaps between reads to build contigs and scaffolds
    -  tools :- `SPAdes` ,`velvet` , `Canu`, `Flye`
    -  Useful for new or poorly studied organisms
    -  Can discover novel genes, sequences, and structural variations
    -  Computationally intensive and sensitive to sequencing errors
    -  May struggle with repetitive regions

2. **Reference based assembly** -
    - Aligns sequencing reads to an existing reference genome
    - Requires a high-quality reference genome
    - Easier and faster than de novo assembly
    - Tools: `BWA`, `Bowtie2`, `HISAT2`, `STAR`
    - Ideal for studying variants, gene expression, or resequencing
    - Limited in detecting novel sequences or large structural changes
    - Highly accurate in well-characterized regions

### predicted genes
no of genes predicted in the quast's predicting module in assembly

*sometimes 5' or 3' ends are missing in the contigs*

### complete genes
complete gene with 5' and 3' end

### mis-assembly
reads added to assembly in opposite direction or some places of the reads are missing.

## coverage and depth of the assembly
$$
\text{AVG coverage} = \frac{N \times L}{G}
$$
* N - no. of reads
* L - average read length
* G - length of the original genome

`Genome fraction`  

$$
\text{Genome fraction} = \frac{total no of aligned sequence in refernces genome}{genome size}
$$
