library(BEDMatrix)
library(VariantAnnotation)

setwd("~/Bigham/Data/Climber")
climber_mat <- BEDMatrix("EuropeanClimbers.bed")
climber_row <- sapply(strsplit(colnames(climber_mat),"_"), `[`,1)

setwd("../")
hgdp_row <- read.table("HGDP/HGDP_Map.txt",sep="\t")[,1]

intersect_row_1 <- intersect(climber_row,hgdp_row)
intersect_row_2 <- list()

i <- 1
param <- ScanVcfParam(fixed="ALT", geno=c("GT"))
tab <- TabixFile("1000/ALL.wgs.nhgri_coriell_affy_6.20140825.genotypes_no_ped.vcf.gz", yieldSize=25000)

open(tab)
while (nrow(vcf_yield <- readVcf(tab, param=param))){
  intersect_row_2[[i]] <- intersect(intersect_row_1,rownames(vcf_yield))
  i <- i+1
}
close(tab)

cat(NULL,file="intersect_set.txt")
lapply(intersect_row_2,write,"intersect_set.txt",append=TRUE)