#!/bin/bash
# Filename: auto-overlay.sh
# Version: 0.1
# Date 7th of March 2015
# Author: Perez-Xochicale M. A.
# 
# To run the bashscript, you should change the permission using
# chmod x+a auto-overlayimage.sh
# Then, you are able to run the script
#  ./auto-overlayimage.sh
#
# References: 
# http://stackoverflow.com/questions/4802153/overlaying-two-images-with-automatic-resize-using-imagemagick
# https://snipt.net/ardchoille42/bash-script-for-a-simple-html-image-gallery
#

for img in *.png; do
	if [ "$img" = github_background_mxochicale.png ]; then 
	echo 
	else
        echo "Olverlaying:" $img
	composite github_background_mxochicale.png $img overlayed-$img
	fi

done





