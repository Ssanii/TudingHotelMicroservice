FROM docker.io/java
MAINTAINER Chen"huanerding@qq.com"
ADD hotel_eureka-0.0.2.jar tuding-eureka.jar
EXPOSE 1000
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","tuding-eureka.jar"]