sudo apt-get -y install \
dmraid hddtemp hdparm hexchat \
nmon iotop mtr whois \
iptraf liferea \
lm-sensors \
ncdu ncftp net-tools mc \
p7zip-full rar \
rhash \
samba smbclient sshfs \
qmmp rhythmbox vlc \
remmina \
nmap iptraf \
openssh-server \
sublime-text vim  \
thinkfan \
ethtool \
filezilla \
x3270 \
codeblocks virtualbox \
minicom \
bleachbit \
skypeforlinux \
freerdp2-x11

sudo apt-get install -y ibus ibus-data ibus-gtk ibus-gtk3 libappindicator1 libc++1 libc++1-10 libc++abi1-10 libdbusmenu-gtk4 libegl1-mesa libgl1-mesa-glx libxcb-xtest0 python3-ibus-1.0


sudo add-apt-repository -y ppa:xuzhen666/dockbarx
sudo apt-get update
sudo apt-get install -y dockbarx                          

#skype
#curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
#sudo echo "deb [arch=amd64] https://repo.skype.com/deb stable main" > /etc/apt/sources.list.d/skype-stable.list


#Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'


sudo apt install apt-transport-https
sudo apt update && sudo apt install -y code-insiders         


#VIVALDI
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install -y vivaldi-stable  



#teams
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.30857_amd64.deb
sudo dpkg -i teams*.deb
rm teams*.deb

#slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.13.0-amd64.deb
sudo dpkg -i slack*.deb
rm slack*.deb

#spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get -y install spotify-client

#zoom
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
rm zoom_amd64.deb


#discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb
rm discord.deb

##

#brakujace paczki
sudo apt-get -y install -f


#docker-ce     
#docker-ce-cli 

echo "Please reboot after this step"
