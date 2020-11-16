#!/bin/bash
# Author: Jeremy-boo
# Time: 2020-11-16
# Function: install and config golang environment

. ./function.sh

while true
do
    echo "----------------------------------"
    echo "0) 安装golang环境"
    echo "2) 退出"
    echo "----------------------------------"
    read -p "输入操作编号：" func
    case $func in
        0)
        InstallGoEnv
        2)
        echo "操作取消"
        exit
        ;;
    esac
done