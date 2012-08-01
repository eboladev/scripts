# No clue when should this be executed...

# Increase font size in Mail
defaults write com.apple.mail MinimumHTMLFontSize 15

# Don't create .DS_store  files on network shares
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
