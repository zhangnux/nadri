package com.nadri.lodging.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.lodging.service.LodgingService;

@Controller
@RequestMapping("/lodging")
public class LodgingController {

	@Autowired
	private LodgingService lodgingService;
	
	@GetMapping
	public String search() {
		
		return "lodging/search";
	}
	
	@GetMapping("/list.nadri")
	public String list() {
		
		return "lodging/list";
	}
}
