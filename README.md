# climber dump
This is a set of **INCOMPLETE** scripts that were used in an attempt to merge a WGS data set with some SNP array data. One of the problems is that the genomic builds of the separate data sets is not completely known so merging them can lead to problems.

The workflow was meant to be:
1. Find overlapping SNPs
2. Construct one genotype matrix that contains all data
3. Fill in missing values using knn
4. Run PCA on data 
5. Merge/update ped file 
6. Perform an association analysis with plink using PCs as covariates 
7. Perform spatial ancestry analysis to identify SNP 2d distributions 
   - For SNPs that are differiated in plink, we now have a distance function estimating the frequency of those SNPs by the relative position

Previous attempts to run this did not find significant SNPs with interesting spatial distributions. It may make sense to scale down the 1000 Genomes data to only include individuals near our original data. 
