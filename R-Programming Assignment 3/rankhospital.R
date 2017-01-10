rankhospital <- function(state, outcome, num = "best") 
  {
  data<-read.csv("outcome-of-care-measures.csv", na.strings="Not Available")
  states <- table(data$State)
  
  if (!state %in% names(states)) { 
    
    stop("invalid state")
    
  }
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    
    stop("invalid outcome")
    
  }
  else
  {
    if (outcome=="heart attack") {data1<- cbind (data[7],data[11],data[2])}
    else if (outcome == "pneumonia"){ data1<- cbind (data[7],data[23],data[2])}
    else if (outcome== "heart failure") { data1<- cbind (data[7],data[17],data[2])}
    colnames(data1) <- c("State","Outcome","Hospital")
    data2<-na.omit(data1)
    data3<-subset(data2,(State==state),select=c(State,Outcome,Hospital))
    data4<-data3[order(data3[,2], data3[,3]),]
    data4$ID<-seq.int(nrow(data4))
    if (num=="best") {num=1}
    if (num=="worst") {num=nrow(data4)}
    data5<-subset(data4,(ID==num),select=c(State,Outcome,Hospital,ID))
    data5
  }
}