library(VariantAnnotation)

setwd("~/Bigham/v2/")
x <- scan("intersect_set.txt", what="", sep="\n")

setwd("~/Bigham/v2/1000/")

ref_alt_df <- data.frame(matrix(ncol = 3, nrow = 0))

i <- 1
param <- ScanVcfParam(fixed="ALT", geno=c("GT"))
tab <- TabixFile("ALL.wgs.nhgri_coriell_affy_6.20140825.genotypes_no_ped.vcf.gz", yieldSize=25000)

open(tab)
while (nrow(vcf_yield <- readVcf(tab, param=param))){
  sub_vcf_yield <- vcf_yield[rownames(vcf_yield) %in% x,]
  rsid <- rownames(sub_vcf_yield)
  ref_bp <- as.character(rowRanges(sub_vcf_yield)$REF)
  alt_bp <- as.character(unlist(rowRanges(sub_vcf_yield)$ALT))
  
  chunk_records <- cbind(rsid,ref_bp,alt_bp)
  ref_alt_df <- rbind(ref_alt_df,chunk_records)
  
}
close(tab)

write.table(ref_alt_df,"1000Geno_ref_alt.tsv",sep="\t",quote=F,col.names=FALSE,row.names=FALSE)

tmp <- ref_alt_df
rownames(tmp) <- NULL
colnames(tmp) <- NULL

tmp1 <- climber_df[climber_df$V2 %in% x,][c(2,6,5)]
rownames(tmp1) <- NULL
colnames(tmp1) <- NULL