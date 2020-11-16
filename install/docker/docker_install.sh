#!/bin/bash
#maintainer boo-jeremy@outlook.com

# 卸载已有docker 
echo "----------------删除已有Docker----------------"
sudo apt-get remove docker \
     docker-engine \
     docker.io

# for 1. ubuntu
# step 1: 安装必要的一些系统工具
echo "----------------更新apt-源----------------"
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
# step 2: 安装GPG证书
echo "----------------安装GPG证书----------------"
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
# Step 3: 写入软件源信息
echo "----------------写入软件源信息----------------"
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
# Step 4: 更新并安装 Docker-CE
echo "----------------更新并安装 Docker-CE----------------"
sudo apt-get -y update
sudo apt-get -y install docker-ce





