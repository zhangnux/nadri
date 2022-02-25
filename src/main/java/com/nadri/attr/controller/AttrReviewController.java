package com.nadri.attr.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.attr.pagination.Pagination;
import com.nadri.attr.service.AttrService;
import com.nadri.attr.service.ReviewService;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.AttrReviewPic;
import com.nadri.attr.vo.ReviewForm;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

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
		
		List<AttrReview> reviewList = reviewService.getReviewList(attNo, beginIndex, endIndex);
		
		result.put("reviewList", reviewList);
		result.put("pagination", pagination);
		
		return result;
	}
	
	
	@PostMapping("/delete")
	public void deleteByNo(int reviewNo) {
		reviewService.removeReview(reviewNo);
	}
	
	@PostMapping("/modify")
	public void updateReview(int reviewNo, String content) throws Exception {
		reviewService.modifyReview(reviewNo, content);
	}

}
