package com.nadri.attr.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nadri.attr.service.AttrOrderService;
import com.nadri.attr.service.AttrService;
import com.nadri.attr.vo.AttrOrder;
import com.nadri.attr.vo.AttrOrderForm;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attr")
@SessionAttributes({"tid"})
public class AttrOrderController {

	@Autowired
	AttrOrderService attrOrderService;
	@Autowired
	AttrService attrService;
	
	/**
	 * 오더폼
	 * @param attDate
	 * @param attName
	 * @param attNo
	 * @param attPic
	 * @param optNo
	 * @param optionName
	 * @param optionPrice
	 * @param productQuantity
	 * @param price
	 * @param model
	 * @return
	 */
	@PostMapping("/orderform.nadri")
	public String orderform(
			@RequestParam(name="attdate") @DateTimeFormat(pattern = "yyyy-MM-dd")Date attDate,
			@RequestParam(name="attName") String attName,
			@RequestParam(name="attNo")int attNo,
			@RequestParam(name="attPic")String attPic,
			@RequestParam(name="optionNo", required=false)List<Integer> optNo,
			@RequestParam(name="optionName", required=false)List<String> optionName,
			@RequestParam(name="optionPrice", required=false)List<Integer> optionPrice,
			@RequestParam(name="productQuantity")List<Integer> productQuantity,
			@RequestParam(name="price")int price,
			Model model) {

		List<AttrOrder> optionInfo = new ArrayList<>();
		if(optNo!=null) {
			for(int i=0; i<optNo.size();i++) {
				int quantity = productQuantity.get(i);
				int optionNo = optNo.get(i);
				String optName = optionName.get(i);
				int optPrice = optionPrice.get(i);
				
				if(quantity!=0) {
					AttrOrder orderForm = new AttrOrder();
					orderForm.setProductQuantity(quantity);
					orderForm.setOptionNo(optionNo);
					orderForm.setOptionName(optName);
					orderForm.setOptionPrice(optPrice);
					optionInfo.add(orderForm);
				}
				
			}
			model.addAttribute("optionInfo",optionInfo);
		}
		
		AttrOrder orderInfo = new AttrOrder();
		orderInfo.setProductQuantity(productQuantity.get(0));
		orderInfo.setAttNo(attNo);
		orderInfo.setPrice(price);
		orderInfo.setAttPic(attPic);
		orderInfo.setAttName(attName);
		orderInfo.setAttDate(attDate);
		
		model.addAttribute("orderInfo",orderInfo);
		
		return "attr/orderform";
	}
	
	@PostMapping("/deposit.nadri")
	public String desposit(@LoginedUser User user,AttrOrderForm form, Model model) {
		

		
		return "attr/orderWaiting";
	}

	/*
	@ResponseBody
	@PostMapping("/deposit")
	public void addDepositInfo(@LoginedUser User user,
								@RequestParam(name="attNo") int attNo,
								@RequestParam(name="attDate") Date attDate,
								@RequestParam(name="optionNo") int optionNo,
								@RequestParam(name="productQuantity") int productQuantity,
								@RequestParam(name="totalQuantity") int totalQuantity,
								@RequestParam(name="couponNo") int couponNo,
								@RequestParam(name="lastPrice") int lastPrice,
								@RequestParam(name="name") String name,
								@RequestParam(name="email") String email,
								@RequestParam(name="tel") String tel		
								) {}
	*/
	
	/*
	@GetMapping("/pay/ready")
	public @ResponseBody ReadyResponse payReady(@RequestParam("no") int attrNo, int quantity, int lastPrice, Model model) {
		log.info("주문 상품: " + attrNo);
		log.info("주문 수량: " + quantity);
		log.info("주문 금액: " + lastPrice);		

		// 카카오 결재 준비 하기
		ReadyResponse readyResponse = KakaoPayService.payReady(attraction, quantity, lastPrice);
		// 결재고유 번호(tid)를 세션에 저장시킨다.
		model.addAttribute("tid", readyResponse.getTid());
		log.info("결재고유 번호: " + readyResponse.getTid());
		
		return readyResponse;
	}
	
	@GetMapping("/pay/completed")
	public String payCompleted(@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		log.info("결제고유 번호: " + tid);
		log.info("로그인한 사용자 정보: " + user);
		
		// 카카오 결재 요청하기
		ApproveResponse approveResponse = KakaoPayService.payApprove(tid, pgToken);	
		
		int userNo = user.getNo();
		int totalPrice = approveResponse.getAmount().getTotal();
		int bookNo = Integer.parseInt(approveResponse.getItem_code());	
		int quantity = approveResponse.getQuantity();
		
		AttrOrderForm attrOrder = new AttrOrderForm();
		attrOrder.setAttNo(bookNo);
		attrOrder.setTotalPriceQuantity(quantity);
		
		orderService.saveOrder(userNo, tid, totalPrice, orderItem);
		
		return "redirect:/order/success.nadri?id=" + tid;
	}	
	
	@GetMapping("/success.nadri")
	public String success() {
		return "attr/orderSuccess";
	}
	*/
	
	@GetMapping("/fail.nadri")
	public String fail() {
		return "attr/orderFail";
	}
	
	@PostMapping("/waiting.nadri")
	public String waiting(@LoginedUser User user,AttrOrderForm form, Model model) {
		// 주문정보 저장
		AttrOrder attrOrder = new AttrOrder();
		int userNo = user.getNo();
		form.setUserNo(userNo);
		BeanUtils.copyProperties(form, attrOrder);
		
		attrOrderService.addDepositOrder(attrOrder);
		
		// 쿠폰사용여부 변경
		int couponNo = form.getCouponNo();
		attrOrderService.couponUsedStat(userNo, couponNo);
		
		return "attr/orderWaiting";
	}
	
	
}
