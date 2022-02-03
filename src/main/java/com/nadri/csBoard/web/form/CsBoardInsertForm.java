package com.nadri.csBoard.web.form;

import java.util.Date;

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
public class CsBoardInsertForm {
	
	private int no;			//번호
	private String title;		//제목
	private int userNo;
	private String content;		//내용
	private Date createdDate;		//작성일
	private String csType;
}
