## Loading original data set
df.original <- read.csv(file = "HMXPC13_DI_v2_5-14-14.csv", header = TRUE, sep=",", dec=".",
                        na.strings = c("Not Available", NA, ""))

## Removing 'registered' & 'roles' field completely
df.original <- subset(df.original, select = -c(registered, roles))

## Splitting 'course_id' into 3 parts
split <- data.frame(do.call('rbind', strsplit(as.character(df.original$course_id),"/", fixed = TRUE))) #New 3 columns
df.original_1 <- cbind(split, subset(df.original, select=-c(course_id))) # New 3 columns cbinded with old data
rm(df.original, split)  # Removing variables that are no longer required 
colnames(df.original_1)[1:3] <- c("university", "course", "semester") # Renaming the newly created columns

## Removing rows with NA 'grade' : 57,400 enrollers removed
bad <- is.na(df.original_1$grade) # students with NA grades
df.original_2 <- df.original_1[!bad,] # removed
rm(df.original_1,bad)

## Spliting dataset into :MIT & Harvard
mit_data <- subset(df.original_2, university == "MITx") # 274100 enrollers
harvard_data <- subset(df.original_2, university == "HarvardX") # 309638 enrollers

