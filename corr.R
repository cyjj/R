corr <- function(directory,threshold= 0){
	 ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
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