setwd("~/Bigham/v2/")

delete_x <- scan("remove_set.txt", what="", sep="\n")

df1 <- read.table("1000/1000Genomes_intersect.tsv",sep="\t",header=1,row.names=1)
df2 <- read.table("Climber/EuropeanClimbers_intersect.tsv",sep="\t",header=1,row.names=1)

climber_row <- sapply(strsplit(rownames(df2),"_"), `[`,1)

df1<-df1[(!c(rownames(df1) %in% delete_x)),]
df2<-df2[(!c(climber_row %in% delete_x)),]

write.table(df1,"1000/1000Genomes_intersect_adj.tsv",sep="\t",quote=F,col.names=NA,row.names=TRUE)
write.table(df2,"Climber/EuropeanClimbers_intersect_adj.tsv",sep="\t",quote=F,col.names=NA,row.names=TRUE)


rownames(df1)<-rownames(df2)

df_merge <- cbind(df1,df2)
df_merge[is.na(df_merge)]<-(-1)

write.csv(df_merge,"merged_data.csv",quote=F,row.names=TRUE)