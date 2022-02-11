package com.nadri.restaurant.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.nadri.coupon.util.Pagination;
import com.nadri.restaurant.dto.PayReadyResponseDto;
import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.vo.Category;
import com.nadri.restaurant.vo.City;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.vo.Timetable;
import com.nadri.restaurant.web.form.ReservationForm;
import com.nadri.restaurant.web.form.RestaurantCriteria;
import com.nadri.restaurant.web.form.RestaurantSearchForm;


@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	private RestaurantService rtService;
	
	static final Logger logger = LogManager.getLogger(RestaurantController.class);
	
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
		
		List<Restaurant> restaurants = rtService.getBestRestaurants();
		
		List<City> cities = rtService.getAllCities();
		List<Category> categories = rtService.getAllCategories();
		
		
		model.addAttribute("restaurants", restaurants);
		model.addAttribute("categories", categories);
		model.addAttribute("cities", cities);
		
		return "/restaurant/main";
	}
	
	/*
	@GetMapping("/list.nadri")
	public String list(Model model) {
		List<City> cities = rtService.getAllCities();
		List<Category> categories = rtService.getAllCategories();
		model.addAttribute("categories", categories);
		model.addAttribute("cities", cities);
		return "/restaurant/list";
	}
	*/
	
	
	@GetMapping("/list.nadri")
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") String page, 
			RestaurantSearchForm form, Model model) {
		RestaurantCriteria c = new RestaurantCriteria();
		
		
		
		if(StringUtils.hasText(form.getCity())) {
			c.setCity(form.getCity());
		}
		
		if(StringUtils.hasText(form.getCategory())) {
			c.setCategory(form.getCategory());
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
		int reviewCount = rtService.getReviewCount(no);
		model.addAttribute("reviewCount", reviewCount);
		double starPoint = rtService.getRestaurantStar(no);
		model.addAttribute("starPiont", starPoint);
		List<Timetable> timetables = rtService.getAllTimetable();
		model.addAttribute("timetables", timetables);
		
		return "restaurant/detail";	// prefix="/WEB-INF-views/" viewName="home" suffix=".jsp"
	
	}
	
	@GetMapping("/checkout.nadri")
	public String checkout(ReservationForm form, Model model) {
		
		logger.debug("form 값"+form);
		
		Timetable time = rtService.getTime(form.getTimetableNo());
		model.addAttribute("time", time);
		Restaurant restaurant = rtService.getRestaurantDetail(form.getRestaurantNo());
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("register", form);
		return "restaurant/checkout";
	}
	
	@GetMapping("/pay")
	public @ResponseBody PayReadyResponseDto pay(@RequestParam(name = "id") long id,
			@RequestParam(name = "quantity") int quantity,
			@RequestParam(name = "total_amount") int totalAmount) {
		/*
		Book book = bookService.getBook(id);
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 3e168fa6b46ea4b83a4b7f9195e27db5");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", String.valueOf(System.currentTimeMillis()));
		parameters.add("partner_user_id", "jhta");
		parameters.add("item_name", book.getTitle());
		parameters.add("item_code", String.valueOf(book.getId()));
		parameters.add("quantity", String.valueOf(quantity));
		parameters.add("total_amount", String.valueOf(totalAmount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost/order/pay/completed");
		parameters.add("cancel_url", "http://localhost/order/pay/cancel");
		parameters.add("fail_url", "http://localhost/order/pay/fail");
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, headers);
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		PayReadyResponseDto dto = template.postForObject(url, requestEntity, PayReadyResponseDto.class);
		System.out.println(dto);
		
		return dto;
		*/
		return null;
		
	}
	
	@PostMapping("/pay.nadri")
	public String reserve() {
		
		
		return null;
	}
	


}
