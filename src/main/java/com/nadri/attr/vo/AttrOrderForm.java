package com.nadri.attr.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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

	private int attNo;
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date attDate;
	private int userNo;
	private int optionNo;
	private int productQuantity;
	private int totalQuantity;
	private int couponNo;
	private int lastPrice;
	private String buyerName;
	private String buyerEmail;
	private String buyerTel;
	
}
