package com.nadri.manager.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.manager.service.ManagerService;
import com.nadri.manager.util.SessionUtils;
import com.nadri.manager.web.restController.ManagerRestController;
import com.nadri.user.vo.User;

@Controller
@RequestMapping("/admin")
public class ManagerController {
	static final Logger log = LogManager.getLogger(ManagerRestController.class);
	
	@Autowired
	ManagerService service;
	
	@GetMapping
	public String login() {
		return "manager/login";
	}
	
	@GetMapping("/index.nadri")
	public String total() {
		return "manager/index";
	}
	
	@GetMapping("/logout.nadri")
	public String logout() {
		SessionUtils.sessionInvlidate();
		return "redirect:/admin";
	}
	
	@GetMapping("/userManagement.nadri")
	public String userManagement(Model model) {
		// 모든 유저 정보 불러오기
		List<User> userList = service.getAllUser();
		model.addAttribute("userList", userList);
		int total = userList.size();
		model.addAttribute("genderRate", service.getGenderRateOfUser(total));
		model.addAttribute("ageRate", service.getAgeRateOfUser(total));
		return "manager/userManagement";
	}
	
}
