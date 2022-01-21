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
public class LodReserve {

	private int reserveNo;						// 예약번호
	private Date reserveCheckIn;				// 룸 체크인 시간
	private Date reserveCheckOut;				// 룸 체크아웃 시간
	private int adultNo;						// 성인 인원
	private int childNo;						// 아이 인원
	private int totalNo;						// 총 인원
	private int extraPrice;						// 추가금액
	private int totalPrice;						// 총금액
	private Date reserveDate;					// 예약날짜
	private Date cancelDate;					// 예약취소날짜
	private int status;							// 예약상태
	private int availablePoint;					// 사용가능포인트
	private int savePoint;						// 보유포인트
	private int reserveName;					// 예약자대표
	private int roomNo;							// 룸번호
	private int userNo;							// 유저번호
	private boolean couponUsed;					// 쿠폰사용여부
}
