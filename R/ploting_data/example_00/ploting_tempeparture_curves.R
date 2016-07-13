#------------------------------------------------------------
#
# miguel [http://mxochicale.github.io]
#
#------------------------------------------------------------

if (!require("lattice")) install.packages("lattice")
library(lattice)


#################
#Reading data file

main_path <- getwd()
TEMPVAL <- "202"

data_path_TEMP <- paste(main_path,"/data/TEMP",TEMPVAL, sep="")
setwd(data_path_TEMP)

details = file.info(list.files(pattern="*.txt"))  #list all files with a specific extension
files = rownames(details)


#################
# Read txt files
a<-read.table(files[1], header=FALSE)
b<-read.table(files[2], header=FALSE)
c<-read.table(files[3], header=FALSE)
d<-read.table(files[4], header=FALSE)
e<-read.table(files[5], header=FALSE)
F<-read.table(files[6], header=FALSE)
g<-read.table(files[7], header=FALSE)
h<-read.table(files[8], header=FALSE)

#Concatenating the txt files into a Matrix Data (MD)
MD <- cbind (a,b,c,d,e,F,g,h)


#############################################
# Create a path to save the graphical results
setwd(main_path)
plots_path <- "plots"
if (file.exists(plots_path)){
  setwd(file.path(main_path, plots_path))
} else {
  dir.create(plots_path)
  setwd(file.path(main_path, plots_path))
}

#############################################
# Plotting data and saving it as images
filenameplot <- paste("TEMP_",TEMPVAL,".png",sep="")
png(filenameplot, height=900, width=1500,bg="white")

xyplot( t(MD[1]) + t(MD[2]) +t(MD[3]) +t(MD[4]) +t(MD[5]) +t(MD[6]) + t(MD[7]) ~ 1:dim(MD)[1],
         pch=1:7, col=1:7, type = c("l","g"), lwd=3,
         main=list(label=paste("Temp=", TEMPVAL, sep=""), cex=3, fontfamily="Times"),
         xlab=list(label="Iterations", cex=3, fontfamily="Times"),
         ylab=list(label="Values", cex=3, fontfamily="Times"),
         )


dev.off()





setwd(main_path)
