setwd("~/Bigham/v2/")

hif1a<-c("rs10873142",
"rs11158358",
"rs11549465",
"rs11549467",
"rs12434438",	
"rs142179458",	
"rs1951795",
"rs1957757",	
"rs2057482",
"rs2301113"	,
"rs34005929",
"rs41508050",
"rs7143164"	,
"rs8005745")

epas1<-c(
  "rs10187368",	
  "rs11894252",
  "rs12617313",
  "rs13419896"	,
  "rs137853036"	,
  "rs137853037"	,
  "rs141965374",	
  "rs17039192",
  "rs4953346",
  "rs4953354",
  "rs7579899"	,
  "rs7582701",
  "rs9679290"	
)

egln1<-c(
  "rs119476044",
  "rs119476045",
  "rs12097901",
  "rs186996510",	
  "rs479200",
  "rs480902",
  "rs516651",
  "rs80358193"
)

df=read.csv("merged_data.csv",row.names=1)
rsid<-sapply(strsplit(rownames(df),"_"), `[`,1)

hif1a[hif1a %in% rsid]
epas1[epas1 %in% rsid]
egln1[egln1 %in% rsid]