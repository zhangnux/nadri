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
	
	
	private int boardNo;			//번호
	private String boradTitle;		//이름
	// private User user;			//유저 User FK :userno
	private int password;			//비밀번호
	private int boradView;			//게시판 조회수
	private String boardContent;		//내용
	private Date boardCreatedDate;		//작성일
	private Date updateDate;		//수정일
	private Date deleteDate;		//삭제일
	
	
	

}
