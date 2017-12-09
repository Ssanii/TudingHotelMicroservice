package com.tuding.config_server

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication

@SpringBootApplication
class ConfigServerApplication

fun main(args: Array<String>) {
    SpringApplication.run(ConfigServerApplication::class.java, *args)
}
