package com.nadri.attr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.attr.dao.AttrReviewDao;
import com.nadri.attr.pagination.Pagination;
import com.nadri.attr.service.AttrService;
import com.nadri.attr.service.ReviewService;
import com.nadri.attr.vo.AttrReview;

@RestController
@RequestMapping("/attr")
public class AttrReviewController {

	@Autowired ReviewService reviewService;
	@Autowired AttrService attrService;
	
	@RequestMapping("/review")
	public Map<String, Object> getListByNo(@RequestParam(name="no") int attNo, 
										   @RequestParam(name="page", defaultValue="1")String page) {	
		Map<String, Object> result = new HashMap<String, Object>();
		
		int getReviewCount = attrService.getReviewCount(attNo);
		Pagination pagination = new Pagination(page, getReviewCount);
		int beginIndex = pagination.getBegin();
		int endIndex = pagination.getEnd();
		
		result.put("reviewList", reviewService.getReviewList(attNo, beginIndex, endIndex));
		result.put("pagination", pagination);
		
		return result;
	}
	
/*
	@RequestMapping("/page")
	public int getPage(@RequestParam(name="no") int attNo, 
						@RequestParam(name="page", defaultValue="1")String page,
						AttrReview review, Model model) {

		int getReviewCount = reviewService.getReviewCount(attNo);
		Pagination pagination = new Pagination(page, getReviewCount);
		review.setBeginIndex(pagination.getBegin());
		review.setEndIndex(pagination.getEnd());

		return reviewService.getReviewCount(attNo);
	}
*/
	
}
