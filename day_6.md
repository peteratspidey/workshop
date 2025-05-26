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
