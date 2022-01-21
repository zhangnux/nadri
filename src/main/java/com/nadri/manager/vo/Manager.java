package com.nadri.manager.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Manager {
	private int no;
	private String id;
	private String password;
	// 사용시 Y  사용안할시 N
	private String isChecked;
}
