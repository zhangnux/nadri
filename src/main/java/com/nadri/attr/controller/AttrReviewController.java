package com.nadri.attr.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nadri.attr.pagination.Pagination;
import com.nadri.attr.service.AttrService;
import com.nadri.attr.service.ReviewService;

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
	@GetMapping("/delete")
	public int deleteByNo(int reviewNo) {
		int result = reviewService.removeReview(reviewNo);
		return result;
	}
*/
}
