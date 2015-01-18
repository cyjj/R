complete<-function(directory, id =1:332){
	nobs = numeric(0)
	for(i in id){
		data <- read.csv(paste(directory,"/",sprintf("%03d",i),".csv",sep=""))
		nobs <- c(nobs,sum(!is.na(data$sulfate)& !is.na(data$nitrate)))
	}
	data.frame(id=id,nobs=nobs)
}