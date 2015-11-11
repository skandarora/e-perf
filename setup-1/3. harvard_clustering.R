## Load cleaned generalized data sets
source("1.preparing_generalized_dataset.R")
rm(df.original_2, mit_data)

## k-means
kObj <- kmeans(harvard_data[,c("grade", "certified", "explored")], centers=3)
paste("betweens = ",kObj$betweenss)
paste("withinss = ", kObj$tot.withinss)
paste("betweens/tot.withinss = ", kObj$betweenss/kObj$tot.withinss)
clustered_harvard_data <- cbind(harvard_data, data.frame(kObj$cluster))
table(clustered_harvard_data$kObj.cluster) #Print

## Extracting Clusters
cluster1_harvard <- subset(clustered_harvard_data, kObj.cluster ==1) # Extract cluster-1
cluster2_harvard <- subset(clustered_harvard_data, kObj.cluster ==2) # Extract cluster-2
cluster3_harvard <- subset(clustered_harvard_data, kObj.cluster ==3) # Extract cluster-3