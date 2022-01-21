package com.nadri.train.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/train")
public class TrainController {
	
	@GetMapping
	public String search() {
		return "train/trainSearch";
	}
	
	@GetMapping("/list.do")
	public String list() {
		return "train/trainList";
	}
}
