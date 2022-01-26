package com.nadri.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class designController {

	@GetMapping("/test")
	public String home(Model model) {		
		return "test";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	}
}
