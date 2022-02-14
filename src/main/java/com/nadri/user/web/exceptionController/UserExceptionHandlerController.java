package com.nadri.user.web.exceptionController;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.nadri.user.exception.DeleteErrorException;
import com.nadri.user.exception.JoinErrorException;
import com.nadri.user.exception.LoginErrorException;
import com.nadri.user.exception.ModifyErrorException;
import com.nadri.user.exception.PasswordErrorException;
import com.nadri.user.exception.UserException;

@ControllerAdvice
public class UserExceptionHandlerController {

	@ExceptionHandler(DeleteErrorException.class)
	public String handleDeleteErrorException(DeleteErrorException e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return  "/user/deleteForm";
	}
	
	@ExceptionHandler(LoginErrorException.class)
	public String handleLoginErrorException(LoginErrorException e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "/user/loginForm";
	}
	
	@ExceptionHandler(ModifyErrorException.class)
	public String handleModifyErrorException(ModifyErrorException e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "/user/modifyForm";
	}
	
	@ExceptionHandler(JoinErrorException.class)
	public String handleJoinErrorException(JoinErrorException e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "/user/joinForm";
	}
	
	@ExceptionHandler(PasswordErrorException.class)
	public String handlePasswordErrorException(PasswordErrorException e, Model model) {
		model.addAttribute("error", e.getMessage());
		
		return "/user/passwordCheckForm";
	}
	
	
	
	@ExceptionHandler(UserException.class)
	public String handleException(Exception e) {
		return "/home.nadri";
	}
}
