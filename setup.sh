#!/bin/bash
#Motd
curl -o "/data/data/com.termux/files/usr/etc/motd" "https://raw.githubusercontent.com/MajinSaaY/termux-setup/main/motd"
echo "" >> /data/data/com.termux/files/usr/etc/motd
echo "Input your name:"
read NAME
echo -e "Ael: Hello $NAME (ㆁωㆁ)" >> /data/data/com.termux/files/usr/etc/motd

#Initial setup
pkg update -y 
pkg in tmux vim zsh wget aria2 megatools ffmpeg python git man rclone imagemagick exiftool openssh termux-api -y
pip install --upgrade pip
pip install yt-dlp gallery_dl mutagen csvkit
mkdir ~/storage/downloads/Aria2
mkdir ~/storage/downloads/Mega
mkdir ~/storage/downloads/Wget

#ZSH + Styling
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' /data/data/com.termux/files/home/.zshrc
echo -e 'prompt_context() {\n  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then\n    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"\n  fi\n}' >> ~/.zshrc
chsh -s zsh

#Termux-url-opener
mkdir ~/bin
wget --no-check-certificate --output-document="/data/data/com.termux/files/home/bin/termux-url-opener" "https://raw.githubusercontent.com/MajinSaaY/termux-setup/main/termux-url-opener"
chmod +x ~/bin/termux-url-opener

#Widget (Clipboard)
mkdir ~/.shortcuts && mkdir ~/.shortcuts/icons
wget --no-check-certificate --output-document="/data/data/com.termux/files/home/.shortcuts/Clipboard" "https://raw.githubusercontent.com/MajinSaaY/termux-setup/main/Clipboard"
wget --no-check-certificate --output-document="/data/data/com.termux/files/home/.shortcuts/icons/Clipboard.png" "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Circle-icons-clipboard.svg/512px-Circle-icons-clipboard.svg.png"
chmod +x ~/.shortcuts/Clipboard

#Backup tool by laraib07
wget https://raw.githubusercontent.com/laraib07/TermuxBackupTools/master/rewind && chmod u+x rewind && mv rewind $PREFIX/bin/
sed -i 's+storage/emulated/0/Termux/Backup+storage/emulated/0/backups/Termux+' /data/data/com.termux/files/usr/bin/rewind
