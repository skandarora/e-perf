## Load cleaned generalized data sets
source("1.preparing_generalized_dataset.R")
rm(mit_data, harvard_data)

## k-means
kObj <- kmeans(df.original_2[,c("grade", "certified", "explored")], centers=3)
paste("betweens = ",kObj$betweenss)
paste("withinss = ", kObj$tot.withinss)
paste("betweens/tot.withinss = ", kObj$betweenss/kObj$tot.withinss)
clustered_combined_data <- cbind(df.original_2, data.frame(kObj$cluster))