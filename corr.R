corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        cdf<-complete(directory,1:332)
        tcdf<- cdf[cdf["nobs"]>threshold,]
        ids<-tcdf["ids"]
        list_of_files <- list.files(path = directory, pattern = "*.csv", full.names=TRUE)
        data_all <-lapply(list_of_files, read.csv)
        crr<-vector()
        if (nrow(ids) < 1){
                print("Threshold not met")
                return(crr)
        }
        else{
                for (i in 1:nrow(ids)){
                        oper_df<- data_all[ids[i,1]]
                        oper<-ldply(oper_df,data.frame)
                        om_oper<-na.omit(oper)
                        sul<-om_oper["sulfate"]
                        nit<-om_oper["nitrate"]
                        crr<-c(cor(sul,nit),crr)
                }
                crr<-rev(crr)
                return(crr)
        }
}