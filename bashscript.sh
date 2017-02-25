###The example Blast+ Script using blastn database below was created based on the guest lecture Arabidopsis_thaliana data located in our class_shared folder. The first for using one database and the second is for multiple databases.
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

