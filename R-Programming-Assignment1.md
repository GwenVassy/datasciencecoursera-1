#Part1
pollutantmean <- function(directory, pollutant, id= 1:332)

{   
  #directory = specdata

  #pollutant = sulpher, nitrant

  #Id = 001.csv, 002.csv.........

  #List all the files in the directory

  files <- list.files(directory,full.names = TRUE)

  #Create an empty dataframe in which you can combine all the files with the given id 

  data_frame <- data.frame()

  for (i in id)

  { 

    #read in the file


    read_file<- read.csv(files[i], header=TRUE)


    #print(read_file)


    #add files to the main data frame


    data_frame<-rbind(data_frame,read_file)


    #print(data_frame)
    
  }

 meanf<-(mean(data_frame[[pollutant]],na.rm = TRUE)) 
  
  return(round(meanf, 3)) 


  
}

*pollutantmean("specdata", "sulfate", 1:10)*

[1] 4.064

*pollutantmean("specdata", "nitrate", 70:72)*

[1] 1.706

*pollutantmean("specdata", "sulfate", 34)*

[1] 1.4772

#Part2

complete<- function(directory, id= 1:332)

{  
 
  #directory = specdata

  #Id = 001.csv, 002.csv.........

  # List all the files in the directory

  files <- list.files(directory,full.names = TRUE)

  #Create an empty dataframe in which you can combine all the files with the given id 

  dataFrame <- data.frame()

  for (i in id)

  { 
    
    #read in the file

    
    read_file<- read.csv(files[i], header=TRUE)


    #delete NAs

    
    read_file<-na.omit(read_file)

    
    #Count rows without NAs now

    
    nobs<- nrow(read_file)

    
    dataFrame<-rbind(dataFrame,data.frame(id,nobs))
    
  }

  return (dataFrame) 
  
}

*cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))*

*print(cc$nobs)*

 [1] 228 228 228 228 228 228 228 148 148 148 148 148 148 148 124 124 124 124 124 124 124 165 165

[24] 165 165 165 165 165 104 104 104 104 104 104 104 460 460 460 460 460 460 460 232 232 232 232

[47] 232 232 232

*cc <- complete("specdata", 54)*

*print(cc$nobs)*

[1] 219

#Part3

complete.R

corr<- function(directory, threshold=0)

{   
  # List all the files in the directory

  files <- list.files(directory,full.names = TRUE)
  
  #create empty vector

  data_vector <- vector(mode = "numeric", length = 0)
  
  for(i in 1:length(files))

{


    #read in file


    read_file<- read.csv(files[i],header=TRUE)


    #delete NAs


    read_file<-read_file[complete.cases(read_file),]


    #count the number of observations


    nob<-nrow(read_file)


    #if the number of rows is greater than the threshold


    if(nob>threshold)
{


      #for that file you find the correlation between nitrate and sulfate

      #combine each correlation for each file in vector format using the concatenate function 

      #since this is not a data frame we cannot use rbind or cbind

      data_vector<-c(data_vector,cor(read_file$nitrate,read_file$sulfate))
    }
    
  }
  
  return(data_vector)
  
}
cr <- corr("specdata", 400)
head(cr)
[1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
summary(cr)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630

cr <- corr("specdata", 150)
head(cr)
[1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
summary(cr)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out) 
[1]  0.2688  0.1127 -0.0085  0.4586  0.0447

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out) 
[1] 243.0000   0.2540   0.0504  -0.1462  -0.1680   0.5969

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))  [1]  0.0000 -0.0190  0.0419
