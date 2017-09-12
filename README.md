# JACK_SCRIPTS

### Tired of your AOSP (Android Open Source Project) and LOS based ROMS 7.X and 8.X builds failing because JAVA and JAVAC are running out of memory? Well, this is because of the Jack server. If you have less than 16GB of RAM, this is a common issue. Use one of these scripts before compilation and it may save you a few headaches. ###

### How to get it ###
```bash
  git clone git://github.com/namdeptrai2003/jack_scripts.git jack_scripts
```

### User input dependent script ###
  sudo -s ( then type your password and enter :) )
  cd jack_scripts
  cp jack_scripts.sh ~/<YOUR AOSP SOURCE DIRECTORY>
  cd <YOUR AOSP SOURCE DIRECTORY>
  ./jack_scripts.sh
```

###You will see config.properties file . Just change jack.server.max-service=4 ( for me ) or another number ( for you ) to jack.server.max-service=1 and save that file. 

###Now your linux is ready to build ROM !! :D

###You may use this script or any part of it in any project without any permission or licensing. ###

###This is no longer a build script. Please use this BEFORE using your own build script or building manually. ###
