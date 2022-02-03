package com.nadri.csBoard.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.csBoard.service.CsBoardService;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;


@Controller
@RequestMapping("/csboard")
public class csBoardController {
	
	@Autowired
	private CsBoardService csService;
	
	
	
	@GetMapping("/userlist.nadri")
	public String userList() {
		
		return "/csBoard/userlist";
	}
	
	
	@GetMapping("/list.nadri")
	public String list() {
		
		return "/csBoard/list";
	}

	
	@GetMapping("/detail.nadri")
	public String detail() {
		
		return "/csBoard/detail";
	}
	
	
	
	
	@GetMapping("/insert.nadri")
	public String form() {
		// 세션에 저장된 사용자 정보를 조회한다
		// User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		// if (user == null) {
		//	throw new LoginErrorException("로그인 후 사용가능한 서비스 입니다.");
		// }
		
		return "/csBoard/form";
	}
	
	@PostMapping("/insert.nadri")
	public String save(Model model) {
		
		
		return "redirect:list.nadri";
	}

}
