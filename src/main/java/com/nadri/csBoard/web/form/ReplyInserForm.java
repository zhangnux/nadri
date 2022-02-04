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
public class ReplyInserForm {
	
	private int boardNo;
	private String replyContent;
	private String replyCheck;
	

}
