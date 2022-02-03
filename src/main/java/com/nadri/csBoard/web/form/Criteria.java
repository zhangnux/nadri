package com.nadri.csBoard.web.form;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Setter
@Getter
@ToString
public class Criteria {

	private int userNo;
	private String opt;
	private String csType;
	private String value;
	private int beginIndex;
	private int endIndex;
	
}
