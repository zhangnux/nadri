package com.nadri.train.web.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TrainRoomInfo {
	private String roomType;
	private int trainNo;
	private int schduleNo;
}
