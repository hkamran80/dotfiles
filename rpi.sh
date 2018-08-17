# Dotfile for Raspberry Pi

echo "Welcome to Raspberry Pi Configuration!"
echo "This script will: connect to a network, install Python 3, Git, tshark, ffmpeg, and youtube-dl. Then it will install python modules 'requests', 'Flask', 'bs4', 'bottle', 'Glances', and 'PyPDF2'."

# Prerequistes
sudo -v

# Prep `sudo` and bash aliases
touch ~/.bashrc
touch ~/.bash_aliases

# -Prep ~/.bashrc
echo "if [ -f ~/.bash_aliases ]; then" >> ~/.bashrc
echo "    . ~/.bash_aliases" >> ~/.bashrc
echo "fi" >> ~/.bashrc

# Networking
echo 'network={' >> /etc/wpa_supplicant/wpa_supplicant.conf
echo '    ssid="NETWORK_SSID"' >> /etc/wpa_supplicant/wpa_supplicant.conf
echo '    psk="NETWORK_PWD"' >> /etc/wpa_supplicant/wpa_supplicant.conf
echo '}' >> /etc/wpa_supplicant/wpa_supplicant.conf

# Bash aliases
echo 'alias pip3="sudo pip3"' >> ~/.bash_aliases
echo 'alias py3="clear; python3"' >> ~/.bash_aliases

# Install apps
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install git tshark python3-dev python3-pip -y

# Python
pip3 install requests Flask bs4 PyPDF2 bottle Glances

# App Configuration
git config --global user.name "YOUR_NAME"
git config --global user.email "YOUR_EMAIL"
git config --global core.editor nano

# Install ffmpeg
cd /usr/src
git clone git://git.videolan.org/x264
cd x264
./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
make
sudo make install

cd /usr/src
git clone https://github.com/FFmpeg/FFmpeg.git
cd ffmpeg
sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree
make
sudo make install

# Install youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
