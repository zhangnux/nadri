package com.nadri.attr.vo;

import java.util.Date;

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
public class AttrOrderForm {

	private int attNo;
	private Date date;
	private int optionNo;
	private int productQuantity;
	private int totalQuantity;
	private int couponNo;
	private int lastPrice;
	private String name;
	private String email;
	private String tel;
	
}
