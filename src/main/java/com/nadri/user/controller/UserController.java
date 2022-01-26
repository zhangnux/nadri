package com.nadri.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.user.service.UserService;
import com.nadri.user.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@GetMapping("/joinForm1")
	public String joinForm() {
		return "/user/joinForm1";
	}
	
	@GetMapping("/joinForm2")
	public String joinForm2() {
		return "/user/joinForm2";
	}

	@GetMapping("/loginForm")
	public String loginForm() {
		return "/user/loginForm";
	}
	
}
