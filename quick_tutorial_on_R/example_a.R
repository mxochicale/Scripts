#------------------------------------------------------------
#
# example_a.R is a script to read cvs files and plot the data.
#
# Miguel Xochicale <perez.xochicale AT gmail.com>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2017)
# http://mxochicale.github.io/
#
#------------------------------------------------------------

if (!require("lattice")) install.packages("lattice")
library(lattice)


#-----------------------------------------------------------------------
#Reading data file

main_path <- getwd()
data_path <- paste(main_path,"/data/experiment_name/participant_number/trial_number/", sep="")
setwd(data_path)


details = file.info(list.files(pattern="*.csv"))  #list all files with a specific extension
files = rownames(details)

rawdata<-read.csv(paste(files[1],"",sep=""), sep=',');
MD <- as.matrix(rawdata)# Matrix Data
MD <- cbind (MD, sqrt(MD[,3]^2 + MD[,4]^2 + MD[,5]^2) );    # C12 magnitude of ACC




#-----------------------------------------------------------------------
#Ploting data
window <- 250:800;

xyplot( MD[window,3] +  MD[window,4] + MD[window,5]  ~ MD[window,1],
               pch=16, col.line = c('red', 'blue', 'yellow3'), type = c("l","g"), lwd=4,
               main=list(label=paste("","",sep=""), cex=2.5),
               xlab=list(label="Samples", cex=3, fontfamily="Times"),
               ylab=list(label="Raw Data", cex=3, fontfamily="Times"),


               scales=list(
                 y=list(limits=c(-350,350)), # limits over y axis
                 font=3, cex=2),# font features for numbers over x and y axes

               ## labels
               key=list(
                 border= "grey",
                 text = list(c(expression(A[x]), expression(A[y]), expression(A[z]))),
                 lines = list(pch=c(1,2,3), col= c('red','blue','yellow3')), type="l", lwd=4,
                 cex=2, # control the character expansion  of the symbols
                 corner=c(0,0) # position
               ),
               ##function to modify the grid pattern
               panel=function(...) {
                 panel.xyplot(...)
                 panel.grid(h=-50, v=-1, col.line="blue", lwd=1, lty=3 )
               }
)



setwd(main_path)
