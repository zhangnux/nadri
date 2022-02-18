package com.nadri.attr.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.nadri.user.vo.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AttrOrder {

	/* 기본정보 */
	private int orderNo;
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date attDate;
	private Date orderDate;
	private int price;
	private int lastPrice;
	private int deposit;
	private String process;
	private int userNo;
	private String buyerName;
	private String buyerEmail;
	private String buyerTel;
	private int totalQuantity;
	private int attNo;
	private int couponNo;
	private String orderProcess;
	
	/* 상품정보 */
	private String attName;
	private String attPic;
	
	/* 구매정보(옵션관련) */
	private int productQuantity;
	private int optionNo;
	
	/* 옵션상세 */
	private String optionName;
	private int optionPrice;
	
	/* INSERT시 조인할 테이블(유저, 상품, 옵션) */
	private User userInfo;
	private Attraction attraction;
	private AttOption attOption;
	
	/* 예약내역 조회 */
	private List<Integer> optionsQuantity;
	private List<Integer> optionsNo;
	private List<String> optionsName;
	private List<Integer> optionsPrice;
	
}
