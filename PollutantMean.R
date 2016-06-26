## 'directory' is a charactor vector of length 1 indicating
## the location of CSV files
##
##'id' is an integer vector indicating the monitor ID numbers
## to be used
## 
## 'pollutant' is a character vector of length 1 indicating 
## the name of pollutant for which we will calculate the mean
##
## return the mean of pollutant across all monitor list
## in the 'id' vector (ignore NA values)

pollutantmean<- function(dir,pollutant,id=1:332){
        x<-file.path("F:","R_coursera",dir)
        setwd(x)
        fl<-list.files(x, "csv",full.names=TRUE)
        dat<-data.frame()
        for (i in 1:length(id)){
                dat_i<-read.csv(fl[id[i]]) 
                dat<-rbind(dat,dat_i)
        }
        sel<-dat[pollutant]
        good<-complete.cases(sel)
        mean(sel[good,])
}