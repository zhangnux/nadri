package com.nadri.user.exception;
/**
 * 관리자 로그인과 관련된 exception
 * @author song
 *
 */
public class LoginErrorException extends UserException {
	
	private static final long serialVersionUID = -223431609178101056L;

	public LoginErrorException(String message) {
		super(message);
	}
}
