# *Comprehensive Workflow for Genomic Data Processing, Assembly, and Gene Prediction*
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
> no of genes predicted in the quast's predicting module in assembly

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
\text{Genome fraction} = \frac{\text{total no of aligned sequence in refernces genome}}{\text{genome size}}
$$
> this is important when we want to check data of `SNP calling`, `mutation` , `Anti microbial resistance mutation`, `disease variant mutation`
> for this type of studies we need atleast 50% coverage of the genome

## N50
 * when contigs are assembled in order of descending length
 * then the contig at which the length becomes 50 % of the genome length . that contig called `N50`
 * used to define contiguity of the genome

## L50 
 * no of contigs that assembled to cover atleast the 50% of the genome length , that no is called L50
 * simply tells how many biggest pieces are assembled to make genome

> Lower L50 = better (fewer contigs used → more continuous assembly)
> Higher N50 = better (longer contigs → more complete sequences)

## [Quast](https://quast.sourceforge.net/)
- a quality assesment tool for evaluating and comparing genome assemblies
- can evaluate assemblies with reference as well as without references (quast select the best from the multiple assemblies)
- useful for comparing multiple assemblies
- it uses NA50 (or NGA50) = Like N50, but only counts aligned (matched with reference genome and correctly assembled blocks, based on a reference genome.
- **In QUAST and NA50**:
  During QUAST's analysis:
   * It splits contigs into "aligned blocks" (good parts)
   * Misassemblies or unaligned regions are excluded
   * NA50 is then calculated using just these aligned blocks

## SAM 
  - sequence aligned map - aligned sequence info with reference sequence
  - human readable format
  - each line represent one read alignment
  - larger than BAM in size

## BAM
  - binary version of SAM
  - compressed , compact and non human readable
  - small in size
  - requires SAM tools to view
    
## input data for Quast
  1. **sequences**
> assemblies and reference genomes in FASTA format (compressed in zip,gzip of bzip2)
> a reference genome with multiple chromosome can be provided in a single fasta file
  2. **Reads** ( for supporting the assemblies) 
> illumina, pacbio , orford nanopore reads in FASTA format or in aligned BAM/SAM format
 3. **gene and operon**
> files with gene and operon positions in reference genome, these files in GFF(gene feature format) and BED (  format (used to evaluate how well the genome assembly align .

## assembly completeness assesment 
genome assembly stats do no tell about the
 - presence of the essential gene
 - completeness of the gene content
 - gene integrity
 - Biological function
 - lineage specific gene expectations
 - duplicated genes
 - start and stop codon accuracy

## such quantification of completeness is done by
* [BUSCO](https://academic.oup.com/bioinformatics/article/31/19/3210/211866) (benchmarkin universal single copy orthologs)
   - uses orthologs info to define(make) BUSCO sets (sets that represent core genes) across 6 major phylogenetic groups
   - groups are - vertebrates , arthropoda, fungi, plantae, bacteria, others
   - these busco sets are mainly - conserved genes , single copy across species from these 6 groups .
   - it is used to assess the completeness of the genome assemblies, annotation, or gene prediction.
   - uses Augustus to predict the gene models (coding regions)
   > augustus - gene predicting tool , predict where the genes, intron , exon and coding regions are , in a given DNA sequence
   - compares query with reference BUSCO gene set
   - BUSCO has a list of essential genes that should exist in almosst every organism
> pipeline - series of connected steps or tools that automatically run one after another to process data and produce results.

* [CEGMA](https://academic.oup.com/bioinformatics/article/23/9/1061/272633) (core eukaryotic gene mapping approach)
   - it is a pipeline/approach
   - find orthologs (evolutionary conserved genes) from the known set of essential genes.
   - uses KOGs db to identify the essential genes.
   - uses tBLASTn to identify the core gene set from query genome
 
* [KOGs](https://www.ncbi.nlm.nih.gov/research/cog#kog) eukaryotic orthologous groups
    - core essential genes found across eukarytic organism
    - genes are grouped based on orthology

  
 * [gVolante](https://gvolante.riken.jp/analysis.html)
   - has the busco, cegma dataset
   - consists of core vertebrate genes, mammalia , vertebreta , eukaryota etc. 
   - BUSCO notation is - C for complete, F for fragmneted , M for  missing , N for the no of genes used
   - complete genes found with more than one copy is duplicated.
   - if assembly is good means less no of missing and fragmented copies
   - more the N the better is the assembly

![busco](https://github.com/peteratspidey/workshop/blob/main/images/busco_framework.jpg)

 ## The BUSCO Framework (Left Panel)
### a) Dataset: Signature of BUSCO Genes
  - `AA consensus sequences`: Reference amino acid sequences for each BUSCO gene family.
  - `Block profiles & Profile HMMs`: Profiles and hidden Markov models constructed from multiple sequence alignments, used for sensitive homology searches.
  - `Score + length cutoffs`: Criteria for detecting true orthologous genes and filtering out potential false positives or partial matches.
    
### b) Three Analysis Types
A. Genome Assembly
    * Input: Contigs from genome assembly.
    * Process:
        - `tblastn` is used to identify candidate regions by comparing protein queries to nucleotide sequences.
        - `AUGUSTUS` (a gene prediction tool) is used for predicting gene structures in these regions.
        - `hmmsearch` finds candidate proteins via profile HMMs.
    Outputs: Detected BUSCOs, passed to the BUSCO Classifier for final evaluation.
    
B. Annotated Gene Set
    * Input: GFF or protein FASTA of annotated genes.
    * Process:
        Candidate proteins are directly searched using hmmsearch.
    * Outputs: Results to BUSCO Classifier.

C. Transcriptome
    * Input: Transcriptome (e.g., RNA-seq assembly).
    * Process:
        - `tblastn` finds the longest ORFs in each transcript as candidate proteins.
        - `hmmsearch` identifies matching genes.
    Outputs: Results to BUSCO Classifier.

### c) BUSCO Classifier and Report
   * The BUSCO Classifier categorizes genes as "Complete," "Duplicated," "Fragmented," or "Missing."
    * Outputs are compiled into a report summarizing the quality and completeness of the data set.
 
* [RAST](https://rast.nmpdr.org/)
- useful for bacterial genome
- after assembly put in RAST 
  - it will predict gene
  - gene annotation (functional annotations)
  - dont use reference genome for comparison like Quast (no NA50 etc)
  - it tells no of complete predicted genes, partial predicted genes , 
