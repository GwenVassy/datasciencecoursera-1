rankall <- function(outcome, num = "best") 
{
  data<-read.csv("outcome-of-care-measures.csv", na.strings="Not Available")
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia"))
    {

    stop("invalid outcome")

  }
  else
    {
    if (outcome=="heart attack") {data1<- cbind (data[7],data[11],data[2])}
    else if (outcome == "pneumonia"){ data1<- cbind (data[7],data[23],data[2])}
    else if (outcome== "heart failure") { data1<- cbind (data[7],data[17],data[2])}
    colnames(data1) <- c("state","Outcome","hospital")
    data3<-na.omit(data1)
    data4<-data3[order(data3[,2], data3[,3]),]
   # data6<-ddply(data4, "State", function(x){x$myrank = rank(x$Outcome); x[order(x$myrank),]})
     data5<- split(data4,data4$state)
     rank_func<-function(x) {
       
       if(num=="best"){num<-1}
       if(num=="worst"){num<-nrow(x)}
       
       x[num,3]
       
     }
     ranks<-sapply(data5,rank_func)
    
     data.frame(hospital=ranks, state=names(ranks))
    }
    
}


