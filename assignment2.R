###! /usr/bin/env Rscript
######assignment2
#1.使用R中的数据读写，文件路径，for循环语句，读入路径“/assignment_idaccuracy/Aminer”总的所有文件，并将数据合并成为一个data.frame输出。
rm(list = ls())
mypath<-'bigdata/idaccuracy/Aminer'
setwd(mypath)
file.exists(mypath)
filenames = dir(mypath)
filenames
library(readr)
library(readxl)
for(i in 2:length(filenames)){
  data =read_csv(file = paste(mypath,filenames[i],sep = "//"))
}
write_csv(data,paste0("bigdata/idaccuracy/Aminer/","assign2_merged_data.csv"))

###2.使用apply家族函数替代上述步骤中的for循环
###read csv and write out
rm(list = ls())
library(readr)
thispath<-'E:/USERS/econ_big_data/data/assignment_idaccuracy/Aminer/'
filenames <- dir(thispath) 
data <- lapply(filenames, function(thispath){
  read_csv(thispath)})  
merged_data <- do.call(rbind, data)
write_csv(merged_data,paste0("E:/USERS/econ_big_data/assignment/","assign2_plus.csv"))

###3.将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径
setwd('yitong/bigdata/idaccuracy/idaccuracy')
source("read_csv.R")

