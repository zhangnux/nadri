package com.nadri.train.util;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class RefundUtils {

	/**
	 * 열차 출발시간과 가격을 입력받아서 환불 수수료를 계산
	 * @param price 운임비
	 * @param standardDate 출발시간
	 * @return 환불시 발생하는 수수료(사용자가 내야하는 금액)
	 */
	public static long refundRate(long price, Date standardDate) {
		// 날짜가 빠를수록 더 크다
		// date의 요일비교 금 토 일에 해당하지 않으면?
		// now < standartDate - 1date 면 return 0;
		/**
		 * standartDate - 1date <= now < standartDate - 3hours return 0;
		 * standartDate - 3hours <= now < standartDate return price*0.05;
		 * 금토일 이라면
		 * now < standartDate - 1date 면 return 400;
		 * standartDate - 1date <= now < standartDate - 3hours return price*0.05;
		 * standartDate - 3hours <= now < standartDate return price*0.1;
		 * 
		 */
		// 현재 날짜와 시간
		LocalDateTime now = LocalDateTime.now();

		// 요일 계산 // Date -> LocalDateTime 으로 변경
		LocalDateTime standard = LocalDateTime.ofInstant(standardDate.toInstant(), ZoneId.systemDefault());

		// 1월 2화 3수 4목 5금 6토 7일
		int month = standard.getDayOfWeek().getValue();
		
		// 월 ~ 목이라면
		if (1 <= month && month <= 4) {
			// now > standartDate - 1date
			if (standard.minusHours(3).isAfter(now)) {
				return 0;
			} else if ((standard.minusHours(3).isBefore(now) || standard.minusHours(3).isEqual(now)) && standard.isAfter(now)) {
				return (int)(price*0.05);
			}
		} else {
			if (standard.minusDays(1).isAfter(now)) {
				return 400;
			} else if ((standard.minusDays(1).isBefore(now) || standard.minusDays(1).isEqual(now)) && standard.minusHours(3).isAfter(now)) {
				return (int)(price*0.05);
			} else if ((standard.minusHours(3).isBefore(now) || standard.minusHours(3).isEqual(now)) && standard.isAfter(now)) {
				return (int)(price*0.1);
			}
		}
		return -1;
	}
}
