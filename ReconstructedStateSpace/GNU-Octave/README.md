GNU-Octave Scripts to Animate the Reconstructed State Space for different Human Body Activities
========================
P\'erez-Xochicale M. A.

## Description
Using **state space reconstruction approach** different human body activities with an ankle-worn sensor were animated. These activities include walking, jogging, and cycling in three variations: slow, normal and faster.

GNU-Octave scripts created a sequence of images so as to render 27 videos. Previous experimental results are based on the work of Sam\'a et at. [1], however, there is still much experiments to be done since animations were created with the same values for m (embedded dimension) and T (embedded delay) and these were not be determined by using an appropriate approach.

Reconstructed state space is rooted in the singular spectrum analysis (SSA.m and phasespace.m) and sequences of images were generated with AnimationScriptStateSpaceReconstruction???.m where ??? is substitude by:
 * ACC - Accelerometer-based sensor (Accel{X,Y,Z})
 * GYR - Gyroscope-based sensor (Gyro{X,Y,Z})
 * ROT - Euler angles (Roll/Pitch/Yaw)

Sensor was located in the right ankle and data was collected at a sampling rate of 50Hz using an Ipod touch 4th generation with the Free application Movement Data Logger [2].


### References

[1] Albert Sam\'a et al. 
Gait identification by means of box approximation geometry of reconstructed attractors in latent space
URL: http://www.sciencedirect.com/science/article/pii/S0925231213001781

[2] Movement Data Logger for Objective Measurements
URL: https://itunes.apple.com/us/app/id527163720

Open Source Software Tools:

Octave 3.6.2 - https://www.gnu.org/software/octave/

OpenShot Video Editor - http://www.openshot.org/



### Acknowledgements
* Albert Samà  [http://scholar.google.com/citations?user=_E8-o3oAAAAJ] 
