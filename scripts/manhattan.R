library(qqman)

setwd("~/Bigham/v2/Climber")
df<-read.csv("plink2.PHENO1.glm.logistic.hybrid",sep="\t")

rsid_df <- read.table("EuropeanClimbers_intersect_adj.tsv",sep="\t",header=1,row.names=1)
climber_row <- sapply(strsplit(rownames(rsid_df),"_"), `[`,1)

df<-df[!is.na(df$P),]
df$X.CHROM[df$X.CHROM=="X"]="23"
df$X.CHROM[df$X.CHROM=="Y"]="24"
df<-df[df$X.CHROM %in% seq(24),]
df$X.CHROM <- as.integer(df$X.CHROM)
df$POS <- as.integer(df$POS)

df_sub<- df[(df$ID %in% climber_row),]
snps<-df_sub[,names(df_sub) %in% c("X.CHROM","ID","POS","P")]
names(snps)<-c("CHR","BP","SNP","P")
manhattan(snps,chr="CHR",bp="BP",snp="SNP",p="P",annotatePval=0.001,annotateTop=TRUE)


id_pval<-snps[c("ID","P")]
rownames(id_pval)<-id_pval$ID
x <- scan("../../../../Desktop/bigham/assets.txt", what="", sep="\n")
rsid_df$mag = x

tmp<-id_pval[climber_row,]