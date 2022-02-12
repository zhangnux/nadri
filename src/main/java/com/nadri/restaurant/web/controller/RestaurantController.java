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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.nadri.coupon.util.Pagination;
import com.nadri.restaurant.dto.PayReadyResponseDto;
import com.nadri.restaurant.kakaopay.ApproveResponse;
import com.nadri.restaurant.kakaopay.KakaoPayService;
import com.nadri.restaurant.kakaopay.ReadyResponse;
import com.nadri.restaurant.service.RestaurantService;
import com.nadri.restaurant.vo.Category;
import com.nadri.restaurant.vo.City;
import com.nadri.restaurant.vo.Reservation;
import com.nadri.restaurant.vo.ReservationCurrentState;
import com.nadri.restaurant.vo.Restaurant;
import com.nadri.restaurant.vo.Timetable;
import com.nadri.restaurant.web.form.ReservationForm;
import com.nadri.restaurant.web.form.RestaurantCriteria;
import com.nadri.restaurant.web.form.RestaurantSearchForm;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	private RestaurantService rtService;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
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
	
	@GetMapping("/pay/ready")
	public @ResponseBody ReadyResponse payReady(@RequestParam("no") int no, int quantity, int totalPrice, Model model) {
		log.info("레스토랑 번호: " + no);
		log.info("주문 수량: " + quantity);
		log.info("주문 금액: " + totalPrice);
		
		Restaurant restaurant = rtService.getRestaurantDetail(no);
		
		// 카카오 결재 준비 하기
		ReadyResponse readyResponse = kakaoPayService.payReady(restaurant, quantity, totalPrice);
		// 결재고유 번호(tid)를 세션에 저장시킨다.
		model.addAttribute("tid", readyResponse.getTid());
		log.info("결재고유 번호: " + readyResponse.getTid());
		
		return readyResponse;
	}
	
	@GetMapping("/pay/completed")
	public String payCompleted(@LoginedUser User user, @RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, Model model) {
		
		log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		log.info("결재고유 번호: " + tid);
		log.info("로그인한 사용자 정보: " + user);
		
		// 카카오 결재 요청하기
		ApproveResponse approveResponse = kakaoPayService.payApprove(tid, pgToken);	
		
		int userNo = user.getNo();
		int totalPrice = approveResponse.getAmount().getTotal();
		int restaurantNo = Integer.parseInt(approveResponse.getItem_code());	
		int quantity = approveResponse.getQuantity();
		
		/*
		OrderItem orderItem = new OrderItem();
		orderItem.setBookNo(bookNo);
		orderItem.setQuantity(quantity);
		
		orderService.saveOrder(userNo, tid, totalPrice, orderItem);
		*/
		
		return "redirect:/order/completed?id=" + tid;
	}
	
	@RequestMapping("/completed")
	public String completed(@RequestParam("id") String orderId, Model model) {
		/*
		Order order = orderService.getOrderById(orderId);
		model.addAttribute("order", order);
		*/
		return "order/completed";
	}
	
	/*
	@PostMapping("/reserve.nadri")
	public String reserve(@LoginedUser User user, ReservationForm form) {
		
		// coupon 어케 사용??
		
		Restaurant restaurant = rtService.getRestaurantDetail(form.getRestaurantNo());
		Reservation reservation = new Reservation();
		ReservationCurrentState state = new ReservationCurrentState();
		
		int sales = restaurant.getSales() + 1;
		restaurant.setSales(sales);
		restaurant.setNo(form.getRestaurantNo());
		rtService.updateSales(restaurant);
		
		
		
		rtService.insertReservation(reservation);
		rtService.insertCurrentState(state);
		
		return null;
	}
	*/


}
