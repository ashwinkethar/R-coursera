pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        #pollutant_l <- pollutant
        list_of_files <- list.files(path = directory, pattern = "*.csv", full.names=TRUE)
        data_all <-lapply(list_of_files, read.csv)
        df <- ldply (data_all, data.frame)
        min_id <- min(id) - 1;max_id <- max(id) + 1
        pol <- df[(df["ID"]>min_id & df["ID"]< max_id), pollutant]
        p<-na.omit(pol)
        mean(p)
}
