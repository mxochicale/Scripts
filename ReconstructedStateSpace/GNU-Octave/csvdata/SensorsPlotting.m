clc; clear all; clf; close all;


rawdatalog = '~/MotionLoggerData.csv';

DM=csvread(rawdatalog); #Data Matrix
size(DM)


##################################
#######                  #########
#######   ACTIVITIES 
#######    LABELS
#    activities around an atletism court
#      Sensor is on the right ankle

%interval=1:50001; # whole data


#WALKING 
interval= 2000:  6000; #slow
%interval= 7000: 11000; #normal
%interval= 13000: 16000; #faster

#JOGGING
%interval= 16000:  21000; #slow
%interval= 21500: 24500;  #normal
%interval= 25000: 30000;  #faster
 
#CYCLING
%interval= 31000:  35000;  #slow
%interval= 36000:39500;  #normal
%interval= 40000: 43500; #faster
  
 
DM= DM(interval,:);


%L=length(DM);
L=length(DM);
samples=interval;




%Timestamp,
t=DM(:,1);

##Accelerometer
%Accel-X,
accx=DM(:,2);
%Accel-Y,
accy=DM(:,3);
%Accel-Z,
accz=DM(:,4);


#Gyroscope
%Gyro-X,
gyrx=DM(:,5);
%Gyro-Y,
gyry=DM(:,6);
%Gyro-Z,
gyrz=DM(:,7);

#Rotation Angles
%Yaw,
yaw=DM(:,8);
%Pitch,
pitch=DM(:,9);
%Roll
roll=DM(:,10);

%


%figure('Position',[startx,starty,width,height]);
figure('Position',[1,1000,1000,300]);

plot (samples, accx, 'linewidth', 2,samples, accy, 'linewidth', 2,samples, accz, 'linewidth', 2)
 title ('Acceleration Data', 'fontsize', 20);
 h = legend ('x', 'y', 'z');
 legend location northeastoutside
 set (h, 'fontsize', 20);
 xlabel('sample, n', 'fontsize', 20); ylabel('ACC', 'fontsize', 20);

 
%figure(2)
figure('Position',[1,350,1000,300]);

plot (samples, gyrx, 'linewidth', 2,samples, gyry, 'linewidth', 2,samples, gyrz, 'linewidth', 2)
 title ('Gyroscope ', 'fontsize', 20);
 h = legend ('gyr_x', 'gyr_y', 'gyr_z');
 legend location northeastoutside
 set (h, 'fontsize', 20);
 xlabel('sample, n', 'fontsize', 20); ylabel('rad', 'fontsize', 20);

 
#figure(3)
figure('Position',[1,1,1000,300]);

plot (samples, yaw, 'linewidth', 2,samples, pitch, 'linewidth', 2,samples, roll, 'linewidth', 2)
 title ('Angle Rotation', 'fontsize', 20);
 h = legend ('yaw', 'pitch', 'roll');
 legend location northeastoutside
 set (h, 'fontsize', 20);
 xlabel('sample, n', 'fontsize', 20); ylabel('rad', 'fontsize', 20);

