#!/usr/bin/env bash
#服务名称
name="tuding/tuding-zuul"
main_port="1001"
expose_port="1001"

images_id=$(docker images | grep ${name})
if [ -n "${images_id}" ];
then
    #存在的情况下，要判断是否有启动的容器
    docker_container=$(docker ps -a | grep ${images_id})
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
docker stop $(docker ps -a | grep ${none_image} | awk '{print $1}')
docker rm $(docker ps -a | grep ${none_image} | awk '{print $1}')
docker rmi -f ${none_image}
fi

docker run -d -p ${main_port}:${expose_port} ${name}
echo 'container start is completed!'
firewall-cmd --permanent --zone=public --add-port=${main_port}/tcp
firewall-cmd --reload
#shell end