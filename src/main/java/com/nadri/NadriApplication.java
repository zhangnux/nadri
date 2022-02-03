package com.nadri;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class NadriApplication {

	public static void main(String[] args) {
		SpringApplication.run(NadriApplication.class, args);
	}

}
