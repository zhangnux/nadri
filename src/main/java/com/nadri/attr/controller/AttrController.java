package com.nadri.attr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nadri.attr.service.AttrService;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Search;


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
	public String searching(@RequestParam(name="place", defaultValue = "") String category,Search search,Model model) {
		List<Attraction> attraction = attrService.getSearchResult(search);
		model.addAttribute("category", attraction);
		model.addAttribute("place",category);
		
		return "attr/attrlist";
	}
	
	@GetMapping("/detail.nadri")
	public String detail() {
		return "attr/attrdetail";
	}
	
	// 테스트용
	@GetMapping("/test.nadri")
	public String test(@RequestParam(name="place", defaultValue = "") String category,Search search,Model model) {
		List<Attraction> attraction = attrService.getSearchResult(search);
		model.addAttribute("category", attraction);
		model.addAttribute("place",category);
		
		return "attr/test";
	}
}
