package com.nadri.attr.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadri.attr.service.AttrOrderService;
import com.nadri.attr.vo.AttrOrderForm;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;

@Controller
@RequestMapping("/attr")
public class AttrOrderController {

	@Autowired
	AttrOrderService attrOrderService;
	
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

		List<AttrOrderForm> optionInfo = new ArrayList<>();
		if(optNo!=null) {
			for(int i=0; i<optNo.size();i++) {
				int quantity = productQuantity.get(i);
				int optionNo = optNo.get(i);
				String optName = optionName.get(i);
				int optPrice = optionPrice.get(i);
				
				if(quantity!=0) {
					AttrOrderForm orderForm = new AttrOrderForm();
					orderForm.setProductQuantity(quantity);
					orderForm.setOptionNo(optionNo);
					orderForm.setOptionName(optName);
					orderForm.setOptionPrice(optPrice);
					optionInfo.add(orderForm);
				}
			}
			model.addAttribute("optionInfo",optionInfo);
		}
		
		AttrOrderForm orderInfo = new AttrOrderForm();
		orderInfo.setProductQuantity(productQuantity.get(0));
		orderInfo.setAttNo(attNo);
		orderInfo.setPrice(price);
		orderInfo.setAttPic(attPic);
		orderInfo.setAttName(attName);
		orderInfo.setAttDate(attDate);
		
		model.addAttribute("orderInfo",orderInfo);
			
		/*
		List<AttrOrderForm> orderInfo = new ArrayList<>();
		if(optNo!=null) {
			for(int i=0; i<optNo.size();i++) {
				int quantity = productQuantity.get(i);
				int optionNo = optNo.get(i);
				String optName = optionName.get(i);
				
				if(quantity!=0) {
					AttrOrderForm orderForm = new AttrOrderForm();
					orderForm.setAttNo(attNo);
					orderForm.setPrice(price);
					orderForm.setAttDate(attDate);
					orderForm.setAttName(attName);
					orderForm.setAttPic(attPic);
					orderForm.setProductQuantity(quantity);
					orderForm.setOptionNo(optionNo);
					orderForm.setOptionName(optName);
					orderInfo.add(orderForm);
				}
			}
		} else {
			int quantity = productQuantity.get(0);
			AttrOrderForm orderForm = new AttrOrderForm();
			orderForm.setProductQuantity(quantity);
			orderForm.setAttNo(attNo);
			orderForm.setPrice(price);
			orderForm.setAttPic(attPic);
			orderForm.setAttName(attName);
			orderForm.setAttDate(attDate);
			orderInfo.add(orderForm);
		}
		*/
		
		return "attr/orderform";
	}
	
	@GetMapping("/deposit.nadri")
	public String desposit() {
		return "attr/orderWaiting";
	}
	
	@GetMapping("/success.nadri")
	public String success() {
		return "attr/orderSuccess";
	}
	
	@RequestMapping("/kakao")
	@ResponseBody
	public String kakaopay() {
		try {
			// 보내는 부분
			URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) address.openConnection();
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK ecec992fac63f12189ad56fae9ba5211");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true);
			String parameter = "cid=TC0ONETIME" // 가맹점 코드
					+ "&partner_order_id=partner_order_id" // 가맹점 주문번호
					+ "&partner_user_id=partner_user_id" // 가맹점 회원 id
					+ "&item_name=1" // 상품명
					+ "&quantity=1" // 상품 수량
					+ "&total_amount=5000" // 총 금액
					+ "&vat_amount=200" // 부가세
					+ "&tax_free_amount=4800" // 상품 비과세 금액
					+ "&approval_url=http://localhost/" // 결제 성공 시
					+ "&fail_url=http://localhost/" // 결제 실패 시
					+ "&cancel_url=http://localhost/"; // 결제 취소 시
			OutputStream send = connection.getOutputStream(); // 이제 뭔가를 줄 수 있다.
			DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
			dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
			dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
			
			int result = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
			InputStream receive;
			
			if(result == 200) {
				receive = connection.getInputStream();
			}else {
				receive = connection.getErrorStream(); 
			}
			// 읽는 부분
			InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
			BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
			// 받는 부분
			// return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
}
