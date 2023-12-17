rm(list = ls())
file.exists(getwd())
library(readr)
thispath <- getwd()
filenames <- dir(thispath) 
data <- lapply(filenames, function(thispath){
  read_csv(thispath)})  
merged_data <- do.call(rbind, data)
write_csv(merged_data,paste0("assign2_plus.csv"))

# 加载需要的库  
library(dplyr)  
library(stringr)  
library(tidyr)

# 读取Aminer数据  
aminer_data <- merged_data  

# 读取scientist_pub数据  
scientist_pub_data <- read_csv("/Users/yitong/bigdata/idaccuracy/scientist_pub.csv")  

# 从文件名中提取uniqueID  
#file_ <-file.path("/Users/yitong/bigdata/idaccuracy/Aminer")
str_to_upper(filenames)
uniqueID <- str_extract(filenames, "0_\\d+")

# 根据uniqueID连接两张表  
merged_data_final <- left_join(aminer_data, scientist_pub_data, by = uniqueID)  
###一个uniqueID对应多篇文章？

# 计算精准度和查全率  
precision <- sum(merged_data_final$is_correct) / nrow(merged_data_final)  
recall <- sum(merged_data_final$is_correct) / sum(scientist_pub_data$is_correct)  

# 打印结果  
print(paste("Precision: ", precision))  
print(paste("Recall: ", recall))

