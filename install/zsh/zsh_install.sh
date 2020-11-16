#!/bin/bash
#maintainer boo-jeremy@outlook.com

# 检查zsh是否安装
if [ `command -v zsh` ];then
    echo "----------------zsh已经安装----------------"
else    
    echo "----------------zsh没有安装,开始安装zsh----------------"
    sudo apt-get update \
         apt-get install zsh -y \
         chsh -s /bin/zsh
fi

# 安装oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"





