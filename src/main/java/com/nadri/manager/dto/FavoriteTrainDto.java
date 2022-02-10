package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FavoriteTrainDto {
	private int rowNum;
	private String departureStation;
	private String arrivalStation;
	private int routNo;
	private int count;
	private String image;
}
