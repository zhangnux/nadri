package com.nadri.manager.vo;

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
	
	
	private int boardNo; 			//공지사항번호
	private String boradTitle;		//이름
	private int password;			//비밀번호
	private int boradView;			//게시판 조회수
	private String boardContent;		//내용
	private Date boardCreatedDate;		//작성일
	

}
