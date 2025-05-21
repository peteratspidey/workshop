# NGS file formats, Quality control and preprocessing
* `NGS` seq methods - illumina pacbio
* `FASTQ` is common fromat for storing NGS ( it contain quality of the read)
* `QC` is done before the assembly process
* `flowcell` is a small glass slide or chip that contains lanes or channels where sequencing reaction takes place
  * contain oligonucleotide adapters that binds tha DNA fragments

## the details of the fastQ file 
* contains a 4 line descriptions
  1. line describes the ID, lengths etc of the sequence
  2. line2 contain the FASTA sequence
  3. line3 same as line1
  4. line4 quality value of each base in the form of phred scores (0-93)
