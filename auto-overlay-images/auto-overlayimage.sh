#!/bin/bash
# Filename: auto-overlay.sh
#
# Author: Miguel Perez-Xochicale
# 
# To run the bashscript, you should change the permission using
# chmod x+a auto-overlayimage.sh
# Then, you are able to run the script
#  ./auto-overlayimage.sh
#
#
#
# CHANGES
#
# Fri Dec 11 17:26:43 GMT 2015
# adding background 01 version to the images files
#
#
#
# First Version: 0.1
# Date 7th of March 2015


# References: 
# http://stackoverflow.com/questions/4802153/overlaying-two-images-with-automatic-resize-using-imagemagick
# https://snipt.net/ardchoille42/bash-script-for-a-simple-html-image-gallery


for img in *.png; do
	if [ "$img" = github_background_mxochicale01.png ]; then 
	echo 
	else
        echo "Olverlaying:" $img
	composite github_background_mxochicale01.png $img overlayed-$img
	fi
done



