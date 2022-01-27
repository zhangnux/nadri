package com.nadri.restaurant.web.form;

import java.util.Date;

import com.nadri.user.vo.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
@ToString
public class ReservationForm {
	
	
	
	private User user;
	private String reservedName;		// 예약자 이름
	private int usedPoint;
	private int deposit;
	private Date reservedDate;
	private int child;
	private int adult;
	
	

}
