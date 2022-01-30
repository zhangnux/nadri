package com.nadri.noticeBoard.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.noticeBoard.service.NoticeBoardService;

@Controller
@RequestMapping("/noticeBoard")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService nbService;
	
	
	@GetMapping("list.nadri")
	public String list() {
		
		
		
		return "/noticeBoard/list";
	}
	
	
	@GetMapping("insert.nadri")
	public String form() {
		
		return "/noticeBoard/form";
	}

}
