#!/usr/bin/env bash

#服务名称
name="tuding/tuding-zuul"
main_port="1001"
expose_port="1001"

docker run -d -p ${main_port}:${expose_port} ${name}
echo 'container start is completed!'
firewall-cmd --permanent --zone=public --add-port=${main_port}/tcp
firewall-cmd --reload
#shell end