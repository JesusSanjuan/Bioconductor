#human---------------------------------------------------------------

#setwd("D:\sistema\Descargas\secuencia")
##import the count data

setwd("D:/Sistema/Escritorio/secuencia")

##import the count data
hum = read.table("tsne.csv",header=TRUE,sep=",")
##import the count data

#reorder dataframes
order_hum = hum[ order(row.names(hum)), ]

#remove genes in less than 30 cells
rm_genes = which(rowSums(order_hum > 0) <30)
r2 = order_hum [-rm_genes,]

library(ggplot2)
library(scran)
library(scater)
#create sce object
sce = SingleCellExperiment(list(counts = data.matrix(r2)))

#do clustering to reduce heterogeneity
clusters = quickCluster(sce, min.size=50, method="hclust" )

