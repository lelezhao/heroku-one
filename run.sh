#!/bin/sh

cat <<-EOF > /root/cloudreve/mycloudreve.ini
[System]
; 运行模式
Mode = master
; 监听端口
Listen = :$PORT
; 是否开启 Debug
Debug = false
; Session 密钥, 一般在首次启动时自动生成
; 5201314的md5加密密文为723d505516e0c197e42a6be3c0af910e
; 搭配cloudreve.db 默认关闭注册 管理员为 admin@cloudreve.org / cloudreve@2020
SessionSecret = 723d505516e0c197e42a6be3c0af910e
; Hash 加盐, 一般在首次启动时自动生成
HashIDSalt = 723d505516e0c197e42a6be3c0af910e
[Database]
; 数据库类型，目前支持 sqlite | mysql
Type = mysql
; 数据库地址
Host = frps.zhaolele.top
; MySQL 端口
Port = 50036
; 用户名
User = cloudone
; 密码
Password = mysql211
; 数据库名称
Name = Cloudreve
; 数据表前缀
TablePrefix = V3
EOF

/root/aria2/trackers-list-aria2.sh
/root/cloudreve/cloudreve -c /root/cloudreve/mycloudreve.ini
