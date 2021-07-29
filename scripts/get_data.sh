#!/bin/bash

# 1000 Genomes reference
mkdir -p 1000
cd 1000
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/supporting/hd_genotype_chip/ALL.wgs.nhgri_coriell_affy_6.20140825.genotypes_has_ped.vcf.gz
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/supporting/hd_genotype_chip/ALL.wgs.nhgri_coriell_affy_6.20140825.genotypes_has_ped.vcf.gz.tbi
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/supporting/hd_genotype_chip/ALL.wgs.nhgri_coriell_affy_6.20140825.genotypes_no_ped.vcf.gz
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/supporting/hd_genotype_chip/ALL.wgs.nhgri_coriell_affy_6.20140825.genotypes_no_ped.vcf.gz.tbi
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/supporting/hd_genotype_chip/affy_samples.20141118.panel
# download metadata from https://www.internationalgenome.org/data-portal/sample as igsr_samples.tsv
touch igsr_samples.tsv
cd ..

# climber data bed, bim, fam, nosex, README
mkdir -p climber
touch EuropeanClimbers.bim
cd ..


#
