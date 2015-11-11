## Load cleaned generalized data sets
source("1.preparing_generalized_dataset.R")
rm(df.original_2, harvard_data)

## k-means
kObj <- kmeans(mit_data[,c("grade", "certified", "explored")], centers=3)
paste("betweens = ",kObj$betweenss)
paste("withinss = ", kObj$tot.withinss)
paste("betweens/tot.withinss = ", kObj$betweenss/kObj$tot.withinss)
clustered_mit_data <- cbind(mit_data, data.frame(kObj$cluster))
table(clustered_mit_data$kObj.cluster) #Print

## Extracting Clusters
cluster1_mit <- subset(clustered_mit_data, kObj.cluster ==1) # Extract cluster-1
cluster2_mit <- subset(clustered_mit_data, kObj.cluster ==2) # Extract cluster-2
cluster3_mit <- subset(clustered_mit_data, kObj.cluster ==3) # Extract cluster-3