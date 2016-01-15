#------------------------------------------------------------
#
# example_b.R is a script to read cvs files from a specific directory as well
# using variables to define different experiments, participants and trials.
# example_b.R use myfunctions.R to load functions to read and to plot data.
#
# Miguel Perez-Xochicale <perez.xochicale AT gmail.com>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2017)
# https://twitter.com/mperezxochicale
#
#------------------------------------------------------------


main_path <- getwd()

#load paths
functions_path <-"~/mxochicale/phd/r-code/tutorial/functions/"
data_path <- "~/mxochicale/phd/r-code/tutorial/data/"

source(  paste(functions_path,"myfunctions.R", sep="")   )
setwd(data_path)

experiment_name <- "experiment_name"
participant_number <-  "participant_number"
trial_number <-  "trial_number"

setwd(paste(data_path,"/",experiment_name, "/", participant_number, "/", trial_number,sep="")  )  ; # set and get the current working directory

details = file.info(list.files(pattern="*.csv"))  #list all files with a specific extension
details = details[with(details, order(as.POSIXct(mtime))), ]
files = rownames(details)

imu0 <- get_ACCMAGGYRdata(files[1])
imu1 <- get_ACCMAGGYRdata(files[2])



#-----------------------------------------------------------------------
#Ploting data
# 

window <- 250:800;

setwd(main_path)
plots_path <- "plots"
if (file.exists(plots_path)){
  setwd(file.path(main_path, plots_path))
} else {
  dir.create(plots_path)
  setwd(file.path(main_path, plots_path))
}



plot_acc(imu0,window) 
plot_one_axis(imu0,10,window)
plot_two_axes_and_difference(imu0,3,imu1,3,window)



#-----------------------------------------------------------------------
#Ploting and saving graphical results
# 
png(filename=paste("ACC_","_imu0_",experiment_name, "__", participant_number, "__",trial_number,"_.png",sep=""), height=900, width=1500,bg="white")
plot_acc(imu0,window) 
dev.off() 

png(filename=paste("one_axis","_imu0_",experiment_name, "__", participant_number, "__",trial_number,"_.png",sep=""), height=900, width=1500,bg="white")
plot_one_axis(imu0,10,window)
dev.off() 

png(filename=paste("twoaxis_","_imu0_",experiment_name, "__", participant_number, "__",trial_number,"_.png",sep=""), height=900, width=1500,bg="white")
plot_two_axes_and_difference(imu0,3,imu1,3,window)
dev.off() 





setwd("../")
