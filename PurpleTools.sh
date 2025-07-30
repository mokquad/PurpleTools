#!/bin/bash
echo Welcome to PurpleTools! 
echo Please select an option:
echo 1. Install
echo 2. Information & Credits
read -r option
if [ "$option" = "1" ] ; then
  echo
  echo "Making a backup of SystemVersion.plist..."
  cd /System/Library/CoreServices/
  cp SystemVersion.plist /System/Library/CoreServices/SystemVersion.plist.bak
  echo "Done!"
  echo
  echo "Installing plutil..."
  apt-get install com.bingner.plutil
  echo "Done!"
  echo
  echo "Modifying ProductType..."
  plutil -ProductType -string "Internal" SystemVersion.plist
  echo "Done!"
  echo
  echo "Modifying ReleaseType..."
  plutil -ReleaseType -string "Internal" SystemVersion.plist
  echo "Done!"
  echo
  echo "Creating folders..."
  apt -y --allow-unauthenticated install wget
  mkdir /private/var/PurpleTools
  mkdir /AppleInternal
  mkdir /System/Library/Perl
  echo "Done!"
  cd /private/var/PurpleTools
   echo "Downloading and installing..."
  wget https://archive.org/download/pisyapopa/PurpleTools.zip --no-check-certificate
  unzip PurpleTools.zip
  mv /private/var/PurpleTools/AppleInternal/ /AppleInternal/
  mv /private/var/PurpleTools/PrivateFrameworks/ /System/Library/PrivateFrameworks/
  mv /private/var/PurpleTools/Perl/ /System/Library/Perl/
  echo "Done!"
  echo
  echo "The installation process has finished successfully."
  echo "Respringing your iDevice..."
  ldrestart
 
elif [ "$option" = "2" ] ; then
  echo Made by: Internal Store, Mokquad.
  echo PurpleTools version: 1.0
fi
