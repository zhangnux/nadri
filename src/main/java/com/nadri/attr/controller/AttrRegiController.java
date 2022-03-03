package com.nadri.attr.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.attr.service.AttrService;
import com.nadri.attr.vo.AttAddForm;
import com.nadri.attr.vo.AttOption;
import com.nadri.attr.vo.AttrReviewPic;
import com.nadri.attr.vo.Attraction;

@Controller
@RequestMapping("/attr")
public class AttrRegiController {
	
	@Autowired
	AttrService attrService;
	
	@GetMapping("/addform.nadri")
	public String form() {
		return "/attr/attrform";
	}
	

	@PostMapping("/addcomplete")
	public String addComplete(AttAddForm form) throws IOException {

		Attraction attraction = new Attraction();
		
		int price = 0;
		
		System.out.println(form.getPrice().get(0));
		if(form.getOptionstat()==1) {
			price = form.getPrice().get(0);
		}

		BeanUtils.copyProperties(form, attraction);
		MultipartFile files = form.getThumbnail();
		String fileName = System.currentTimeMillis()+files.getOriginalFilename();
		String saveDirectory="C:\\jy-nadri\\nadri\\src\\main\\webapp\\resources\\images\\att";
		InputStream in = files.getInputStream();
		FileOutputStream out = new FileOutputStream(new File(saveDirectory,fileName));
		FileCopyUtils.copy(in, out);
		BeanUtils.copyProperties(form, attraction);
		
		MultipartFile photo = form.getPhoto();
		if(photo != null && !photo.isEmpty()) {
			String photoname = System.currentTimeMillis()+photo.getOriginalFilename();
			InputStream in1 = photo.getInputStream();			
			FileOutputStream out1 = new FileOutputStream(new File(saveDirectory,photoname));
			FileCopyUtils.copy(in1, out1);
			attraction.setPhoto(photoname);
		}
		attraction.setPrice(price);
		attraction.setThumbnail(fileName);
		attrService.insertAttr(attraction);
		for(int i=0; i<form.getOption().size();i++) {
			if(!form.getOption().isEmpty()) {
				AttOption attOption = new AttOption();
				attOption.setOption(form.getOption().get(i));
				attOption.setPrice(form.getPrice().get(i));		
				attrService.insertAttrOption(attOption);
			}
		}
		
		return "redirect:/attr/list.nadri";
	}

}
