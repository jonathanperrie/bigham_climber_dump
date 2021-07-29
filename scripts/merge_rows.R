library(BEDMatrix)
library(VariantAnnotation)

# Load the genotype matrix for the climber data 
setwd("C:/Users/Jonathan/Documents/bigham_climber_dump/climber")
climber_mat <- BEDMatrix("EuropeanClimbers.bed")
climber_row <- sapply(strsplit(colnames(climber_mat), "_"), `[`, 1)

# Load the 1000 Genomes row data and subselect just the Europeans 
setwd("../1000")
geno1000_meta <- read.table("igsr_samples.tsv", sep="\t", header=T)
geno1000_list <- read.table("affy_samples.20141118.panel", sep="\t", header=T)
matches <- geno1000_meta[geno1000_meta$Sample.name %in% geno1000_list$sample,]
matches <- matches[matches$Superpopulation.name=="European Ancestry",]