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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nadri.attr.kakaoPay.ApproveResponse;
import com.nadri.attr.kakaoPay.KakaoPayServiceAttr;
import com.nadri.attr.kakaoPay.ReadyResponse;
import com.nadri.attr.service.AttrOrderService;
import com.nadri.attr.service.AttrService;
import com.nadri.attr.vo.AttrOrder;
import com.nadri.attr.vo.AttrOrderForm;
import com.nadri.attr.vo.Attraction;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/attr")
public class AttrOrderController {

	@Autowired
	AttrOrderService attrOrderService;
	@Autowired
	AttrService attrService;
	@Autowired
	KakaoPayServiceAttr kakaoPayService;
	
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

	@PostMapping("/waiting.nadri")
	public String waiting(@LoginedUser User user,AttrOrderForm form, Model model) {
		// 주문정보 저장
		AttrOrder attrOrder = new AttrOrder();
		int userNo = user.getNo();
		form.setUserNo(userNo);
		BeanUtils.copyProperties(form, attrOrder);
		
		attrOrderService.addDepositOrder(attrOrder);
		
		List<Integer> optionNo = form.getOptionNo();
		List<Integer> optionQuantity = form.getProductQuantity();
		if(optionNo!=null) {
			for(int i=0;i<optionNo.size();i++) {
				AttrOrder attrOption = new AttrOrder();
				attrOption.setOptionNo(optionNo.get(i));
				attrOption.setProductQuantity(optionQuantity.get(i));
				attrOrderService.addDepositOption(attrOption);
			}
		}
		
		// 쿠폰사용여부 변경
		int couponNo = form.getCouponNo();
		if(couponNo!=0) {
			attrOrderService.couponUsedStat(userNo, couponNo);
		}
		// 판매량 증가
		int attNo = form.getAttNo();
		attrOrderService.addSalesCount(attNo);
		return "attr/orderWaiting";
	}
		

	@GetMapping("/pay/ready")
	public @ResponseBody ReadyResponse payReady(@LoginedUser User user, AttrOrderForm form, Model model) {
		log.info("주문 상품: " + form.getAttName());
		log.info("주문 수량: " + form.getTotalQuantity());
		log.info("주문 금액: " + form.getLastPrice());	
		
		// 유저아이디 추가
		int userNo = user.getNo();
		form.setUserNo(userNo);
		AttrOrder attrOrder = new AttrOrder();
		BeanUtils.copyProperties(form, attrOrder);
		
		// 결제 임시 데이터 추가
		int orderNo = attrOrderService.addKakaoOrder(attrOrder);
		List<Integer> optionNo = form.getOptionNo();
		List<Integer> optionQuantity = form.getProductQuantity();
		if(optionNo!=null) {
			for(int i=0;i<optionNo.size();i++) {
				AttrOrder attrOption = new AttrOrder();
				attrOption.setOptionNo(optionNo.get(i));
				attrOption.setProductQuantity(optionQuantity.get(i));
				attrOrderService.addKakaoOption(attrOption);
			}
		}
		
		SessionUtils.addAttribute("orderNo", orderNo);

		int attrNo = form.getAttNo();
		int quantity = form.getTotalQuantity();
		int lastPrice = form.getLastPrice();

		Attraction attraction = attrService.getDetailPage(attrNo);

		// 카카오 결재 준비 하기
		ReadyResponse readyResponse = kakaoPayService.payReady(attraction, quantity, lastPrice);
		// 결재고유 번호(tid)를 세션에 저장시킨다.
		SessionUtils.addAttribute("tid", readyResponse.getTid());
		log.info("결재고유 번호: " + readyResponse.getTid());

		return readyResponse;
	}
	
	
	@GetMapping("/pay/completed")
	public String payCompleted(@RequestParam("pg_token") String pgToken, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		String tid = (String) SessionUtils.getAttribute("tid");
		int orderNo = (Integer) SessionUtils.getAttribute("orderNo");
		
		log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		log.info("결제고유 번호: " + tid);
		log.info("로그인한 사용자 정보: " + user);
		
		// 카카오 결재 요청하기
		ApproveResponse approveResponse = kakaoPayService.payApprove(tid, pgToken);	
		
		return "redirect:/attr/success.nadri?orderNo=" + orderNo;
	}	
	
	@GetMapping("/success.nadri")
	public String success() {
		int orderNo = (Integer) SessionUtils.getAttribute("orderNo");
		attrOrderService.kakaoPayCompleted(orderNo);
		return "attr/orderSuccess";
	}
	
	@GetMapping("/fail.nadri")
	public String fail() {
		int orderNo = (Integer) SessionUtils.getAttribute("orderNo");
		attrOrderService.deleteKakaoOption(orderNo);
		attrOrderService.deleteKakaoOrder(orderNo);
		
		return "attr/orderFail";
	}
	
	// 주문내역확인
	@GetMapping("/reservation.nadri")
	public String reservList(@LoginedUser User user, Model model) {
		int userNo = user.getNo();
		List<AttrOrder> reserv = attrOrderService.getReservList(userNo);
		model.addAttribute("reserv",reserv);
		return "/attr/reservlist";
	}
}
