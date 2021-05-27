#!/bin/sh
#    slrootutil - A MacOSX snow leopard root file system creator
#    Copyright (C) 2021  Stanisław Przedzinkowski
#    Copyright (C) 2021  Michael Connor Buchan
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Global variables
PROGRAM_NAME="$0"

# Function that prints an error message and exits
error()
{
    echo "$PROGRAM_NAME: error: $*"
    exit 1
}

# Output welcome message
cat <<EOF
Welcome to the snow leopard root file system builder.  This utility aims
to assist you in creating a snow leopard root file system out of installer
packages bundled on the snow leopard installation DVD.

Disclaimer: This tool may be extremely buggy! There is no error checking at
all! This is just a simple script i made, and i hope to improve it in the
future, but for now its just a set of commands for MacOS to execute. If
something is terribly broken, or i made a mistake that causes the whole
script to fail on other people’s computers, feel free to post an issue on
Github or make a pull request and we, the all mighty open source community,
will hopefully be able to fix the issue.

Note: Only official installers supported. If you use a modded DVD with
package files being placed in the wrong order, you may get an undesired result.

Please insert your snow leopard dvd in to your optical disk drive, or put your snow leopard dvd image in .dmg format in to the directory where the script is located, and name it sl.dmg.
EOF

# Mount sl.dmg (if present)
if test -f sl.dmg && test -r sl.dmg; then
    # File exists and is readable
    echo 'Found "sl.dmg" disk image, mounting it'
    hdiutil attach sl.dmg
fi

echo Creating work directory…
mkdir slwork

# Check we can access the installer volume
if [ ! -d "/Volumes/Mac OS X Install DVD/" ]; then
    error "couldn't find install media. Check that your DVD is mounted, or make sure \"sl.dmg\" exists in the current directory"
fi

echo Extracting packages. This may take a while. Please do not eject or unplug your snow leopard installation media during this process...
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/AdditionalEssentials.pkg slwork/pkg1
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/AdditionalFonts.pkg slwork/pkg2
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/AdditionalSpeechVoices.pkg slwork/pkg3
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/AddressBook.pkg slwork/pkg4
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Apple_Gutenprint.pkg slwork/pkg5
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/AsianLanguagesSupport.pkg slwork/pkg6
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Automator.pkg slwork/pkg7
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/BaseSystem.pkg slwork/pkg8
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/BootCamp.pkg slwork/pkg9
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/BrazilianPortuguese.pkg slwork/pkg10
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/BSD.pkg slwork/pkg11
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Danish.pkg slwork/pkg12
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Dutch.pkg slwork/pkg13
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/DVDPlayer.pkg slwork/pkg14
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Essentials.pkg slwork/pkg15
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Finnish.pkg slwork/pkg16
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/French.pkg slwork/pkg17
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/German.pkg slwork/pkg18
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/iCal.pkg slwork/pkg19
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/iChat.pkg slwork/pkg20
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/iPodSupport.pkg slwork/pkg21
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Italian.pkg slwork/pkg22
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/iTunes.pkg slwork/pkg23
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Japanese.pkg slwork/pkg24
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Java.pkg slwork/pkg25
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/JavaTools.pkg slwork/pkg26pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Korean.pkg slwork/pkg27
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Mail.pkg slwork/pkg28
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/MediaFiles.pkg slwork/pkg29
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/MigrationAssistant.pkg slwork/pkg30
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Norwegian.pkg slwork/pkg31
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/OSInstall.mpkg slwork/pkg32
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/OSInstall.pkg slwork/pkg33
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/OSUpgrade.pkg slwork/pkg34
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/OxfordDictionaries.pkg slwork/pkg35
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/PodcastCapture.pkg slwork/pkg36
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Polish.pkg slwork/pkg37
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Portuguese.pkg slwork/pkg38
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/QuickTimePlayer7.pkg slwork/pkg39
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Rosetta.pkg slwork/pkg40
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Russian.pkg slwork/pkg41
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Safari.pkg slwork/pkg42
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Samsung_Common.pkg slwork/pkg43
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/SimplifiedChinese.pkg slwork/pkg44
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Spanish.pkg slwork/pkg45
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/Swedish.pkg slwork/pkg46
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/TraditionalChinese.pkg slwork/pkg47
pkgutil --expand-ful /Volumes/Mac\ OS\ X\ Install\ DVD/System/Installation/Packages/X11User.pkg slwork/pkg48
echo Packages extracted successfully.

echo Creating RootFS directory...
mkdir slrootfs

echo Merging packages to RootFS...
cp -r slwork/pkg*/payload/* slrootfs

cat <<EOF
Done. Your newly created snow leopard RootFS is in "./slrootfs"
 You can take a look in the slwork directory to
see how snow leopard packages look inside, or delete that directory using
finder or by running "rm -rf slwork".
EOF
