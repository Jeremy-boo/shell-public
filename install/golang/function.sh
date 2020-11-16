#!/bin/bash
#maintainer boo-jeremy@outlook.com

# install go envoriment
function InstallGoEnv(){
# 判断是否安装golang
type go >& /dev/null
if [ $? -eq 0 ]; then
    echo "你已经安装golang环境"
    echo `go version`
    return 0
fi

echo "----------------------------------"
echo "选择安装版本："
echo "1) 1.15.4"
echo "2) 1.14.12"
echo "3) 1.13.15"
echo "4) 1.12.17"
echo "----------------------------------"
read -p "输入安装版本编号(默认1):" version
if [ -z $version ]; then
    GO_VERSION=1.15.4
else
    case $version in
    1)
    GO_VERSION=1.15.4
    ;;
    2)
    GO_VERSION=1.14.12
    ;;
    3)
    GO_VERSION=1.13.15
    ;;
    4)
    GO_VERSION=1.12.17
    ;;
    esac
fi

# 置版本号变量结束 开始下载包并配置环境变量
sudo apt-get install -y wget gcc gcc-c++
GO_URL="https://golang.google.cn/dl/go${GO_VERSION}.linux-amd64.tar.gz"

# 配置程序安装位置
read -p "输入程序安装目录GOROOT(默认 /usr/local)：" GOROOT

if [ -z $GOROOT ];then
    GOROOT="/usr/local"
fi

# 判断安装目录是否存在
if [ ! -d $GOROOT ];then
    mkdir -p $GOROOT
fi
wget -c -P /tmp $GO_URL && tar zxf /tmp/go${GO_VERSION}.linux-amd64.tar.gz -C /tmp && sudo mv /tmp/go $GOROOT
# 输入GOPATH目录
read -p "输入GOPATH目录(默认 $HOME/go)：" GOPATH

if [ -z $GOPATH ] || [ ! -d $GOPATH ]
then
    GOPATH='$HOME/go'
fi
# 检测shell 配置环境变量到shell配置文件中
if [ $SHELL == "/bin/bash" ]
then
    if [ $(id -u) == "0" ]; then
        config="/etc/profile"
    fi
    config="$HOME/.bashrc"
else
    config="$HOME/.zshrc"
fi
echo '# go environment config' >> $config
echo "export GOROOT=$GOROOT/go  #go安装路径" >> $config
echo 'export GOBIN=$GOROOT/bin  #go可执行程序文件路径' >> $config
echo "export GOPATH=$GOPATH  #GOPATH 请自定义"  >> $config
echo 'export PATH=$PATH:$GOBIN' >> $config
source $config

# 环境安装完成
go version
echo "环境变量配置成功！请执行 source $config 确保配置生效"
}

