#! /usr/bin/env Rscript
####script-read csv and write out
library(readr)
print('please input thispath')
thispath<-readline(prompt = "the path is: ")
filenames <- dir(thispath) 
filePath <- sapply(filenames, function(x){ 
  paste(thispath,x,sep='/')})   
data <- lapply(filePath, function(thispath){
  read_csv(thispath)})  
merged_data <- do.call(rbind, data)
print('please choose the path to save merged data')
savepath<-readline(prompt = "the path is: ")
write_csv(merged_data,paste0(savepath,"merged_data.csv"))
print('merged data had been saved as merged_data.csv')
