package com.nadri.attr.vo;

import java.util.Date;

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
	private String photo;
	private Date date;
	private int attNo;
	private int userNo;
	

}
