package com.nadri.attr.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.attr.service.AttrService;
import com.nadri.attr.service.ReviewService;
import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.AttrReviewPic;
import com.nadri.attr.vo.Attraction;
import com.nadri.attr.vo.ReviewForm;
import com.nadri.attr.vo.Search;
import com.nadri.coupon.service.UserCouponService;
import com.nadri.coupon.vo.Coupon;
import com.nadri.coupon.vo.UserCoupon;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;

@Controller
@RequestMapping("/attr")
public class AttrController {
	
	@Autowired AttrService attrService;
	@Autowired ReviewService reviewService;
	@Autowired UserCouponService userCouponService;

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

		User loginedUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		if(loginedUser != null) {
			int userNo = loginedUser.getNo();
			List<UserCoupon> couponList = attrService.getCoupon(userNo);
			model.addAttribute("couponList", couponList);
			int reviewCount = 0;
			try {
				reviewCount = attrService.getReviewCountPerUser(userNo,no);
				model.addAttribute("userReviewCount", reviewCount);
			}catch(BindingException e) {
				model.addAttribute("userReviewCount", reviewCount);
			}
		}
	
		return "attr/attrdetail";
	}
	
	@PostMapping("/addreview")
	public String addReview(ReviewForm reviewForm, @LoginedUser User user) throws Exception {
		
		int userNo = user.getNo();
		reviewForm.setUserNo(userNo);
		
		List<AttrReviewPic> attrReviewPics = new ArrayList<>();
		List<MultipartFile> upfiles = reviewForm.getUpfiles();
		String saveDirectory="C:\\jy-nadri\\nadri\\src\\main\\webapp\\resources\\images\\att\\review";
		for(MultipartFile files:upfiles) {
			if(!files.isEmpty()) {
				String fileName = System.currentTimeMillis()+files.getOriginalFilename();
				AttrReviewPic attrReviewPic = new AttrReviewPic();
				attrReviewPic.setPic(fileName);
				attrReviewPics.add(attrReviewPic);
				
				InputStream in = files.getInputStream();
				FileOutputStream out = new FileOutputStream(new File(saveDirectory,fileName));
				FileCopyUtils.copy(in,out);
			}	
		}
		
		AttrReview attrReview = new AttrReview();
		BeanUtils.copyProperties(reviewForm, attrReview);
		reviewService.addReview(attrReview,attrReviewPics);
		
		return "redirect:/attr/detail.nadri?no="+attrReview.getAttNo();
	}
	
}
