package com.nadri.manager.web.controller;

import java.util.ArrayList;
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
		List<User> userList = new ArrayList<>(service.getAllUser().subList(0, 5));
		model.addAttribute("userList", userList);
		int total = service.getAllUser().size();
		model.addAttribute("genderRate", service.getGenderRateOfUser(total));
		model.addAttribute("ageRate", service.getAgeRateOfUser(total));
		// total/n.0 <= n은 한페이지에 나올 목록 개수 total/n은 페이지네이션 개수
		// n값은 mapper의 rn 의 기준값과 동일 하다
		model.addAttribute("total", Math.ceil(total/5.0));
		return "manager/userManagement";
	}
	
}
