package com.nadri.user.web;

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
	
	@GetMapping("/insert")
	public String form(User user) {
		userService.insertUser(user);
		return "user/form";
	}
	
	@GetMapping("/form")
	public String formSec(User user) {
		userService.insertUser(user);
		return "user/list";
	}
	
}
