clc; clear all; close all;

for it=[0:1:950]
close all; 

rawdatalog = '/home/x/octave362/walkingSNFjoggingSNFcyclingSNF.csv';
DM=csvread(rawdatalog); #Data Matrix
%size(DM)

datastartpoint=21500; datalength=50+it; 

interval=datastartpoint:datastartpoint+datalength; 
DM= DM(interval,:);samples=interval;

TAU_string='1';t= str2num(TAU_string);
m_string='15';m= str2num(m_string);

DATAVECTOR=[2,3,4]; title_string='ACC';  colorlegendx="b;X;"; colorlegendy="g;Y;"; colorlegendz="r;Z;"; # ACC VECTOR
%DATAVECTOR=[5,6,7];  title_string='GYR'; colorlegendx="b;X;"; colorlegendy="g;Y;"; colorlegendz="r;Z;"; # GYR VECTOR
%DATAVECTOR=[8,9,10];  title_string='ANGLE ROT'; colorlegendx="b;Yaw;"; colorlegendy="g;Pitch;"; colorlegendz="r;Roll;";# ANGLE ROTATION VECTOR (yaw, pitch, roll)

##################################
#######   ACTIVITIES   LABELS
#    activities around an atletism court
#      Sensor is on the right ankle
%interval=1:50001; # whole data


#JOGGING
%interval= 16000:  21000; #slow
%interval= 21500: 24500;  #normal
%interval= 25000: 30000;  #faster
 
#CYCLING
%interval= 31000:  35000;  #slow
%interval= 36000:39500;  #normal
%interval= 40000: 43500; #faster


#Axis-X,
x=DM(:,DATAVECTOR(1));
#Axis-Y,
y=DM(:,DATAVECTOR(2));
#Axis-Z,
z=DM(:,DATAVECTOR(3));


%Magnitude
DATA=sqrt(x.^2+y.^2+z.^2);




subplot(4,4,[1:4])
%plot (samples, x,'linewidth', 2,samples, y, 'linewidth', 2,samples, z, 'linewidth', 2)
plot (samples, x, colorlegendx ,'linewidth', 2,samples, y,colorlegendy, 'linewidth', 2,samples, z, colorlegendz,'linewidth', 2);
 title (title_string, 'fontsize', 20);
 xlabel('sample, n'); ylabel('raw data');
 axis([datastartpoint,datastartpoint+1000, -pi, pi ])  
 
MDATA=(DATA-mean(DATA))/std(DATA);
[pc,s,v]=SSA(DATA,m,t);
rs=0:length(pc)-1;



%figure(4)
subplot(4,4,[5,6,7,9,11,13,14,15])
    plot3(pc(:,1),pc(:,2),pc(:,3), 'k','linewidth',3);
    grid;
    title(['  T=', TAU_string, ' m=', m_string] ,'fontsize', 20);
    xlabel('PC1'); 
    ylabel('PC2'); 
    zlabel('PC3');
    

%figure(1)
subplot(4,4,8)
plot(pc(:,1),pc(:,2),'k','linewidth',.5);xlabel('PC1');ylabel('PC2');
subplot(4,4,12)
plot(pc(:,1),pc(:,3),'k','linewidth',.5);xlabel('PC1');ylabel('PC3');
subplot(4,4,16)
plot(pc(:,2),pc(:,3),'k','linewidth',.5);xlabel('PC2');ylabel('PC3');


    
fig3d=sprintf('/home/x/octave362/joggingnormal/ACC/images/output_%03d.png',it);
print("-S1200,900", fig3d);

end
    
    
