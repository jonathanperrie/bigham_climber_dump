setwd("~/Bigham/v2/")
x <- scan("intersect_set.txt", what="", sep="\n")
delete_x <- scan("remove_set.txt", what="", sep="\n")
hgdp <- read.table("HGDP/HGDP_intersect_bp.tsv",sep="\t",row.names=1,header=1)

tmp1<-read.table("Climber/EuropeanClimbers_ref_alt.tsv",sep="\t")
rownames(tmp1)<-tmp1$V1
tmp1<-tmp1[x,]
tmp1<-tmp1[!(rownames(tmp1) %in% delete_x),]

swap_snps <- list()

for (i in 1:dim(tmp1)[1]){
  geno_list <- list()
  alt_ref <- as.character(tmp1[i,2:3])
  genotypes <- c(paste0(alt_ref[1],alt_ref[2]),paste0(alt_ref[2],alt_ref[1]),paste0(alt_ref[2],alt_ref[2]),paste0(alt_ref[1],alt_ref[1]))
  if (!(hgdp[i,1] %in% genotypes))
    swap_snps[i] <- i
}


cat(NULL,file="flip_set.txt")
lapply(rownames(hgdp)[unlist(swap_snps)],write,"flip_set.txt",append=TRUE)