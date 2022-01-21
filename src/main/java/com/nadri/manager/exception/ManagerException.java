package com.nadri.manager.exception;
/**
 * 매니저 사이트에서 발생하는 모든 exception의 부모
 * @author song
 *
 */
public class ManagerException extends RuntimeException {
	
	private static final long serialVersionUID = -217612028542218138L;

	public ManagerException(String message) {
		super(message);
	}
}
