setwd("~/Bigham/v2/")
x <- scan("intersect_set.txt", what="", sep="\n")

tmp1<-read.table("Climber/EuropeanClimbers_ref_alt.tsv",sep="\t")
rownames(tmp1)<-tmp1$V1
tmp1<-tmp1[x,]

tmp2<-read.table("1000/1000Geno_ref_alt.tsv",sep="\t")
rownames(tmp2)<-tmp2$V1
tmp2<-tmp2[x,]

cat(NULL,file="remove_set.txt")
lapply(rownames(tmp1)[which(!tmp1[,2]==tmp2[,2])],write,"remove_set.txt",append=TRUE)