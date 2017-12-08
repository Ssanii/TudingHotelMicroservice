#!/bin/bash
#服务名称
name="tuding/tuding-eureka"
main_port="1000"
expose_port="1000"

if [ -n "$(docker images | grep ${name})" ];
then
    #存在的情况下，要判断是否有启动的容器
    docker_container=$(docker ps -a | grep ${name})
    if [ -n "${docker_container}" ];
        then
            #容器存在的情况下，先停止容器，然后删除容器
            docker stop $(${docker_container} | awk '{print $1}')
            docker rm $(${docker_container} | awk '{print $1}')
    fi
    #删除旧容器，再启动新容器
    last_images=$(docker images | grep "latest" | awk '{print $3}')
    old_images=$(docker images | grep -v ${last_images} | awk '{print $3}')
    if [ -n "${old_images}" ];
        then
            docker rmi -f ${old_images}
    fi
fi
docker run -d -p ${main_port}:${expose_port} ${name}
echo 'container start is completed!'
firewall-cmd --permanent --zone=public --add-port ${main_port}/tcp
firewall-cmd --reload
#shell end
