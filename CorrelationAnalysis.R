corr<-function(dir, threshold = 0){
        x<- file.path("F:","R_coursera","specdata")
        fl<- list.files(x,"csv",full.names = TRUE)
        data<- data.frame()
        for (i in 1:332){
                data_i<-read.csv(fl[i])
                output<- complete("specdata",i)
        if (output$nobs > 150){
                data<- rbind(data,data_i)
        }
                }
        mydata <- data[complete.cases(data),][,c(2,3)]
        cr<-cor(mydata[,2],mydata[,1],method = c("pearson", "kendall", "spearman"))
}