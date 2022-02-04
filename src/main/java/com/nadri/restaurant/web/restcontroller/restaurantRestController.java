package com.nadri.restaurant.web.restcontroller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.manager.exception.LoginErrorException;
import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.vo.RestaurantReview;
import com.nadri.restaurant.web.form.RestaurantReviewInsertForm;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;

@RestController
@RequestMapping("/rest/restaurant")
public class restaurantRestController {

	@Autowired
	private RestaurantService rtService;
	
	
	
	@PostMapping("/review/insert.nadri")
	public RestaurantReview insert(RestaurantReviewInsertForm form) throws IOException {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (user == null) {
			throw new LoginErrorException("로그인 해주세요.");
		}
		
		RestaurantReview review = new RestaurantReview();
		review.setRestaurantNo(form.getRestaurantNo());
		review.setUserNo(user.getNo());
		review.setRating(form.getRating());
		review.setContent(form.getContent());
		
		MultipartFile upfile = form.getUpfile();
		if (upfile != null && !upfile.isEmpty()) {
			String directory = "c:/fileproject.../resources/images/";
			String filename = upfile.getOriginalFilename();
			
			InputStream in = upfile.getInputStream();	// 첨부파일을 읽어오는 스트림 
			OutputStream out = new FileOutputStream(directory + filename);	// 첨부파일을 지정된 폴더에 지정된 이름으로 기록하는 스트림
			FileCopyUtils.copy(in, out);	

			review.setPicture(filename);
		}
		rtService.addNewReview(review);
		
		List<RestaurantReview> reviewList = rtService.getAllReviewsByRestaurantNo(form.getRestaurantNo());
		
		return review;
	}
	
}
