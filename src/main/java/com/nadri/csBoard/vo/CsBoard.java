package com.nadri.csBoard.vo;

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
public class CsBoard {
	
	
	private int no;			//번호
	private String title;		//제목
	private int userNo;
	private String userName;
	private String content;		//내용
	private Date createdDate;		//작성일
	private Date updateDate;		//수정일
	private Date deleteDate;		//삭제일
	private String replyCheck;
	private String csType;
	
	
	

}
