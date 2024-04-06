#!/usr/bin/env bash

# Don't execute anything, just print this file.
echo "You shouldn't execute this file!"
exit

####################
# Screen / Monitor #
####################

# Brightness at software level
# LVDS-1 is the device name for my
# current laptop's screen. Run xrandr without
# args to see all display devices.
xrandr --output LVDS-1 --brightness 1.0

# Change color values to set night-color mode
# (basically by reducing blue and increasing red)
xrandr --output LVDS-1 --gamma 1.0:0.90:0.81

# Gamma values:
#    { 1.00000000,  0.82854786,  0.64816570, }
#    { 1.00000000,  0.86860704,  0.73688797, }
#    { 1.00000000,  0.90198230,  0.81465502, }
#    { 1.00000000,  0.93853986,  0.88130458, }
#    { 1.00000000,  0.97107439,  0.94305985, }
#    { 1.00000000,  1.00000000,  1.00000000, } 6500K

# Combine --brightness and --gamma into one command to
# set both at once.

# This brightness apparently only sets the pixel color values to emulate
# brightness levels. To set the true brightness, change the value in the
# `sys/class/backlight/brightness` file:
sudo vi /sys/class/backlight/brightness

##################################
# Input (Touchpad/Keyboard/etc.) #
##################################

# Touchpad settings
#
# lists settings for specified device:
#   xinput --list-props <id|name>
#
# set a specific property:
#   xinput set-prop <id|name> <setting id|name> <value> 
#
# The tapping prop is the one for single-tap as button click.
xinput # lists devices

###########
# Network #
###########

# Show interfaces
sudo iwlist

# Turn interface ON
sudo ip link set <interface> up

# Find available connection ESSIDs
sudo iwlist wlp2s0 scan | grep ESSID

# Add password
wpa_passphrase <ESSID> <password> | sudo tee /etc/wpa_supplicant.conf

# Connect. Add `-B` to run in background.
sudo wpa_supplicant -c /etc/wpa_supplicant.conf -i wlp2s0

# Check connection
sudo iwconfig

# Connect
sudo dhclient wlp2s0

###############
# PDF EDITING #
###############

# Merge PDFs with GhostScript
gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=merged.pdf -dBATCH input1.pdf
input2.pdf input3.pdf ...

# Extract pages
gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
  -dFirstPage=1 -dLastPage=1 \
  -sOutputFile=extracted.pdf inputfile.pdf

# Compress PDFs
# -dPDFSETTINGS can be one of the following:
# screen: 72dpi
# ebook: 150dpi
# prepress: 300dpi
# default: system chooses quality & size
# (higher dpi = better quality, bigger size)
gs -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dNOPAUSE -dBATCH -sOutputFile=compressed_merged.pdf merged.pdf

# Split a PDF
gs -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf -dFirstPage=n -dLastPage=m -sDEVICE=pdfwrite input.pdf

#################
# Miscellaneous #
#################

# Volume TUI
alsamixer

# Battery level
acpi

# Temperature
acpi -t

# SSH to phone VPN
# add -f to have it run in the background.
# remove N to be able to run commands on remote device
# remove q for more output, add -v/v/v for verbosity.
ssh -D 8080 -CqN u0_a199@192.168.100.25 -p 2222

# Use SOCKS5 proxy for VPN
env http_proxy=socks5h://localhost:8080 HTTPS_PROXY=socks5h://localhost:8080 ALL_PROXY=socks5h://localhost:8080 "$@"

# Check disk space for filesystems (-h is for human-readable output)
df -h

# Check disk space for current directory
du -hs

# Edit mp3 metadata
# `sudo apt-get install eyed3`
eyed3

# Record audio
arecord

# Play audio file
aplay

# Search & Replace in all files in directory
sed -i 's/foo/bar/g' *

# Find the sizes of directories
du -h -d 1
