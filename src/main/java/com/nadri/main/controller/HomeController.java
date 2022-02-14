package com.nadri.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nadri.attr.service.AttrService;
import com.nadri.attr.vo.Attraction;
import com.nadri.main.service.MainService;
import com.nadri.noticeBoard.service.NoticeBoardService;
import com.nadri.noticeBoard.vo.NoticeBoard;
import com.nadri.restaurant.vo.Restaurant;

@Controller
public class HomeController {

	@Autowired
	MainService service;
	@Autowired
	NoticeBoardService nbService;
	
	@GetMapping("/home.nadri")
	public String home(Model model) {
		List<Restaurant> res = service.randomRestaurant();
		List<Attraction> attr = service.randomAttraction();
		model.addAttribute("res", res);
		model.addAttribute("attr", attr);
		
		
		List<NoticeBoard> notice = nbService.getMainBoard();
		model.addAttribute("notice", notice);	
		
		return "home";
	}
}
