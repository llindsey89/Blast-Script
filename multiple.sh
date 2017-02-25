##Multiple database blast+ script
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

formatdb -i "ATmt.fasta" "ATcp.fasta" "ATchrV.fasta"`       

##blast query against our nucleotide database and outsput the number hits from the mt cp and chrV fasta files.

-blastn -db "ATmt.fasta ATcp.fasta ATchrV.fasta Arabidopsis_thaliana/CHR_I/NC_003070.gbk Arabidopsis_thaliana/CHR_II/NC_003071.gbk Arabidopsis_thaliana/CHR_III/NC_003074.gbk" -query test.fasta -outfmt 7 | less -S 

#you can limit the output in a number of way, but for this example, we will limit the output to one hit per query & e value using -evalue and -max_target_seqs.

blastn -db "ATmt.fasta ATcp.fasta ATchrV.fasta Arabidopsis_thaliana/CHR_I/NC_003070.gbk Arabidopsis_thaliana/CHR_II/NC_003071.gbk Arabidopsis_thaliana/CHR_III/NC_003074.gbk" -query test.fasta -outfmt 7 -evalue 0.00001 -max_target_seqs 1 | less -S

done
# ############################## ##
