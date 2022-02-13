package com.nadri.train.kakaoPay;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.nadri.train.web.model.TrainPaymentDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayService {
	
	/**
	 * 카카오 결제 준비창 요청
	 * @param dto
	 * @param merchadise
	 * @param id
	 * @return
	 */
	public ReadyResponse payReady(TrainPaymentDto dto, String merchadise, String id) {
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", dto.getReservationNo());
		parameters.add("partner_user_id", id);
		parameters.add("item_name", merchadise);
		parameters.add("quantity", String.valueOf(dto.getTotalCount()));
		parameters.add("total_amount", String.valueOf(dto.getTotalPrice()));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost/train/kakaoPayment.nadri");
		parameters.add("cancel_url", "http://localhost/train/reservationList.nadri");
		parameters.add("fail_url", "http://localhost/train/failPayment.nadri");
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		log.info("결재준비 응답객체: " + readyResponse);
		
		return readyResponse;
	}
	
	/**
	 * 카카오 결제 승인 요청
	 * @param tid
	 * @param pgToken
	 * @return
	 */
	public ApproveResponse payApprove(String tid, String pgToken, String id, String orderId) {
		System.out.println("토큰" + pgToken);
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", orderId);
		parameters.add("partner_user_id", id);
		parameters.add("pg_token", pgToken);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		
		log.info("결재승인 응답객체: " + approveResponse);
		
		return approveResponse;
	}
	
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 5fa0f0222e9a68676ec86330e233e3e7");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
}
