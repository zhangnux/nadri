package com.nadri.attr.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class AttrOrderForm {

	/* 기본정보 */
	private int orderNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date attDate;
	private int price;
	private int lastPrice;
	private int deposit;
	private int process;
	private int userNo;
	private String tel;
	
	/* 상품정보 */
	private String attName;
	private String attPic;
	
	/* 구매정보(쿠폰적용여부, 구매수량, 옵션관련) */
	private int attNo;
	private String couponNo;
	private int productQuantity;
	private int optionNo;
	private String optionName;
	private int optionPrice;
	
	/* 구매자정보 */
	private String email;
	private String name;
	
	/* INSERT시 조인할 테이블(유저, 상품, 옵션) */
	private User userInfo;
	private Attraction attraction;
	private AttOption attOption;
	
}
