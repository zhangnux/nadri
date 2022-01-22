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

	private int no;								// 예약번호
	private Date checkIn;						// 룸 체크인 시간
	private Date checkOut;						// 룸 체크아웃 시간
	private int adult;							// 성인 인원
	private int child;							// 아이 인원
	private int total;							// 총 인원
	private int extraPrice;						// 추가금액
	private int totalPrice;						// 총금액
	private Date reserveDate;					// 예약날짜
	private Date cancelDate;					// 예약취소날짜
	private int status;							// 예약상태
	private int availablePoint;					// 사용가능포인트
	private int savePoint;						// 보유포인트
	private int reserveName;					// 예약자대표
	private LodRoom lodRoom;					// 룸번호
	//private User user;						// 유저번호
	//private ;									// 쿠폰사용여부
}
