package com.nadri.user.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.user.form.UserForm;
import com.nadri.user.service.UserService;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/login.nadri")
	public String loginform() {
		return "user/loginForm";
	}

	
	@PostMapping("/login.nadri")
	public String login(String id, String password, Model model) {
		// 아이디와 비밀번호가 비어있거나 공백만 있으면 loginform.jsp로 내부이동
		if (!StringUtils.hasText(id) || !StringUtils.hasText(password)) {
			model.addAttribute("error", "아이디와 비밀번호는 필수 입력값입니다.");
			return "user/loginForm";
		}

		try {

			// UserService의 사용자 인증 서비스 호출
			User user = userService.login(id, password);
			SessionUtils.addAttribute("LOGIN_USER", user);

			return "redirect:/home.nadri";
		} catch (RuntimeException e) {
			model.addAttribute("error", e.getMessage());
			return "user/loginForm";
		}
	}

	@GetMapping("/logout.nadri")
	public String logout() {
		// 사용자정보를 세션에서 삭제
		SessionUtils.removeAttribute("LOGIN_USER");
		return "redirect:/home.nadri";
	}

	@GetMapping("/insert.nadri")
	public String joinform() {
		return "user/joinForm";
	}

	@PostMapping("/insert.nadri")
	public String join(UserForm form, Model model) {

		User user = new User();
		BeanUtils.copyProperties(form, user);

		try {
			userService.insertUser(user);
			return "redirect:joinCompleted.nadri";
		} catch (RuntimeException e) {
			model.addAttribute("error", e.getMessage());
			return "user/joinForm";
		}
	}
	
	@GetMapping("/joinCompleted.nadri")
	public String joinCompleted() {
		return "user/joinCompleted";
	}
	
	@GetMapping("/detail.nadri")
	public String detail() {
		return "user/detail";
	}
}
