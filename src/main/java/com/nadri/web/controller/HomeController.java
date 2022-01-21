package com.nadri.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/home.nadri")
	public String home(Model model) {
		model.addAttribute("message", "내용");
		
		return "home";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	}
}
