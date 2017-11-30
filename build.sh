#!/bin/bash

#服务名称
name="tuding/eureka"

#首先要判断镜像是否存在
if docker images $name |grep $name|grep -v grep
then
#如果存在则删除后创建
        pid=$(docker images $name | sed -n "2,1p" | awk '{print $3}')

else
#如果不存在则创建新的
        echo "不存在"
fi





docker build -t $name .

if