package com.nadri.train.exception;

/**
 * 로그인 되어있지 않을 경우 발생하는 예외
 * @author song
 *
 */
public class LoginException extends TrainException {
	
	private static final long serialVersionUID = 2214127697716616227L;

	public LoginException(String message) {
		super(message);
	}
}
