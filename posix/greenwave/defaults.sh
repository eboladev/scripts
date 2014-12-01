#!/bin/sh

# Restore classic scrollbar
gsettings set com.canonical.desktop.interface scrollbar-mode normal

# Set limits on ccache
ccache -M2048M; ccache -s

# Satisfy git
git config --global push.default simple
git config --global user.name "Akos Polster"
git config --global user.email akos.polster@greenwavereality.com
