library(BEDMatrix)
library(VariantAnnotation)

setwd("~/Bigham/v2/Climber")
climber_mat <- BEDMatrix("EuropeanClimbers.bed")
rsid_df <- read.table("EuropeanClimbers.bim",sep="\t")

sex_chromosome <- rsid_df[rsid_df$V1=="24",]
chrY_id <- as.integer(rownames(sex_chromosome[grepl("chrY",sex_chromosome$V2),]))

chrY_climber_mat <- climber_mat[,chrY_id]
chrY_climber_mat[is.na(chrY_climber_mat)] <- -1
rowSums(chrY_climber_mat)

# both IA2_IA2 and S371_S371 have a lack of chromosome  