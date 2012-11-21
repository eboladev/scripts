#!/bin/sh
# Delete duplicate entries from Finder's "Open With..." menu

/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/\
LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local\
-domain system -domain user
