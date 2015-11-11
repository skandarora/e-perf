## Load cleaned generalized data sets
source("1.preparing_generalized_dataset.R")
rm(mit_data, harvard_data)

## k-means
kObj <- kmeans(df.original_2[,c("grade", "certified", "explored")], centers=3)
paste("betweens = ",kObj$betweenss)
paste("withinss = ", kObj$tot.withinss)
paste("betweens/tot.withinss = ", kObj$betweenss/kObj$tot.withinss)
clustered_combined_data <- cbind(df.original_2, data.frame(kObj$cluster))
table(clustered_combined_data$kObj.cluster) #Print

## Extracting Clusters
cluster1_combined <- subset(clustered_combined_data, kObj.cluster ==1) # Extract cluster-1
cluster2_combined <- subset(clustered_combined_data, kObj.cluster ==2) # Extract cluster-2
cluster3_combined <- subset(clustered_combined_data, kObj.cluster ==3) # Extract cluster-3