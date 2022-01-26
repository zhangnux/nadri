package com.nadri.user.model;

import lombok.Getter;
import lombok.Setter;
/**
 * 클라이언트에게 제공되는 JSON 응답메세지를 표현하는 클래스다.
 * @author Administrator
 *
 */
@Getter
@Setter
public class ResponseData {
	/**
	 * 요청 처리 성공/실패 여부
	 */
	private boolean success;
	
	/**
	 * 에러 메세지
	 */
	private String message;
}
