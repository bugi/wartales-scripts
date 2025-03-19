#!/usr/bin/env bash

# This script should work as is on Linux and MacOS.  For MSWindows,
# see the "OPERATING SYSTEM" note later on in this file.

#
# SETUP quickbms
#
# Make sure the quickbms file is in the same directory as this script.  You
# can get it from https://github.com/LittleBigBug/QuickBMS
#
# Unpack it in the same directory as this file.  For example:
#
#   unzip quickbms_linux.zip
#

#
# CONFIGURE this tool
#
# Create a directory where files will be unpacked and worked on.  Copy the
# config.sh file into that directory and edit it.  You will give the name
# of this directory as the first argument to this script.
#
# The settings are described in the config.sh file.
#

#
# POPULATE the work directory
#
# In addition to the config.sh file mentioned previously, copy any *.jq
# files you want to apply into the work directory.
#

#
# RUN IT
#
# Running this script will backup the original res.pak file, unpack it,
# edit the data.cdb file, and pack it up again.  The new res.pak file will
# be located in the work directory with version numbers appended.
#
# Assuming you created "foo" as your work directory earlier, do this:
#
#   ./apply_jq_to_res_pak.sh foo apply
#
# Each of the backup, unpack, autoedit, and pack actions can be done
# separately.  The apply action simply does each of them in turn.
#


#
# OPERATING SYSTEM
#
# This script should work as is on Linux and MacOS.
#
# For MSWindows, you will need to either port this shell script to a native
# script or use WSL or something like that.  If you make this script
# compatible with WSL or write a native mswindows script, please contribute
# it back so others can benefit.
#





here="$( cd "$(dirname "$0")" ; pwd )"


# Read the config.sh file, from the work directory or from
# this script's directory if there isn't one in the work directory.
dir_of_action="$1" ; shift
if [[ -z $dir_of_action ]]
then
  echo "Please provide the name of a directory as the first argument and a verb as the second." 1>&2
  exit 1
fi
mkdir -p "$dir_of_action"

if [[ -e "$dir_of_action"/config.sh ]]
then
  source "$dir_of_action"/config.sh
else
  source "$here"/config.sh
fi


# Make sure the quickbms executable exists.
if ! [[ -e "$EXE" ]]
then
  echo "You need to install the quickbms executable in the same directory as this script." 1>&2
  exit 1
fi
chmod +x "$EXE"


# Make sure the BMS script exists.
if ! [[ -e "$here"/Shiro_Games_PAK_script.bms ]]
then
  echo "File $here/Shiro_Games_PAK_script.bms is missing.  Fix that then try again." 1>&2
  exit 1
fi


function backup ()
{ # Backup res.pak if not already done.
  if ! [[ -e $WTcommondir/res.pak-$WTversion ]]
  then
    cp -a "$WTcommondir/res.pak" "$WTcommondir/res.pak-$WTversion"
  fi
}

function unpack ()
{ # Unpack res.pak and copy data.cdb out of it if that hasn't already been done.
  # Removes the unpacked data after saving the data.cdb file.
  if [[ -e $dir_of_action/data.cdb-$WTversion ]]
  then
    echo "The extracted file '$dir_of_action/$WTversion' already exists.  Using it instead of making a new copy." 1>&2
    true
    return
  fi
  "$EXE" -Y "$here"/Shiro_Games_PAK_script.bms \
    "$WTcommondir/res.pak-$WTversion" \
    "$dir_of_action/$WTversion"
  cp -a "$dir_of_action/$WTversion/data.cdb" "$dir_of_action/data.cdb-$WTversion"
  rm -rf "$dir_of_action/$WTversion"
}

function autoedit ()
{ # Applies the jq files in the work directory to the data.cdb
  # one at a time, in alphabetical order.

  # To match upstream's conventions, for ease of diff:
  #   --tab is to use tabs for indent instead of spaces.
  #   Perl is used to remove the newline from the last line of the file.

  local tf="$(mktemp)"
  cat "$dir_of_action/data.cdb-$WTversion" >| "$tf"
  local f
  for f in "$dir_of_action/edit_"*.jq
  do
    jq --tab -f "$f" < "$tf" >| "$tf"-
    mv "$tf"- "$tf"
  done
  mkdir -p "$dir_of_action/mod-$MODname"
  perl -p -e 'chomp if eof' < "$tf" > "$dir_of_action/mod-$MODname/data.cdb"
  rm -f "$tf" "$tf"-
}

function pack ()
{ # Copies the modified data.cdb file into a copy of the
  # original res.pak file.  The new res.pak file is named
  # for the version set in the config.sh file.
  cp -a "$WTcommondir/res.pak-$WTversion" "$dir_of_action/res.pak-$MODname"
  "$EXE" -Y -w -r -r "$here"/Shiro_Games_PAK_script.bms \
    "$dir_of_action/res.pak-$MODname" \
    "$dir_of_action/mod-$MODname"
}


case "$1" in
  (backup) backup ; exit ;;
  (unpack) unpack ; exit ;;
  (autoedit) autoedit ; exit ;;
  (pack) pack ; exit ;;
  (apply) backup && unpack && autoedit && pack ; exit ;;
esac

echo "You will need to give me a directory name and an instruction as the second." 1>&2
exit 1
