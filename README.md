# Blast-Script
Basic Blast script based on Guest Lectures 

Blast stands for Basic Local Alignment Search Tool. Blast allows us to compare a nucleotide sequence (or group of nucleotide sequences),
known as the query, against another group of nucleotide sequences known as the database. Blast is useful in many situations when analyzing
genomic DNA, such as determining whether a certain gene is represented in a certain species. 
In metagenomics, Blast is especially useful for comparing a read or set of reads against a reference genome and determining how much and
which sequences of the reference genome are represented in the original metagenomic data.

You use Blast to compare a collection of DNA sequences in Fasta format against a "blast database". The command line (UNIX or Windows) version of BLAST is named BLAST+ is available on ASC via Ascdocs. The different types of blast searches that can be used are: blastn, 
blastp, blastx, tblastx, tblastn, and less used but still relevant searches psiblast, rpsblast, and rpstblastn. You can also make blast+ 
databases using the makeblastdb command in Blast+.

In this script, we will use blastn. BLASTN queries nucleotides against a nucleotide database matching the sequences to a genome. 
A blast output can several optiions including an alignment list, E-value, and raw scores. All the output options are listed below:
0 = Pairwise
1 = Query-anchored showing identities
2 = Query-anchored no identities
3 = Flat query-anchored showing identities
4 = Flat query-anchored no identities
5 = BLAST XML
6 = Tabular
7 = Tabular with comment lines
8 = Seqalign (Text ASN.1)
9 = Seqalign (Binary ASN.1)
10 = Comma-separated values
11 = BLAST archive (ASN.1)
12 = Seqalign (JSON)
13 = Multiple-file BLAST JSON
14 = Multiple-file BLAST XML2
15 = Single-file BLAST JSON
16 = Single-file BLAST XML2
17 = Sequence Alignment/Map (SAM) 

For more information about using type blastn --help. 

Example Blast+ Script below:






