package com.nadri.train.restExceptionHandler;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import com.nadri.train.exception.LoginException;
import com.nadri.train.exception.ReservationException;
import com.nadri.train.web.model.ResponseDto;

@RestControllerAdvice
public class RestExceptionHandlerControllerAdvice {
	@ExceptionHandler(LoginException.class)
	public ResponseDto<?> handleLoginException(LoginException e) {
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		return response;
	}
	@ExceptionHandler(ReservationException.class)
	public ResponseDto<?> handleReservationException(ReservationException e) {
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		return response;
	}
}
