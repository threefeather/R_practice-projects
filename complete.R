## 'directory' is a charactor vector of length 1 indicating
## the location of CSV files
##
##'id' is an integer vector indicating the monitor ID numbers
## to be used
##
## Return a data frame of form:
## id   nobs
##  1   117
##  ....
##  where id is the monitor ID number and 'nobs' is the 
##  number of complete cases

complete<-function (dir, id=1:332){
        x<- file.path("F:","R_coursera",dir)
        fl<- list.files(x,"csv",full.names = TRUE)
        output<- data.frame(id=id,nobs=c(1:length(id)),stringsAsFactors = FALSE)
        for(i in 1:length(id)){
                data<- read.csv(fl[id[i]])
                com_data<- complete.cases(data)
                number<-sum(com_data)
                output$nobs[i]=number  
        }
        output
}