package com.nadri.manager.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserCriteria {
	private String keyword;
	private String option;
	private String deleted;
	private String email;
	private String sms;
}
