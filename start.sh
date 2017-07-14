ssh-keygen
sudo apt-get update
sudo apt-get dist-upgrade
git clone git@github.com:samclotf/My-System-Config.git $HOME/.myconfig

sudo apt-get install \
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

# mac-like window buttons
xfconf-query -c xfwm4 -p /general/button_layout -s 'CHM|O'

# set up padlock.io
# configure settings

# firefox login
