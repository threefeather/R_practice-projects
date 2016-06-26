pollutantmean<- function(dir,pollutant,id=1:332){
        x<-file.path("F:","R_coursera",dir)
        setwd(x)
        fl<-list.files(x, "csv",full.names=TRUE)
        dat<-data.frame()
        for (i in 1:length(id)){
                n<-id[i]
                dat_i<-read.csv(fl[n]) 
                dat<-rbind(dat,dat_i)
        }
        sel<-dat[pollutant]
        good<-complete.cases(sel)
        mean(sel[good,])
}
