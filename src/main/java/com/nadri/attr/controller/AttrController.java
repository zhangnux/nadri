package com.nadri.attr.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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

@Controller
@RequestMapping("/attr")
public class AttrController {
	
	@Autowired AttrService attrService;
	@Autowired ReviewService reviewService;

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
	
	
	@PostMapping("/addreview.nadri")
	public String addReview(ReviewForm reviewForm) throws Exception {
		String saveDirectory="C:\\Develop\\projects\\final-workspace\\nadri\\src\\main\\webapp\\resources\\images\\att\\review";
		List<AttrReviewPic> attrReviewPics = new ArrayList<>();
		List<MultipartFile> upfiles = reviewForm.getUpfiles();
		for(MultipartFile multipartFile:upfiles) {
			if(!multipartFile.isEmpty()) {
				String filename = System.currentTimeMillis() + multipartFile.getOriginalFilename();
				AttrReviewPic attrReviewPic = new AttrReviewPic();
				attrReviewPic.setPic(filename);
				attrReviewPics.add(attrReviewPic);
				InputStream in = multipartFile.getInputStream();
				FileOutputStream out = new FileOutputStream(new File(saveDirectory,filename));
				FileCopyUtils.copy(in, out);
			}
		}
		
		AttrReview attrReview = new AttrReview();
		BeanUtils.copyProperties(reviewForm, attrReview);
		reviewService.addReview(attrReview, attrReviewPics);
		
		return "redirect:/attr/detail.nadri?no="+attrReview.getAttNo();
	}

}
