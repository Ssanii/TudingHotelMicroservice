#!/bin/bash
#服务名称
name="tuding/tuding-zuul"

if [ -n "$(docker images | grep ${name})" ];
then
    #存在的情况下，要判断是否有启动的容器
    docker_container=$(docker ps -a | grep ${name})
    if [ -n "${docker_container}" ];
        then
            #容器存在的情况下，先停止容器，然后删除容器
            docker stop $(${docker_container} | awk '{print $1}')
            docker rm $(${docker_container} | awk '{print $1}')
            echo "容器已移除"
    fi
    #删除旧容器，再启动新容器
    last_images=$(docker images | grep "${name}" | grep "latest" | awk '{print $3}')
    old_images=$(docker images | grep "${name}" | grep -v ${last_images} | awk '{print $3}')
    if [ -n "${old_images}" ];
        then
            docker rmi -f ${old_images}
            echo "旧镜像已移除"
    fi
fi
none_image=$(docker images|grep "none" | awk '{print  $3}')
if [ -n "${none_image}" ];
then
docker rmi -f ${none_image}
fi
#shell end