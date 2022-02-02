package com.nadri.train.web.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 목록 페이지에서 좌석 정보 검색하기 위한 객체
 * @author song
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainRoomInfo {
	private String roomType;
	private int trainNo;
	private int schduleNo;
}
