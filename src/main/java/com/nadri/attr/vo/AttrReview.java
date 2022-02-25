package com.nadri.attr.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AttrReview {

	private int no;
	private int star;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date date;
	private int attNo;
	private int userNo;
	private List<String> pic;
	
	private String userId;
	
	private int cnt;
	private int avg;
	
	private int beginIndex;
	private int endIndex;

}
