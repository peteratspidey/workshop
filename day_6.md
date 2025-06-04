
# NGS 
sequences millions of DNA fragments at same time parallely
provide high throughput data ( handle large amount of data and can produce large output quickly and efficiently)

# Workflow
## first WetLab (before NGS)
1. `sample collection`
   - process of collecting sample
   - example:- blood , tissue, saliva, soil, water etc.
2. `nucleic acid extraction`
   - by enzymes or kit based methods to extract DNA or RNA.
   - for `DNA`.
     1. cell lysis -mechanical (vortexing, bead beating), chemical (SDS detergents), enzymatic (lysozyme for bacteria, proteinase K), thermal.
     2. protein digestion - proteinase K is used to degrade histones and other proteins bound to DNA. clears proteins contaminants
     3. purification- (separates DNA from other cell debris, protein and lipids) phenol-chloroform extraction , silica column-based kits (qiagen), magnetic bead-based purification (automated)
     4. DNA precipitation - isopropanol or ethanol (to precipitate DNA ), salt -- DNA is not soluble in alcohol hence forms a pellet after centrifugation.
     5. washing- pellet is washed with 70% ethanol to remove residual salts and solvents.
     6. resuspension - clear DNA is dissolved in TE buffer or nuclease free water for storage.
   - for `RNA`
     1. sample preparation- work in rnase- free conditions (wear gloves, use rnase-free tubes, tips and reagents  
     2. cell lysis- TRIzol - inactivate RNAses , release RNA into solution 
     3.  phase separation - add chloroform , mix and centrifuge. results in 3 layers (top aqueous layer- contains RNA, interphase - contains DNA , organic - contains protein and ligands)
     4.  RNA precipitation - add isopropapnol or ethanol to aqueous layer- incubate and centrifuge - forms RNA pellet.
     5.  washing - wash pellet with 75% ethanol to remove salts and impurities
     6.  resuspension- air dry the pellet and resuspend in RNAse-free water or TE buffer.
     7.  optional- to remove any contaminating DNA treat RNA with DNAse 1 ( if u are using RNA for RT-PCR or RNA-seq
3. `Quality and Quantity check`
   - `nanodrop` - measures purity
   - `Qubit` - measures accurate concentration using fluorescent dyes
   - `AGE` - agarose gel electrophoresis checks for integrity and degradation
   - `bioanalyser/Tapestation`- precise size and quality profiling 
4. `Library preparation` - raw DNA/RNA to be processed into a `library` ( a format that the sequencer can read)
   - for `DNA` 
     - `fragmentation` - enzymatic cutting of DNA into small fragments by using enzymes or high freq sound-waves
     - `end repair` - fixing the ends of the fragments
     - `A-tailing` - adding adenine overhangs 
     - `Adaptor ligation` - adding specific sequences to both ends (also contains index)
     - `PCR amplification` - amplifies the fragments 
   - for `RNA-seq`
     - reverse transcription - convert RNA to cDNA
     - them same library preparation as DNA
***adaptors include `index barcode` enabling many samples run in one sequencing lane***
***libraries are then checked for quality for low reads and high reads and N bases***
5. `sequencing (NGS SYSTEMS)`-
   * sequencing by synthesis - (illumina) 
   * nanopore sequencing
   * single molecule real-time
   * pyrosequencing
   * sequencing by ligation
   * ion semiconductor sequencing

## NGS file formats, Quality control and preprocessing
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
 * trim low quality bases or N bases
 * discard short or poor quality reads

***This is often the first step in NGS data analysis before alignment or assembly.***

### features of the trimmomatic
* ILLUMINACLIP: Cut adapter and other illumina-specific sequences from the read.
* SLIDINGWINDOW: Perform a sliding window trimming, cutting once the average quality within the window falls below a threshold.
* LEADING: Cut bases off the start of a read, if below a threshold quality
* TRAILING: Cut bases off the end of a read, if below a threshold quality
* CROP: Cut the read to a specified length
* HEADCROP: Cut the specified number of bases from the start of the read
* MINLEN: Drop the read if it is below a specified length
* TOPHRED33: Convert quality scores to Phred-33
* TOPHRED64: Convert quality scores to Phred-64


## installation of FASTQC (if not installed already)
## install java
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
***after this it will open a iteractive FASTQC environment go to FILE and then OPEN to work on file***


## download a fastq file
1. open [SRA](https://www.ncbi.nlm.nih.gov/sra) to download a fastq file
2. search for any virus etc
3. then click on any entries to open
4. then click on `RUN`
6. then check for the entries
   - `biosamples` - for details of the sample or organism
   - `analysis` - for taxonomical analysis
   - `reads` - to check the quality of the file (select quality)
   - `FASTA/FASTQ` - to download the fastq file
***check on filtered to get the quality trimming and clipped to get adaptor cliping***
*after downloading if u got 2 file - it is paired end data , if got one file it is then single end data*

## open fastqc program and run file
1. open the fastq file by using `./fastqc`
2. go to `file` and `open` the downloaded file here for analysis
3. save the report into html format - file -> save as 
4. if adaptor content is received then go for `trimmomatic`.

## download the trimmomatic
1. go to the [trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
2. for single end -
```bash
java -jar trimmomatic-0.39.jar SE -phred33 input.fq.gz output.fq.gz ILLUMINACLIP:adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
```
3. for paired end -
```bash
java -jar trimmomatic-0.39.jar PE input_forward.fq.gz input_reverse.fq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:adapter/TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
```
4. This will perform the following:
    * Remove adapters (ILLUMINACLIP:TruSeq3-PE.fa:2:30:10)
    * Remove leading low quality or N bases (below quality 3) (LEADING:3)
    * Remove trailing low quality or N bases (below quality 3) (TRAILING:3)
    * Scan the read with a 4-base wide sliding window, cutting when the average quality per base drops below 15 (SLIDINGWINDOW:4:15)
    * Drop reads below the 36 bases long (MINLEN:36)
5. after commands execution it will show the result of the trimmomatic run
6. this output is used for QC process
7. 
