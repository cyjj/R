pollutantmean <- function(directory, pollutant , id = 1:332){
	
	c <- NA
	for(i in id){
		data<-read.csv(paste(directory,"/",sprintf("%03d",i),".csv",sep=""))
		c<-rbind(data,c)
	}
	a<-mean(c[[pollutant]],na.rm=T)
	a
}