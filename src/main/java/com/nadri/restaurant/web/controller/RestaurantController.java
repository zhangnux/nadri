package com.nadri.restaurant.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.coupon.util.Pagination;
import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.vo.Category;
import com.nadri.restaurant.vo.City;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.web.form.RestaurantCriteria;
import com.nadri.restaurant.web.form.RestaurantInsertForm;
import com.nadri.restaurant.web.form.RestaurantSearchForm;


@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	private RestaurantService rtService;
	
	
	
	/*
	@GetMapping("/init")
	public String init() throws Exception {
		
		rtService.addNewRestaurant();
		return "/home";
	}
	*/
	
	
	/*
	 * 요청방식 : GET
	 * 요청URL : /restaurant/main
	 * 요청파라미터 : category
	 * 이동할 뷰페이지 : /WEB-INF/views/restaurant/main.jsp
	 * 뷰페이지에 전달되는 데이터 : Restaurant
	 */
	@GetMapping("/main.nadri")
	public String main(Model model) {
		/*
		List<Restaurant> restaurants = rtService.getBestRestaurants();
		*/
		List<City> cities = rtService.getAllCities();
		List<Category> categories = rtService.getAllCategories();
		/*
		model.addAttribute("restaurants", restaurants);
		*/
		model.addAttribute("categories", categories);
		model.addAttribute("cities", cities);
		
		return "/restaurant/main";
	}
	
	
	@GetMapping("/list.nadri")
	public String list(Model model) {
		List<City> cities = rtService.getAllCities();
		List<Category> categories = rtService.getAllCategories();
		model.addAttribute("categories", categories);
		model.addAttribute("cities", cities);
		return "/restaurant/list";
	}
	
	
	/*
	@GetMapping("/list.nadri")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
			RestaurantSearchForm form, Model model) {
		RestaurantCriteria c = new RestaurantCriteria();
		
		
		if(StringUtils.hasText(form.getCityName())) {
			c.setCityName(form.getCityName());
		}
		
		if(StringUtils.hasText(form.getCategoryName())) {
			c.setCategoryName(form.getCategoryName());
		}
		
		if(StringUtils.hasText(form.getName())) {
			c.setName(form.getName());
		}
		
		if(StringUtils.hasText(form.getSort())) {
			c.setSort(form.getSort());
		}

		int totalRecords = rtService.getRestaurantsTotalRows(c);
		
		Pagination pagination = new Pagination(page, totalRecords);
		
		
		c.setBeginIndex(pagination.getBegin());
		c.setEndIndex(pagination.getEnd());
		
		List<Restaurant> restaurants = rtService.searchRestaurants(c);
		List<City> cities = rtService.getAllCities();
		List<Category> categories = rtService.getAllCategories();
		
		model.addAttribute("restaurants", restaurants);
		model.addAttribute("pagination", pagination);
		model.addAttribute("categories", categories);
		model.addAttribute("cities", cities);
		
		return "/restaurant/list";
	}
	*/
	
	
	
	/*
	 * 요청방식 : GET
	 * 요청URL : /restaurant/detail
	 * 요청파라미터 : no
	 * 이동할 뷰페이지 : /WEB-INF/views/restaurant/detail?no=
	 * 뷰페이지에 전달되는 데이터 : Restarant
	 */
	
	@GetMapping("/detail.nadri")
	public String detail(int no, Model model) {
	
		Restaurant restaurant = rtService.getRestaurantDetail(no);
		model.addAttribute("restaurant", restaurant);
		
		return "restaurant/detail";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	
	}
	
	@GetMapping("/checkout.nadri")
	public String checkout() {
		
		return "restaurant/checkout";
	}
	
	
	
	
	
	/*
	 @GetMapping("/insert.nadri")
	public String form() {
		
		return "restaurant/form";
	}
	@PostMapping("/insert.nadri")
	public String save(RestaurantInsertForm form) throws IOException  {
		String saveDirectory = "C:\\Develop\\projects\\final-workspace\\nadri\\src\\main\\webapp\\resources\\images\\restaurants";
		Restaurant rt = new Restaurant();
		MultipartFile upfiles = form.getUpfiles();
		
		if(!upfiles.isEmpty()) {
			String filename = upfiles.getOriginalFilename();
			rt.setPicture(filename);
			
			InputStream in = upfiles.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(saveDirectory, filename));
			
			FileCopyUtils.copy(in, out);
		}
		
		BeanUtils.copyProperties(form, rt);
		
		rtService.addNewRestaurant(rt);
		
		return "redirect:insert.nadri";
	}
	
	*/
	


}
