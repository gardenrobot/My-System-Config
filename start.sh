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

# power
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-battery -s 0
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lid-action-on-ac -s 0
xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/show-tray-icon -s 1

# set up padlock.io
# configure settings

# firefox login
