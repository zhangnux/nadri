package com.nadri.train.exceptionHandler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nadri.train.exception.LoginException;
import com.nadri.train.exception.ReservationException;
import com.nadri.train.web.model.ResponseDto;

@ControllerAdvice
public class ExceptionHandlerControllerAdvice {
	
	@ExceptionHandler(LoginException.class)
	public String handleLoginException(LoginException e) {
		return "/user/login.nadri";
	}
	
}
