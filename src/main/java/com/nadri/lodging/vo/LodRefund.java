package com.nadri.lodging.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class LodRefund {

	private LodPayment lodPayment;		// 결제번호
	private Date refundDate;			// 환불날짜
	private int refundPrice;			// 환불가격
	private int refundFees;				// 환불수수료
}
