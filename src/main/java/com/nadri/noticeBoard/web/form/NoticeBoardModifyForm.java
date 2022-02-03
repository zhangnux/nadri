package com.nadri.noticeBoard.web.form;

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
public class NoticeBoardModifyForm {

	private int no;
	private String title;		//이름
	private String content;		//내용

}
