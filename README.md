# wartales-scripts
Scripts to edit Wartales game data

The *.sh scripts should work as is on Linux and MacOS.  For MSWindows,
see the "OPERATING SYSTEM" note later on in this file.

There are instructions at the top of each script.

We'll start with some general setup advice.

# SETUP quickbms

Make sure the quickbms file is in the same directory as this script.  You
can get it from https://github.com/LittleBigBug/QuickBMS

Unpack it in the same directory as this file.  For example:

    unzip quickbms_linux.zip


# CONFIGURE this tool

Create a directory where files will be unpacked and worked on.  Copy the
config.sh file into that directory and edit it.  You will give the name
of this directory as the first argument to this script.

The settings are described in the config.sh file.



# POPULATE the work directory

In addition to the config.sh file mentioned previously, copy any \*.jq
files you want to apply into the work directory.




# OPERATING SYSTEM

This script should work as is on Linux and MacOS.

For MSWindows, you will need to either port this shell script to a native
script or use WSL or something like that.  If you make this script
compatible with WSL or write a native mswindows script, please contribute
it back so others can benefit.

