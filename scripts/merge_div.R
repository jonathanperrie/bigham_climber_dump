setwd("~/Bigham/v2/")
data <- read.table("igsr_samples.tsv",sep="\t",header=T)
x <- scan("intersect_set.txt", what="", sep="\n")
delete_x <- scan("remove_set.txt", what="", sep="\n")

setwd("~/Bigham/v2/HGDP/")
hdgp_list <- read.table("HGDP_SampleList.txt")
matches_1 <- data[data$Sample.name %in% hdgp_list$V1,]
matches_1 <- matches_1[matches_1$Superpopulation.name=="Europe (HGDP)",]

div_mat <- read.table("HGDP_FinalReport_Forward.txt",sep="\t",row.names=1, header = TRUE)
div_int <- div_mat[x,colnames(div_mat) %in% matches_1$Sample.name]
div_int_filtered <- div_int[!(rownames(div_int) %in% delete_x),]

write.table(div_int_filtered,file="HGDP_intersect_bp.tsv",sep="\t",quote=F,col.names=NA,row.names=TRUE)