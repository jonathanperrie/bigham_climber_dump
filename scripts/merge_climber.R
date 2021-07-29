library(BEDMatrix)

setwd("~/Bigham/v2/Climber")
climber_mat <- BEDMatrix("EuropeanClimbers.bed")

x <- scan("../intersect_set.txt", what="", sep="\n")

climber_row <- sapply(strsplit(colnames(climber_mat),"_"), `[`,1)
climber_int <- climber_mat[,climber_row %in% x]

write.table(t(climber_int),"EuropeanClimbers_intersect.tsv",sep="\t",quote=F,col.names=NA,row.names=TRUE)