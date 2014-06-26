#!/bin/sh

# Restore classic scrollbar
gsettings set com.canonical.desktop.interface scrollbar-mode normal

# Set limits on ccache
ccache -M2048M; ccache -s

# Satisfy git
git config --global push.default simple
