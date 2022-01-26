package com.nadri.attr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.attr.service.AttrService;
import com.nadri.attr.vo.Attraction;


@Controller
@RequestMapping("/attr")
public class AttrController {
	
	@Autowired
	AttrService attrService;

	@GetMapping("/main.nadri")
	public String home(Model model) {
		
		List<Attraction> attraction = attrService.getAllAttrList();
		int count = attrService.getListCount();
		
		model.addAttribute("attr", attraction);
		model.addAttribute("count",count);
		
		return "/attr/attraction";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	}
	
	@GetMapping("/list.nadri")
	public String list(Model model) {
		
		List<Attraction> attraction = attrService.getAllAttrList();
		int count = attrService.getListCount();
		
		model.addAttribute("attr", attraction);
		model.addAttribute("count",count);
		
		return "/attr/attrlist";		
	}
	
}
