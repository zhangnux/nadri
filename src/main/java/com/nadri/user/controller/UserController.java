package com.nadri.user.controller;

import java.io.IOException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.user.form.UserInsertForm;
import com.nadri.user.service.UserService;
import com.nadri.user.vo.User;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@PostMapping("/addUser")
	public String save(UserInsertForm form) throws IOException {
		User user = new User();
		BeanUtils.copyProperties(form, user);
		userService.insertUser(user);
		
		return "redirect:/home.nadri";
	}
	
	/* 회원가입 */
	@GetMapping("/joinForm2")
	public String joinForm2() {
		return "/user/joinForm2";
	}

	@PostMapping("/insertUser")
	public String insert(User user, Model model) {
		userService.insertUser(user);
		return "redirect:/home.nadri";
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "/user/loginForm";
	}
	
}
