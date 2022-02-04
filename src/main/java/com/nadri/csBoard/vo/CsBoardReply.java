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
	
	private int no;			//게시글 번호
	private String replyContent;		//댓글 내용
	private Date replyCreatedDate;		//댓글 날짜
	

}
