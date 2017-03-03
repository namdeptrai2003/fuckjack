# FUCK JACK (V2)

### Tired of your AOSP builds failing because JAVA and JAVAC are running out of memory? Well, this is because of the Jack server. Use this script before you build and it may save you the headache. ##

### How to get it ###
```bash
git clone git://github.com/mikecriggs/fuckjack.git fuckjack
```

### How to use it ###
```bash
cd fuckjack
cp fuckjack.sh ~/<YOUR-SOURCE-DIRECTORY>
cd <YOUR-SOURCE-DIRECTORY>
./fuckjack.sh
```

### This is no longer a build script. Please use this BEFORE using your own build script or building manually. ###
