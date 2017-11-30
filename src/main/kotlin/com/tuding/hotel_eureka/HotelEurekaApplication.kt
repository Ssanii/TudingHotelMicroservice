package com.tuding.hotel_eureka

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer

@SpringBootApplication
@EnableEurekaServer
class HotelEurekaApplication

fun main(args: Array<String>) {
    SpringApplication.run(HotelEurekaApplication::class.java, *args)
}
