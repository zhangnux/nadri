package com.nadri.manager.exception;
/**
 * 관리자 로그인과 관련된 exception
 * @author song
 *
 */
public class LoginErrorException extends ManagerException {
	
	private static final long serialVersionUID = 1193806614966269198L;

	public LoginErrorException(String message) {
		super(message);
	}
}
