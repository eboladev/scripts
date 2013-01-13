# No clue when should this be executed...

# Increase font size in Mail
defaults write com.apple.mail MinimumHTMLFontSize 15

# Don't create .DS_Store  files on network shares
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Allow peeking into a folder's content
defaults write com.apple.finder QLEnableXRayFolders 1

# Make iTunes window look sane
defaults write com.apple.iTunes full-window -1

# Play movies automatically in QuickTime
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen 1

# Disable Resume for Preview.app
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false

# Enable smooth scrolling
defaults write -g NSScollAnimationEnabled -bool true

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Remove duplicates from Finder/Open With...
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user
