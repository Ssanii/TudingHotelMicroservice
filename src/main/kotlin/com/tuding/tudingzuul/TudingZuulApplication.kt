package com.tuding.tudingzuul

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient
import org.springframework.cloud.netflix.zuul.EnableZuulProxy

@SpringBootApplication
@EnableZuulProxy
@EnableEurekaClient
class TudingZuulApplication

fun main(args: Array<String>) {
    SpringApplication.run(TudingZuulApplication::class.java, *args)
}
