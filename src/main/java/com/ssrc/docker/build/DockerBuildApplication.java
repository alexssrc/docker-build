package com.ssrc.docker.build;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DockerBuildApplication {

	public static void main(String[] args) {
		SpringApplication.run(DockerBuildApplication.class, args);
		System.out.println("============== Docker Build 启动成功 =======================");
	}

}
