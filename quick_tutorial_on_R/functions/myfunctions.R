#-----------------------------------------------------------------------
#
# myfunctions.R
#
# Miguel Perez-Xochicale <perez.xochicale AT gmail.com>
# Doctoral Researcher in Human-Robot Interaction
# University of Birmigham, U.K. (2014-2017)
# https://twitter.com/mperezxochicale
#
#-----------------------------------------------------------------------



#-----------------------------------------------------------------------
#
## How to use 
#   add the following line to your main script 
#   for the directory where the functions and the R scripts lives, you have to add
#
#
# functions_path <-"~/"
# source(  paste(functions_path,"myfunctions.R", sep="")   )
#
#
## MODIFICATIONS
# *
#
## TODO
# *
#-----------------------------------------------------------------------



#http://stackoverflow.com/questions/15155814/check-if-r-package-is-installed-then-load-library
if (!require("lattice")) install.packages("lattice")
library(lattice)


#-----------------------------------------------------------------------
#
# get a matrix for the ACC MAG and GYR sensors  
#
# gets data from a file and it's converted into a Matrix
# input:  filename
# output: Matrix Data (MD)
#
#         MD[,1] Sample
#         MD[,2] Time
#
#         MD[,3] ACCX
#         MD[,4] ACCY
#         MD[,5] ACCZ
#
#         MD[,6] MAGX
#         MD[,7] MAGY
#         MD[,8] MAGZ
#
#         MD[,9]  GYRX
#         MD[,10] GYRY
#         MD[,11] GYRZ
#
#         MD[,12] MAG_ACC
#         MD[,13] MAG_MAG
#         MD[,14] MAG_GYR
#
get_ACCMAGGYRdata<- function(filename_imuN)
{
    
  rawdata<-read.csv(paste(filename_imuN,"",sep=""), sep=',');
  MD <- as.matrix(rawdata)# Matrix Data
  
  MD <- cbind (MD, sqrt(MD[,3]^2 + MD[,4]^2 + MD[,5]^2) );    # C12 magnitude of ACC 
  MD <- cbind (MD, sqrt(MD[,6]^2 + MD[,7]^2 + MD[,8]^2) );    # C13 magnitude of MAG
  MD <- cbind (MD, sqrt(MD[,9]^2 + MD[,10]^2 + MD[,11]^2) );  # C14 magnitude of GYR
  
  # Return Matrix Data
  return(MD)
}
# example of usage:
# imu0 <- get_ACCMAGGYRdata(files[1])




#-------------------------------------------------------------------------------------
#-------------------- plot_timeserie function  --------------------------

plot_acc<- function(matrix_data,window)
{

 plot = xyplot( matrix_data[window,3] +  matrix_data[window,4] + matrix_data[window,5]  ~ matrix_data[window,1], 
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
    )# < xyplot
  
  print(plot)
  
}
#Example
#plot_acc(participant0_imu0,window) 


plot_mag<- function(matrix_data,window)
{
  plot = xyplot( matrix_data[window,6] +  matrix_data[window,7] + matrix_data[window,8]  ~ matrix_data[window,1], 
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
                   text = list(c(expression(M[x]), expression(M[y]), expression(M[z]))),  
                   lines = list(pch=c(1,2,3), col= c('red','blue','yellow3')), type="l", lwd=4,
                   cex=2, # control the character expansion  of the symbols
                   corner=c(0,0) # position
                 ),
                 ##function to modify the grid pattern
                 panel=function(...) {
                   panel.xyplot(...)
                   panel.grid(h=-50, v=-1, col.line="blue", lwd=1, lty=3 )
                 }
  )# < xyplot
  
  print(plot)
  
}

plot_gyr<- function(matrix_data,window)
{
  plot = xyplot( matrix_data[window,9] +  matrix_data[window,10] + matrix_data[window,11]  ~ matrix_data[window,1], 

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
                   text = list(c(expression(G[x]), expression(G[y]), expression(G[z]))),  
                   lines = list(pch=c(1,2,3), col= c('red','blue','yellow3')), type="l", lwd=4,
                   cex=2, # control the character expansion  of the symbols
                   corner=c(0,0) # position
                 ),
                 ##function to modify the grid pattern
                 panel=function(...) {
                   panel.xyplot(...)
                   panel.grid(h=-50, v=-1, col.line="blue", lwd=1, lty=3 )
                 }
  )# < xyplot
  
  print(plot)
  
}




plot_one_axis<- function(matrix_data, axis_number,window)
{
  plot = xyplot(  matrix_data[window,axis_number]   ~ matrix_data[window,1],                             
                  pch=16, col.line = c( 'blue'), type = c("l","g"), lwd=5,
                  main=list(label=paste("","",sep=""), cex=2.5),
                  xlab=list(label="Samples", cex=3, fontfamily="Times"),
                  ylab=list(label="Raw Data", cex=3, fontfamily="Times"),
                  
                  
                   scales=list(
                     y=list(limits=c(-300,300)),
                     font=3, cex=2),# size of the number labels from the x-y axes
                  
                  ## labels
                  key=list(
                    border= "grey", 
                    text = list(c( expression(VB[ya])  )),  
                    lines = list(pch=c(1), col= c('blue')), type="l", lwd=4,
                    cex=2, # control the character expansion  of the symbols
                    corner=c(0,0) # position
                  ),
                  ##function to modify the grid pattern
                  panel=function(...) {
                    panel.xyplot(...)
                    panel.grid(h=-50, v=-1, col.line="blue", lwd=1, lty=3 )
                  }
  )# < xyplot
  
  print(plot)
  
}
# example
# plot_one_axis(datamatrix,22,window)



plot_two_axes_and_difference<- function(matrix_data_A, axis_number_A, matrix_data_B, axis_number_B,window)
{
  plot = xyplot(  matrix_data_A[window,axis_number_A] + matrix_data_B[window,axis_number_B] +
                    (matrix_data_A[window,axis_number_A] - matrix_data_B[window,axis_number_B])
                  ~ matrix_data_A[window,1],                             
                  pch=16, col.line = c( 'blue', 'red', 'black'), type = c("l","g"), lwd=3,
                  main=list(label=paste("","",sep=""), cex=2.5),
                  xlab=list(label="Samples", cex=3, fontfamily="Times"),
                  ylab=list(label="Raw Data", cex=3, fontfamily="Times"),
                  
                  
                  scales=list(
                    y=list(limits=c(-300,300)),
                    font=3, cex=2),# size of the number labels from the x-y axes
                  
                  ## labels
                  key=list(
                    border= "grey", 
                    text = list(c( expression(S[a](n)  ) , expression(S[b](n)  ), expression(S[b](n) - S[b](n) ) )),  
                    lines = list(pch=c(1,2), col= c('blue','red','black')), type="l", lwd=4,
                    cex=2, # control the character expansion  of the symbols
                    corner=c(0,0) # position
                  ),
                  ##function to modify the grid pattern
                  panel=function(...) {
                    panel.xyplot(...)
                    panel.grid(h=-50, v=-1, col.line="blue", lwd=1, lty=3 )
                  }
  )# < xyplot
  
  print(plot)
  
}
# example
#plot_two_axes_and_difference(imu0,1,imu1,1,window)

