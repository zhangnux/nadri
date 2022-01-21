package com.nadri.manager.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class ManagerController {
	
	@GetMapping
	public String login() {
		return "manager/login";
	}
	
	@GetMapping("/index.nadri")
	public String total() {
		return "manager/index";
	}
}
