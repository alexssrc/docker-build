package com.ssrc.docker.build.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class HelloController {

	@Value("${server.port}")
	public String port;

	@RequestMapping
	public String init() {
		System.out.println("HELLO，NAME：DOCKER-BUILD，PORT：" + port);
		return "HELLO，NAME：DOCKER-BUILD，PORT：" + port;
	}

}
