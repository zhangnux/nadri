package com.nadri.user.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;

@ControllerAdvice
public class ExceptionHandler {

	@org.springframework.web.bind.annotation.ExceptionHandler
	public String handleException(Exception e) {
		return "error/serverError";
	}
}
