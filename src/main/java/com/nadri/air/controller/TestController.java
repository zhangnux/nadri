package com.nadri.air.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.nadri.air.dto.AirportDto;

@Controller
public class TestController {
	
	@GetMapping("/airport")
	public @ResponseBody AirportDto airport() {
		try {
			String result = DataDownload.getAirport();
			Gson gson = new Gson();
			AirportDto airportDto = gson.fromJson(result, AirportDto.class);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

}
