# ###############################################################################################
# Warning!!!       This script required few times of entering password
#
# ###############################################################################################

#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront. for coreutils
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ###############################################################################################
# Check for Homebrew,
# Install if we don't have it
# ###############################################################################################

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# ###############################################################################################
# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# ###############################################################################################
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names



# ###############################################################################################
# Install Bash 4.
# ###############################################################################################
brew install bash
brew tap homebrew/versions


# ###############################################################################################
# bash-completion2
# Warning!!!       bash-completion2 have refrences in ~/.bash_profile  file
#                  by defaults:
#                              lines 45-68 in .bash_profile are comments out
#                              un comment them based on your needs
# ###############################################################################################
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# ###############################################################################################
# Install `wget` with IRI support.
# ###############################################################################################

brew install wget --with-iri

# ###############################################################################################
# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#
# RingoJS is a CommonJS-based JavaScript runtime written in Java and based on the Mozilla Rhino JavaScript engine.
# You can use it to run JavaScript programs on your computer without a web browser.
# It can be used to write web applications, database applications, etc.
#
#
# Narwhal is a JavaScript standard library, package manager
# Note:
#      This formula is in confict with the following:
#      Spidermonkey -  http://brewformulas.org/Spidermonkey
#
# ###############################################################################################

brew install ringojs
brew install narwhal

# ###############################################################################################
# Install Python
# ###############################################################################################
brew install python
brew install python3

# ###############################################################################################
# Install ruby-build and rbenv
# ###############################################################################################
brew install ruby
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra


# ###############################################################################################
# Install more recent versions of some OS X tools.
# ###############################################################################################

#brew install vim --override-system-vi
# Need to this:
# https://github.com/Homebrew/homebrew-core/issues/14774
brew install --without-python --with-override-system-vi vim

brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# If php already installed
#brew unlink php
#brew unlink php55
#brew unlink php56
brew install homebrew/php/php55 --with-gmp

# ###############################################################################################
# Install font tools.
# ###############################################################################################

brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# ###############################################################################################
# Install other useful binaries.
# ###############################################################################################
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc
# For mosot of the machine learning we need gcc  --without-multilib
brew install gcc --without-multilib
brew install cmake
brew install boost-python --with-python3
# https://github.com/mas-cli/mas
brew install mas
# Install FFMPEG to convert Mp4 to WebM eample: ffmpeg -i video.mp4 -strict -2 video.webm
brew install libvpx
brew install ffmpeg --with-libvpx

# jq is like sed for JSON data
# https://stedolan.github.io/jq/
brew install jq

# Installing gpg/gnupg and dependencies
brew install npth
brew install libtasn1
brew install nettle
brew install libunistring
brew install p11-kit
brew install gnutls
brew install libgpg-error
brew install libgcrypt
brew install libksba
brew install libassuan
brew install pinentry
brew install adns
brew install libusb
brew install gpg
brew install htop

# ###############################################################################################
# Ref: https://www.chainsawonatireswing.com/2012/09/19/changing-default-applications-on-a-mac-using-the-command-line-then-a-shell-script/?from=@
# duti -x m
# ###############################################################################################
brew install duti

# ###############################################################################################
# Install Extra
# ###############################################################################################
brew install sdl2
brew install sdl2_image
brew install sdl2_ttf
brew install sdl2_mixer
brew install gstreamer
brew install tmux

# ###############################################################################################
# Lxml and Libxslt
# ###############################################################################################
#brew install libxml2
#brew install libxslt
#brew link libxml2 --force
#brew link libxslt --force

# ###############################################################################################
# Install tools.
# ###############################################################################################

# links and lynx are command line web browsers, allowing you full web access
brew install links

# The watch command is super useful to keep a continuous eye on another process.
# For example you can use watch to track disk usage or IO, or virtual memory usage,
# or anything else, updating the command output every few seconds.
# Examples: 
#  monitor disk size:
#           watch -n 5  df -kh
#  monitor file name readme.txt:
#           watch -d 'ls -l | fgrep readme.txt'
#  monitor date:
#           watch -d date
#  monitor files with Suppress watch header in the output name using -t:
#           watch -t ls
#  monitor process Id:
#           watch "ps -ef | awk -F' ' '{print \$2 , \$8 }'"
brew install watch

# ###############################################################################################
# Install Heroku
# ###############################################################################################
brew install heroku-toolbelt
heroku update

# ###############################################################################################
# Install Cask
# ###############################################################################################
#brew install caskroom/cask/brew-cask
brew install cask
brew tap caskroom/versions

# ###############################################################################################
# Core casks
# ###############################################################################################
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz
brew cask install --appdir="/Applications" pycharm-ce

# Development tool casks
brew cask install --appdir="/Applications" virtualbox
#brew cask install --appdir="/Applications" vmware-fusion


# Development tool casks
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" macdown


#brew cask install --appdir="~/Applications" eclipse-cpp
#brew cask install --appdir="~/Applications" eclipse-ide
#brew cask install --appdir="~/Applications" eclipse-installer
#brew cask install --appdir="~/Applications" eclipse-java
#brew cask install --appdir="~/Applications" eclipse-jee
#brew cask install --appdir="~/Applications" eclipse-modeling
#brew cask install --appdir="~/Applications" eclipse-php
#brew cask install --appdir="~/Applications" eclipse-platform
#brew cask install --appdir="~/Applications" eclipse-ptp
#brew cask install --appdir="~/Applications" eclipse-rcp
#brew cask install --appdir="~/Applications" eclipse-smarthome-designer
#brew cask install --appdir="~/Applications" netbeans
#brew cask install --appdir="~/Applications" rstudio
#brew cask install --appdir="~/Applications" rstudio-server


# Google
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-backup-and-sync
#brew cask install --appdir="/Applications" google-music-manager
#brew cask install --appdir="/Applications" google-earth
brew cask install --appdir="/Applications" google-hangouts

# -hangouts.rb

# Messaging
brew cask install --appdir="/Applications" whatsapp


# Misc casks
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" gimp
brew cask install --appdir="/Applications" paintbrush
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" github-desktop

# passwords Manages
# https://1password.com/
# brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" dashlane


#brew cask install --appdir="/Applications" inkscape

#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Install Docker, which requires virtualbox
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" docker-toolbox
brew install boot2docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# USB Images to create USB boot images from iso
brew cask install --appdir="/Applications" UNetbootin
# Remove outdated versions from the cellar.
brew cleanup

