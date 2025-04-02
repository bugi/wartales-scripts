#!bash

# MODid is the id of the module.  For instance, mod "Impatience Overhaul"
# on Nexus Mods is number 97.  In that case MODid=97
#
# MODversion is the version of the mod you are setting out to package using
# this script.  It might look like MODversion=1.0.9
#
# WTversion is the version of the game that corresponds to the res.pak file
# you want to modify.  It might look like WTversion=v1.0.40128
#
# WTcommondir is where to find the res.pak you want to change.
# This will often be a directory within the game's Steam
# data.  It doesn't have to be though; you could copy the
# res.pak file anywhere you like and set WTcommondir to that
# directory.  On many Linux systems, this is the right setting:
# WTcommondir="$HOME"/.steam/debian-installation/steamapps/common/Wartales
#
# MODname and EXE you should leave alone.
# MODname combines the versions set earlier to a convenient form.
# EXE is the where to find the quickbms executable.


MODid=97
MODversion=bugi00.0
WTversion=v1.0.40128

WTcommondir="$HOME"/.steam/debian-installation/steamapps/common/Wartales

MODname="$MODid-$MODversion-$WTversion"
EXE="$here"/quickbms

