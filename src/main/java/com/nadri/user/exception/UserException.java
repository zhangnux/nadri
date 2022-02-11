package com.nadri.user.exception;

/**
 * 유저 사이트의 exception 부모클래스
 * @author Administrator
 *
 */
public class UserException extends RuntimeException {
	
	private static final long serialVersionUID = 2169500156758094935L;
	
	public UserException(String message) {
		super(message);
	}
}