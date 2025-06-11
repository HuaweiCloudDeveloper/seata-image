#!/bin/bash

set -e
# hce
sudo yum -y update & yum -y upgrade

# ubuntu
# apt-get -y update
# export DEBIAN_FRONTEND=noninteractive
# apt-get -y -o Dpkg::Options::="--force-confold" dist-upgrade
cd /opt

# 安装jdk
wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/openjdk-21_linux-aarch64_bin.tar.gz
tar -xf openjdk-21_linux-aarch64_bin.tar.gz
echo 'export JAVA_HOME=/opt/jdk-21' | sudo tee -a /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile
source /etc/profile

# 安装git
# hce
dnf -y install git
# ubuntu
# apt -y install git

# 安装maven
wget https://repo.huaweicloud.com/apache/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xf apache-maven-3.9.6-bin.tar.gz
sudo mv apache-maven-3.9.6 maven
echo 'export MAVEN_HOME=/opt/maven' | sudo tee -a /etc/profile
echo 'export PATH=$MAVEN_HOME/bin:$PATH' | sudo tee -a /etc/profile
source /etc/profile

# 安装seata
# 安装会慢
wget https://www.apache.org/dyn/closer.lua/incubator/seata/2.3.0/apache-seata-2.3.0-incubating-bin.tar.gz?action=download
tar -xf apache-seata-2.3.0-incubating-bin.tar.gz
mv apache-seata-2.3.0-incubating-bin seata

sudo tee /etc/systemd/system/seata.service <<-'EOF'
[Unit]
Description=Seata Server
After=network.target

[Service]
Type=forking
Environment="JAVA_HOME=/opt/jdk-21"
WorkingDirectory=/opt/seata/seata-server/bin
ExecStart=/bin/bash seata-server.sh
User=root
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# 重新加载Systemd
sudo systemctl daemon-reload
# 启用开机启动
sudo systemctl enable seata
# 重启服务
sudo systemctl start seata
# 查看状态
sudo systemctl status seata