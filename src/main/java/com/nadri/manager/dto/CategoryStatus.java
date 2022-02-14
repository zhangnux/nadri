package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryStatus {
	private int finish;
	private int reservaion;
	private int cancel;
	
	public int getTotal() {
		return finish+reservaion;
	}
}
