complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        list_of_files <- list.files(path = directory, pattern = "*.csv", full.names=TRUE)
        data_all <-lapply(list_of_files, read.csv)
        df <- ldply (data_all, data.frame)
        ids<-double();nobs<-double()
        for (i in id){
                pol <- df[(df["ID"]==i),]
                p<-na.omit(pol)
                r<-nrow(p)
                ids<-c(i,ids);nobs<-c(r,nobs)
        }        
        ids<-rev(ids);nobs<-rev(nobs)
        odf<-data.frame(ids, nobs)
        return(odf)
}