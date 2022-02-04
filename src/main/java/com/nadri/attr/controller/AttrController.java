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
import com.nadri.attr.service.ReviewService;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.Search;

import lombok.extern.slf4j.Slf4j;

import com.nadri.attr.dto.AttOptionDetail;
import com.nadri.attr.pagination.Pagination;

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
	public String searching(@RequestParam(name="place", defaultValue = "") String category,
							@RequestParam(name="page", defaultValue="1") int page,Search search,Model model) 
	{
		List<Attraction> attraction = attrService.getSearchResult(search);
		model.addAttribute("category", attraction);
		model.addAttribute("place",category);
		
		return "attr/attrlist";
	}
	
	@GetMapping("/detail.nadri")
	public String detail(@RequestParam(name="no") int no, Attraction attraction, AttrReview attrReview,Model model) {
		Attraction detail = attrService.getDetailPage(no);
		List<Attraction> option = attrService.getOptionInfo(no);
		model.addAttribute("detail",detail);
		model.addAttribute("option", option);
		
		int count = attrService.getReviewCount(no);
		double star = attrService.getStarCount(no);
		model.addAttribute("count", count);
		model.addAttribute("star", star);
		
		String place = detail.getPlace();
		List<Attraction> random = attrService.getRandom(no, place);
		model.addAttribute("random", random);
		
		return "attr/attrdetail";
	}
	
	/*
	// 테스트용
	@GetMapping("/test.nadri")
	public String test(@RequestParam(name="place", defaultValue = "") String category, 
			@RequestParam(name="page",required=false,defaultValue="1") int page,
			Search search,Model model) {
		List<Attraction> attraction = attrService.getSearchResult(search);
		
		//int totalRecords = attrService.
		Pagination	pagination = new Pagination(page, totalRecords);
		search.setBeginIndex(pagination.getBegin());
		search.setEndIndex(pagination.getEnd());
		
		model.addAttribute("category", attraction);
		model.addAttribute("place",category);
		
		return "attr/test";
	}
	*/
	
}
