# NGS file formats, Quality control and preprocessing
* `NGS` seq methods - illumina pacbio
* `FASTQ` is common fromat for storing NGS ( it contain quality of the read)
* `QC` is done before the assembly process
* `flowcell` is a small glass slide or chip that contains lanes or channels where sequencing reaction takes place
  * contain oligonucleotide adapters that binds tha DNA fragments

## the details of the fastQ file 
* text based
* stored both sequence and quality
* contains a 4 line descriptions
  1. line describes the `unique name`, `run id` , `flowcell ID` ,`flowcell lane`,` title no ` , `x and y coordinate`, `paired and non paired menber`, `filtered or non-filtered` , `index` , `length of the read` of the sequence
  2. line2 contain the FASTA sequence
  3. line3 same as line1 but `@` is replaced by  `+`
  4. line4 quality value of each base in the form of phred scores (0-93) represented as ASCII 33 to 126
      - `~` is the best score
      - `!` is the worse score 

## when u run fastqc on a fastq file it produces: compressed folder with
* fastqc_data.txt - detailed analysis report
* summary.txt - pass/fail/warnings for each module
* Images/ - graphical plots for each quality metric.

## details of the fastqc_data.txt (main output)
`>>Basic Statistics` - Info about the file: filename, total sequences, GC content, etc.

`>>Per base sequence quality` - Boxplots of Phred scores across all bases.

`>>Per tile sequence quality` - Quality score per sequencing tile.

`>>Per sequence quality scores` - Overall score distribution across reads.

`>>Per base GC content` - GC content per base position.

`>>Per sequence GC content` - GC distribution across all sequences

`>>Per base N content` - Frequency of ambiguous 'N' bases at each position.

`>>Sequence Length Distribution` - Distribution of read lengths.

`>>Sequence Duplication Levels` - Level of duplicate reads.

`>>Overrepresented sequences` - Reads that appear too often (possible contamination/adapters).

`>>Adapter Content` - Checks for known adapter contamination.

`>>Kmer Content` - Over-represented kmers (short nucleotide patterns).

Each section starts with `>>Section Name` and ends with `>>END_MODULE`.



## trimmomatic
* tool for trimming and cleaning illumina sequencing data.
* it is used to
 * remove adapters
 * trim low quality bases
 * discard short or poor quality reads

***This is often the first step in NGS data analysis before alignment or assembly.***

### features of the trimmomatic
1. adapter trimming - removes adapter sequences that can interfere with analysis.
2. quality trimming - cuts bases from read ends if quality is below a threshold.
3. slidling window - scan reads in a window and trims when average qaulity drops
4. minimum length filter - Discards reads that become too short after trimming
5. paired-end and single-end support - Can handle both types of reads
6. mutlithreading - Speeds up processing using multiple CPU cores

## installation of FASTQC (if not installed already)

```bash
Ubuntu / Mint: sudo apt install default-jre
```
## to check the installed verion of tha java
```bash
java --version
```
## install perl
```bash
sudo apt install perl
```
## download FASTQC file and extract it from [FASTQC](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc)

## change the permission of the fastqc file
```bash
chmod 755 fastqc
```
## run the fastqc perl file
```bash
./fastqc
```
