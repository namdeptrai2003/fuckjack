#!/bin/bash


#
# FUCK JACK
# Use with Android 7.X
#

# Kill the Jack server
  printf "Fuck Jack...\n\n"
  sleep 1
  ./prebuilts/sdk/tools/jack-admin kill-server
  rm -rf .jack-server

# IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT! IMPORTANT!
#
# Replace the value in the first of "ANDROID_JACK_VM_ARGS" with half of your RAM
# (i.e.: if you have 8GB of ram, use "-Xmx4g")
#
  export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4g"


# You may need to uncomment the following command if Java tells you to use it.
#  ulimit -n unlimited

  ./prebuilts/sdk/tools/jack-admin install-server prebuilts/sdk/tools/jack-launcher.jar prebuilts/sdk/tools/jack-server-4.8.ALPHA.jar
  ./prebuilts/sdk/tools/jack-admin start-server
  gedit ~/.jack-server/config.properties 
