corr <- function(directory,threshold= 0){
	source("complete.R")
	a <- complete(directory)
	data<- a[a$nobs > threshold,]
	result = numeric(0)
	for(i in data$id){
		d <- read.csv(paste(directory,"/",sprintf("%03d",i),".csv",sep=""))
		b<- d[!is.na(d$sulfate)& !is.na(d$nitrate),]
		result <- c(result,cor(b$sulfate,b$nitrate))
	}
	result
}