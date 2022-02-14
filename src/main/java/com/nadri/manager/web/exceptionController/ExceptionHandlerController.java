package com.nadri.manager.web.exceptionController;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.nadri.manager.exception.LoginErrorException;

@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(LoginErrorException.class)
	public String handlerLoginErrorException(LoginErrorException e) {
		return "/admin";
	}
	
	// error페이지 만들면 사용
//	@ExceptionHandler(ManagerException.class)
//	public String handlerManagerException(ManagerException e) {
//		return null;
//	}
//	
//	@ExceptionHandler(DataAccessException.class)
//	public String handlerSQLException(DataAccessException e) {
//		return null;
//	}
//	
//	@ExceptionHandler(Exception.class)
//	public String handlerException(Exception e) {
//		return null;
//	}
}
