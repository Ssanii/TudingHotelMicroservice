#!/bin/bash

#服务名称
name="tuding/tuding-eureka"

if [ ! -n "$(docker images '$name' |grep '$name')" ];
then
        docker run -d -p 1000:1000 '$name' # images is not exisists will run at daemon immediatly
else
        if [ ! -n "$(docker ps -a | grep '$name')" ];
        then
                docker run -d -p 1000:1000 '$name'
        else
                docker stop $(docker ps -a | grep '$name' | awk '{print $1}') #stop the docker container
                docker rm $(docker ps -a | grep '$name' | awk '{print $1}') # remove the docker contrainer
                latest_id=  $(docker images | grep '$name' | grep 'latest' | awk '{print $3}') #get the images id which tags eqauls 'latest'
                docker rmi -f $(docker images | grep '$name' | grep -v '$latest_id' | awk '{print $3}') #del images by name but latest
                docker run -d -p 1000:1000 '$name'
        fi
fi


