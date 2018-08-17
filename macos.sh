# Dotfile for macOS

# Alert user
echo "Please connect your Mac to the network, if is not already connected."
echo "You will be asked for your computer password."
echo "Please ensure you are not using this Mac until this script is complete. A notification will be sent to you when complete."

# Prerequistes
osascript -e 'tell application "System Preferences" to quit'
sudo -v
xcode-select --install

mkdir ~/.temp

# Prep `sudo` and bash aliases
touch ~/.bashrc
touch ~/.bash_aliases

# -Prep ~/.bashrc
echo "if [ -f ~/.bash_aliases ]; then" >> ~/.bashrc
echo "    . ~/.bash_aliases" >> ~/.bashrc
echo "fi" >> ~/.bashrc

# -Prep ~/.bash_aliases
cat macos_aliases >> ~/.bash_aliases

# Create folders
mkdir ~/Desktop
mkdir ~/Desktop/Projects ~/Desktop/Installations ~/Desktop/Images ~/Desktop/Media ~/Desktop/Books ~/Desktop/Raspberry_Pi
mkdir ~/Desktop/Images/Screenshots

# Install Apps
# -Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install git
brew install tshark
brew install python3
brew install youtube-dl
brew install caskroom/cask/brew-cask
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools

brew tap caskroom/versions
brew cask install sublime-text

# -Apps
# --iTerm
curl -SsL https://iterm2.com/downloads/stable/latest -o ~/.temp/iTerm_app.zip
unzip ~/.temp/iTerm_app.zip
mv iTerm.app /Applications/iTerm.app
# --Node.js, NVM, NPM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
# --Firefox
curl -SsL https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-US -o ~/.temp/firefox.dmg
hdiutil attach ~/.temp/firefox.dmg
cp -r /Volumes/Firefox/Firefox.app /Applications/Firefox.app
hdiutil detach /Volumes/Firefox/
# --SublimeText
sudo rm -rf /usr/local/bin/subl
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin
subl .
# --SequelPro
curl -SsL https://github.com/sequelpro/sequelpro/releases/download/release-1.1.2/sequel-pro-1.1.2.dmg -o ~/.temp/sequelpro.dmg
hdiutil attach ~/.temp/sequelpro.dmg
cp -r /Volumes/Sequel\ Pro\ 1.1.2/Sequel\ Pro.app /Applications/SQ.app
hdiutil detach /Volumes/Sequel\ Pro\ 1.1.2/
# --Spotify
curl -SsL https://download.scdn.co/SpotifyInstaller.zip -o ~/.temp/SpotifyInstaller.zip
unzip ~/.temp/SpotifyInstaller.zip
open Install\ Spotify.app

# Git configuration
git config --global user.name "YOUR_NAME"
git config --global user.email "YOUR_EMAIL"
git config --global core.editor nano

# Python
pip3 install requests Flask six scapy bs4 PyPDF2 pyharmony PyMySQL pyHS100 PyChromecast Pillow netifaces netdisco bottle Glances

# defaults write
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# -Input Devices
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# -Language/Text
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

# -Time
sudo systemsetup -settimezone "America/Los_Angeles" > /dev/null

# -Screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# -Imaging
defaults write com.apple.screencapture location -string "${HOME}/Desktop/Desktop/Images/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# -Finder
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/Desktop/"

defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
sudo chflags nohidden /Volumes
chflags nohidden ~/Library

# -Dock
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock autohide -bool true

# -External
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# -Dashboard/Mission Control
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true
defaults write com.apple.dock mru-spaces -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 11
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 12
defaults write com.apple.dock wvous-br-modifier -int 0

# -AppStore
defaults write com.apple.commerce AutoUpdate -bool true

# Finish Off
# -Kill Apps
for app in "cfprefsd" \
	"Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done

# -Remove TEMP folder
rm -r ~/.temp

osascript -e 'display notification "Your computer is now ready to be used. Please restart when you can." with title "macOS Configuration"'
