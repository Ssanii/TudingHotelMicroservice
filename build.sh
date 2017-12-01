#!/bin/bash

#服务名称
name="tuding/eureka"

#首先要判断镜像是否存在
if docker images ${name} |grep ${name}|grep -v grep
then
#如果存在则删除后创建
        echo "开始停止并删除原镜像..."
        pid=$(docker images $name | sed -n "2,1p" | awk '{print $3}')
        docker stop ${pid} #停止容器
        docker rm ${pid} #删除容器
        docker rmi -f ${pid} #强制删除原镜像
        echo "原镜像已停止并删除..."
fi
dockers build -t ${name} . #构建新镜像
docker run -d -p 1000:1000 ${name}
echo "新镜像已部署完成..."