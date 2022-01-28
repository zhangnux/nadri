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
public class CsBoardReply {
	
	private int replayNo;			//댓글번호
	private String replayContent;		//댓글 내용
	private Date replayCreatedDate;		//댓글 날짜
	private CsBoard csBoard;		//게시판 CsBoard Fk boardNo

}
