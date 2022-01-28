package com.nadri.noticeBoard.vo;

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
public class NoticeBoard {
	
	
	private int no; 			//공지사항번호
	private String title;		//이름
	private String Content;		//내용
	private Date CreatedDate;		//작성일
	

}
