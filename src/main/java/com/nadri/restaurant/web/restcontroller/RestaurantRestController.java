package com.nadri.restaurant.web.restcontroller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.restaurant.dto.BookableDto;
import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.utill.Pagination;
import com.nadri.restaurant.vo.RestaurantReview;
import com.nadri.restaurant.web.form.RestaurantReviewInsertForm;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;


@RestController
@RequestMapping("/rest/restaurant")
public class RestaurantRestController {

	@Autowired
	private RestaurantService rtService;
	
	static final Logger logger = LogManager.getLogger(RestaurantRestController.class);
	
	
	
	
	
	 @PostMapping("/review/insert.nadri")
	 public void insert(@LoginedUser User user, RestaurantReviewInsertForm form) throws IOException {
		
		logger.debug("입력폼 정보" + form);
		
		RestaurantReview review = new RestaurantReview();
		review.setRestaurantNo(form.getRestaurantNo());
		review.setUserNo(user.getNo());
		review.setRating(form.getRating());
		review.setContent(form.getContent());
		
		logger.debug("전달된 정보" + review);
		
		MultipartFile upfile = form.getUpfile();
		if (upfile != null && !upfile.isEmpty()) {
			String directory = "C:\\Develop\\projects\\final-workspace\\nadri\\src\\main\\webapp\\resources\\images\\restaurants\\reviews\\";
			String filename = upfile.getOriginalFilename();
			
			InputStream in = upfile.getInputStream();	// 첨부파일을 읽어오는 스트림 
			OutputStream out = new FileOutputStream(directory + filename);	// 첨부파일을 지정된 폴더에 지정된 이름으로 기록하는 스트림
			FileCopyUtils.copy(in, out);	

			review.setPicture(filename);
		}
		rtService.addNewReview(review);
		
		
	}

	
	@GetMapping("/review/list.nadri")
	public Map<String, Object> list(@RequestParam("no") int restaurantNo, @RequestParam(name = "page", required = false, defaultValue = "1") int page) throws IOException {
		
		int totalCount = rtService.getReviewCount(restaurantNo);
		
		Pagination pagination = new Pagination(page, totalCount);
		
		List<RestaurantReview> reviewList = rtService.getAllReviewsByRestaurantNo(restaurantNo, pagination.getBegin(), pagination.getEnd());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("reviews", reviewList);
		
		return map;
		
	}
	
	@PostMapping("/review/delete.nadri")
	public void delete(int no) {
		rtService.deleteReview(no);
		
	}
	
	@PostMapping("/review/modify.nadri")
	public void modify(RestaurantReviewInsertForm form) throws IOException {
		
		RestaurantReview review = new RestaurantReview();
		review.setNo(form.getReviewNo());
		review.setRating(form.getRating());
		review.setContent(form.getContent());
		
		logger.debug("전달된 정보" + review);
		
		MultipartFile upfile = form.getUpfile();
		if (upfile != null && !upfile.isEmpty()) {
			String directory = "C:\\Develop\\projects\\final-workspace\\nadri\\src\\main\\webapp\\resources\\images\\restaurants\\reviews\\";
			String filename = upfile.getOriginalFilename();
			
			InputStream in = upfile.getInputStream();	// 첨부파일을 읽어오는 스트림 
			OutputStream out = new FileOutputStream(directory + filename);	// 첨부파일을 지정된 폴더에 지정된 이름으로 기록하는 스트림
			FileCopyUtils.copy(in, out);	

			review.setPicture(filename);
		}
		rtService.updateReview(review);
		
	}
	
	@GetMapping("/book/bookable.nadri")
	public List<BookableDto> bookabletime(@RequestParam("no") int restaurantNo,
			@RequestParam("date") String date){
		List<BookableDto> bookableTimeList = rtService.getBookableTime(restaurantNo, date);
		return bookableTimeList;
	}
	
	
	
	

	
}
