#!/bin/bash
#服务名称
name="tuding/tuding-eureka"
if [ ! -n "$(docker images ${name} |grep ${name})" ];
then
        echo 'image is not exisist!'
        docker run -d -p 1000:1000 ${name} # images is not exisists will run at daemon immediatly
else
        if [ ! -n "$(docker ps -a | grep ${name})" ];
        then
                echo 'container is not exisist!'
                docker run -d -p 1000:1000 ${name}
        else
                echo 'container is exisist,shut down now....'
                docker stop $(docker ps -a | grep ${name} | awk '{print $1}') #stop the docker container
                docker rm $(docker ps -a | grep ${name} | awk '{print $1}') # remove the docker contrainer
                latest_id=$(docker images | grep ${name} | grep 'latest' | awk '{print $3}') #get the images id which tags eqauls 'latest'
                expire_image=$(docker images | grep ${name} | grep -v ${latest_id} | awk '{print $3}')
                if [ ! -n "$expire_image" ]; #如果还存在过期的镜像则删除
                then
                    docker rmi -f  ${expire_image} #del images by name but latest
                fi
                docker run -d -p 1000:1000 ${name}
                echo 'container is rebuild now ...'
        fi
fi