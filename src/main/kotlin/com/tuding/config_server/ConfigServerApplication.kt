package com.tuding.config_server

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.cloud.config.server.EnableConfigServer
import org.springframework.cloud.netflix.eureka.EnableEurekaClient

@SpringBootApplication
@EnableConfigServer
@EnableEurekaClient
class ConfigServerApplication

fun main(args: Array<String>) {
    SpringApplication.run(ConfigServerApplication::class.java, *args)
}
