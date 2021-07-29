setwd("~/Bigham/v2/")
x <- scan("intersect_set.txt", what="", sep="\n")

setwd("~/Bigham/v2/Climber/")
climber_df <- read.table("EuropeanClimbers.bim",sep="\t")

write.table(climber_df[climber_df$V2 %in% x,][c(2,6,5)],"../Climber/EuropeanClimbers_ref_alt.tsv",sep="\t",quote=F,col.names=FALSE,row.names=FALSE)