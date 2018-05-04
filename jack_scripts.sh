#!/bin/bash


#
# JACK SCRIPTS
# Use with Android 7.X and 8.X
#

# Kill the Jack server
  ./prebuilts/sdk/tools/jack-admin kill-server
  rm -rf .jack-server

# IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT!
#
# Replace the value in the first of "ANDROID_JACK_VM_ARGS" with half of your RAM
# (i.e.: if you have 8GB of ram, use "-Xmx4g")
# Set up jack scripts 

  export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"
  ulimit -n unlimited
  ./prebuilts/sdk/tools/jack-admin install-server prebuilts/sdk/tools/jack-launcher.jar prebuilts/sdk/tools/jack-server-4.*.ALPHA.jar
  ./prebuilts/sdk/tools/jack-admin start-server
  gedit ~/.jack-server/config.properties 
