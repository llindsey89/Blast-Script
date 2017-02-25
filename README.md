# Blast-Script
Basic Blast script based on Guest Lectures 

Blast stands for Basic Local Alignment Search Tool. Blast allows us to compare a nucleotide sequence (or group of nucleotide sequences),
known as the query, against another group of nucleotide sequences known as the database. Blast is useful in many situations when analyzing genomic DNA, such as determining whether a certain gene is represented in a certain species. 
In metagenomics, Blast is especially useful for comparing a read or set of reads against a reference genome and determining how much and
which sequences of the reference genome are represented in the original metagenomic data.

You use Blast to compare a collection of DNA sequences in Fasta format against a "blast database". The command line (UNIX or Windows) 
version of BLAST is named BLAST+ is available on ASC via Ascdocs. For help with Blast+, type blastall --help
The different types of blast searches that can be used are: blastn, blastp, blastx, tblastx, tblastn, and less used but still relevant 
searches psiblast, rpsblast, and rpstblastn.
Each tool is run by typing the search name into your command line followed by certain options (called flags).
For example, if I wanted to run blastn on a file called seqs.fasta, output the result to a file output.blast.txt and keep all the default settings I would navigate to the folder where seqs.fasta is stored and type:
-blastn -query seqs.fasta -out output.blast.txt

You can also make blast+ databases using the makeblastdb command in Blast+.

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

A basic blastn search from the command line look like this:
 blastn -db "DATABASE1" DATABASE2"... -query "FILE.fasta" -output "OUT TYPE" -[limit output: -evalue -Max_target_seqs or sorting of results]

The example Blast+ Script using blastn database below was created based on the guest lecture Arabidopsis_thaliana data located in our class_shared folder. The first for using one database and the second is for multiple databases.


# ########################
#!/bin/sh
# ########################
# #####################
# Module Load will load modules that you want to use which would be blast+ 
source /opt/asn/etc/asn-bash-profiles/modules.sh
module load blast+/2.3.
# #####################
##Change into the direct where the files are located using -cd and copy all files from folders to the directory that you are working in, and if copying a whole directory, use `-R` to copy the directory into your working directory. In this example we will use *.fasta to copy all fastas into our working directory from 
cd home/user/Arabidopsis_thaliana
cp *.fasta /home/user/working directory/
#Build s database using of one the fasta files (in our case ATmt.fasta )
makeblastdb -in ATmt.fasta -dbtype nuc  
##Choosing an output format, blast your query against the database (we use format 7 - tabulare with comments)
blastn -query test.fasta -db ATmt.fasta -outfmt 7 | less
done
# ############################## ##



##Multiple database blast+ script below


# ########################
#!/bin/sh
# ########################
# #####################
# module Load will load modules that you want to use which would be blast+ 
source /opt/asn/etc/asn-bash-profiles/modules.sh
module load blast+/2.3.
# #####################
# change into the direct where the files are located using -cd and copy all files from folders to the directory that you are working in, and if copying a whole directory, use `-R` to copy the directory into your working directory. In this example we will use *.fasta to copy all fastas into our working directory from 
cd home/user/Arabidopsis_thaliana
cp *.fasta /home/user/working directory/
#Build a database using the fasta files in your working directory (in our case using ATmt.fasta, ATcp.fasta, & ATchrV.fasta )
-#Formatting:-db "ATmt.fasta" "ATcp.fasta" "ATchrV.fasta"`       

#blast query against our nucleotide database and outsput the number hits from the mt, cp, and chrV fasta files.

-blastn -db "ATmt.fasta ATcp.fasta ATchrV.fasta Arabidopsis_thaliana/CHR_I/NC_003070.gbk Arabidopsis_thaliana/CHR_II/NC_003071.gbk Arabidopsis_thaliana/CHR_III/NC_003074.gbk" -query test.fasta -outfmt 7 | less -S 

#you can limit the output in a number of way, but for this example, we will limit the output to one hit per query & e value using -evalue and -max_target_seqs.

blastn -db "ATmt.fasta ATcp.fasta ATchrV.fasta Arabidopsis_thaliana/CHR_I/NC_003070.gbk Arabidopsis_thaliana/CHR_II/NC_003071.gbk Arabidopsis_thaliana/CHR_III/NC_003074.gbk" -query test.fasta -outfmt 7 -evalue 0.00001 -max_target_seqs 1 | less -S

done
# ############################## ##

