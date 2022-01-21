package com.nadri.attr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AttrController {

	@GetMapping("/attr.nadri")
	public String home(Model model) {
		
		return "/attr/attraction";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	}
}
