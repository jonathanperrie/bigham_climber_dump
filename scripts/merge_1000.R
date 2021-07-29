library(VariantAnnotation)

setwd("~/Bigham/v2/")
data <- read.table("igsr_samples.tsv",sep="\t",header=T)
x <- scan("intersect_set.txt", what="", sep="\n")

setwd("~/Bigham/v2/1000")
geno1000_list<-read.table("affy_samples.20141118.panel",sep="\t",header=T)
matches_2 <- data[data$Sample.name %in% geno1000_list$sample,]
matches_2 <- matches_2[matches_2$Superpopulation.name=="European Ancestry",]
write.csv(matches_2[c("Sample.name","Sex","Population.code")],"1000geno_meta.csv",quote=F,row.names=FALSE)

genoSum <- function(x) {
  suppressWarnings(sum(as.integer(strsplit(x,"/")[[1]])))
}

genoSumOneRow <- function(y){
  sapply(y,genoSum)
}

idx<- 1
param <- ScanVcfParam(fixed="ALT", geno=c("GT"))
tab <- TabixFile("ALL.wgs.nhgri_coriell_affy_6.20140825.genotypes_has_ped.vcf.gz", yieldSize=25000)

open(tab)

# first pass to append column names 
vcf_yield <- readVcf(tab, param=param)
tmp<-geno(vcf_yield[rownames(vcf_yield) %in% x,colnames(vcf_yield) %in% matches_2$Sample.name])$GT
geno_int <- matrix(nrow=dim(tmp)[1],ncol=dim(tmp)[2])
rownames(geno_int)<-rownames(tmp)
colnames(geno_int)<-colnames(tmp)

for (i in seq(dim(tmp)[1])){
  geno_int[i,] <- sapply(tmp[i,],genoSumOneRow)
}

write.table(geno_int,"1000Genomes_intersect.tsv",sep="\t",quote=F,col.names=NA,row.names=TRUE,append=FALSE)
print(idx)
idx <- idx+1

# additional passes to not append column names
while (nrow(vcf_yield <- readVcf(tab, param=param))){
  tmp<-geno(vcf_yield[rownames(vcf_yield) %in% x,colnames(vcf_yield) %in% matches_2$Sample.name])$GT
  geno_int <- matrix(nrow=dim(tmp)[1],ncol=dim(tmp)[2])
  rownames(geno_int)<-rownames(tmp)
  colnames(geno_int)<-colnames(tmp)
  
  for (i in seq(dim(tmp)[1])){
    geno_int[i,] <- sapply(tmp[i,],genoSumOneRow)
  }
  
  write.table(geno_int,"1000Genomes_intersect.tsv",sep="\t",quote=F,col.names=FALSE,row.names=TRUE,append=TRUE)
  print(idx)
  idx <- idx+1
}
close(tab)