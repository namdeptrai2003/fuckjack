#!/bin/bash

#
# The "Fuck Jack Build Script"
#
# Written by Michael S Corigliano (Mike Criggs) (michael.s.corigliano@gmail.com)
# Taken & adapted from my EZ AOSP tool, available here: https://github.com/mikecriggs/ez-aosp
#
# Usage: ./fuckjack.sh
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

# Colors for terminal output
  BLDRED="\033[1m""\033[31m"
  RST="\033[0m"

# Do we want to use NINJA?
  if(whiptail --title "FUCK JACK" --yesno "Would you like to use NINJA to compile the $ROM source code?" 10 70) then
      echo -e ${BLDRED}"Compiling $ROM with NINJA..."${RST}
      sleep 3
  else
      echo -e ${BLDRED}"Not compiling $ROM with NINJA..."${RST}
      sleep 3
      export USE_NINJA=false
  fi

# Do we need to use JACK workarounds?
  if(whiptail --title "FUCK JACK" --yesno "If your machine has less than 16GB of RAM, we may need to use some JACK workarounds. Would you like to use these?" 30 70) then
      echo -e ${BLDRED}"Using JACK workarounds..."${RST}
      sleep 3
      ./prebuilts/sdk/tools/jack-admin kill-server
      rm -rf ~/.jack*

# IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT!
#
# Replace the value in the first of "ANDROID_JACK_VM_ARGS" with half of your ram
# (i.e.: if you have 8GB of ram, use "-Xmx4g")
#
      export ANDROID_JACK_VM_ARGS="-Xmx4g -XX:+TieredCompilation -Dfile.encoding=UTF-8"
#
# IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT!

      export SERVER_NB_COMPILE=2
      export ANDROID_JACK_VM_ARGS=$JACK_SERVER_VM_ARGUMENT

# You may need to uncomment the following command if Java tells you to use it.
#     ulimit -n unlimited

      ./prebuilts/sdk/tools/jack-admin install-server prebuilts/sdk/tools/jack-launcher.jar prebuilts/sdk/tools/jack-server-4.8.ALPHA.jar
      ./prebuilts/sdk/tools/jack-admin start-server
  else
      echo -e ${BLDRED}"Not using JACK workarounds..."${RST}
      sleep 3
  fi

# Do we want to build clean?
  if(whiptail --title "FUCK JACK" --yesno "Would you like to build clean? If you used JACK workarounds, it is recommended to do so or your build may fail." 30 70) then
      echo -e ${BLDRED}"Building clean..."${RST}
      sleep 3
      make clean
      clear
  else
      echo -e ${BLDRED}"Not building clean..."${RST}
      sleep 3
  fi
