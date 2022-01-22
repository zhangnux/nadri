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
public class LodPayment {

	private int no;						// 결제번호
	private Date paymentDate;			// 결제날짜
	private LodReserve lodReserve;		// 예약날짜
}

