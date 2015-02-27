#!/bin/bash

# Based on code created by Tiago Bastos.
# Patches Xcode 4.x to support NewtonScript language for editing

set -e

# Assumes Xcode 4+.
XCODE_MAJOR_VERSION=`xcodebuild -version | awk 'NR == 1 {print substr($2,1,1)}'`
if [ "$XCODE_MAJOR_VERSION" -lt "4" ]; then
        echo "Xcode 4.x or higher not found."
        exit 1
fi

# Path where this script is located
SCRIPT_PATH="$(dirname "$BASH_SOURCE")"

# Set up path for PlistBuddy helper application which can add elements to Plist files
PLISTBUDDY=/usr/libexec/PlistBuddy

# Path where Xcode is located
XCODE_PATH="/Applications/Xcode.app/Contents/"

# Path to the private framework we need to modify
DVTFOUNDATION_PATH="$XCODE_PATH/SharedFrameworks/DVTFoundation.framework/Versions/A/Resources/"

# Backup plugin data
[ -f "$DVTFOUNDATION_PATH/DVTFoundation.xcplugindata.bak" ] || cp "$DVTFOUNDATION_PATH/DVTFoundation.xcplugindata" "$DVTFOUNDATION_PATH/DVTFoundation.xcplugindata.bak"

# Merge in our language to DVTFoundation.xcplugindata
$PLISTBUDDY "$DVTFOUNDATION_PATH/DVTFoundation.xcplugindata"  -c 'Merge NewtonScript.plist plug-in:extensions'

# Copy in the xclangspec for the language (assumes in same directory as this shell script)
cp "$SCRIPT_PATH/NewtonScript.xclangspec" "$DVTFOUNDATION_PATH"

# Remove any cached Xcode plugins
rm -rf /private/var/folders/*/*/*/com.apple.DeveloperTools/*/Xcode/PlugInCache*.xcplugincache

echo "Syntax coloring must be manually selected in Xcode from the Editor > Syntax Coloring menu."
