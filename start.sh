#ssh-keygen
#git clone git@github.com:samclotf/My-System-Config.git $HOME/.myconfig
sudo apt-get update
sudo apt-get dist-upgrade -y

ln -s id_rsa ~/.ssh/id_rsa_personal
ln -s id_rsa.pub ~/.ssh/id_rsa_personal.pub

sudo apt-get update
sudo apt-get install -y wget curl

sudo add-apt-repository https://riot.im/packages/debian/
wget -qO - https://riot.im/packages/debian/repo-key.asc | sudo apt-key add -

curl https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://s3-us-west-2.amazonaws.com/brave-apt `lsb_release -sc` main" | sudo tee -a /etc/apt/sources.list.d/brave-`lsb_release -sc`.list

sudo apt-get update

sudo apt-get install -y \
vim \
tmux \
curl \
wget \
git \
screen \
firefox \
chromium-browser \
xbindkeys \
xbindkeys-config \
guake \
bash-completion \
build-essential \
cheese \
riot-web \
gedit \
owncloud-client \
brave \
silversearcher-ag \


# mac-like window buttons
xfconf-query -c xfwm4 -p /general/button_layout -s 'CHM|O'

# power
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-battery -s 0
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-ac -s 0
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/show-tray-icon -s 1

# clear folders
rmdir ~/Documents
rmdir ~/Music
rmdir ~/Pictures
rmdir ~/Public
rmdir ~/Templates
rmdir ~/Videos

# configure guake
gconftool-2 -t string -s /apps/guake/keybindings/global/show_hide 'grave'
gconftool-2 -t string -s /apps/guake/keybindings/local/toggle_fullscreen '<Primary>grave'


# manual work

# disable screensaver

# set up padlock.io
# configure settings

# firefox login
#   connect sync account
#   install RES
#   download setting

# Add this to startup
# ~/.myconfig/login-chromebook.sh

# Install discord
# wget -O ~/Downloads/discord-ptb-0.0.1.deb https://discordapp.com/api/download/ptb?platform=linux&format=deb
