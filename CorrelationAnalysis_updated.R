## 'directory' is a charactor vector of length 1 indicating
## the location of CSV files
##
## 'threshold' is a numeric vector of length 1 indicting the
## number of completely observed observations (on all variables)
## required to compute the CORRELATION between two kinds of pollutant,
##
## Return a numeric vector of correlations

corr<-function(dir, threshold = 0){
        x<- file.path("F:","R_coursera",dir)
        fl<- list.files(x,"csv",full.names = TRUE)
        ans<-c()
        for (i in 1:332){
                data<-read.csv(fl[i])
                output<- complete(dir,i)
                if (output$nobs > threshold){
                        mydata <- data[complete.cases(data),][,c(2,3)]
                        ans[i]<-cor(mydata[,2],mydata[,1],method = c("pearson", "kendall", "spearman"))
                } else {0}
        }
       ans<-ans[!is.na(ans)]
}