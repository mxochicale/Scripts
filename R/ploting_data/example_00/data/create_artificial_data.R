#------------------------------------------------------------
#
# miguel [http://mxochicale.github.io]
#
#------------------------------------------------------------



#################
# Creating subdirectories
mainDir <- getwd()
subDir <- "TEMP"

mint <-200
maxt <-210
for (temp in mint:maxt ){

if (file.exists(  paste(subDir,temp, sep="")  )){
    setwd(file.path(mainDir, paste(subDir,temp, sep="") ))
    setwd("../")
} else {

    dir.create(file.path(mainDir, paste(subDir,temp, sep="")))
    setwd(file.path(mainDir, paste(subDir,temp, sep="")))

    ####################################################
    # Create A.txt files with 10 gaussian random values
    clist <- c("a", "b", "c", "d", "e", "F", "g", "h")
    for (filename in clist ){
    randomvector <- rnorm(10,mean = 0, sd = 1)
    write(randomvector, file=paste(filename, ".txt",sep=""),ncolumns =1)
    }

    setwd("../")
}


}
