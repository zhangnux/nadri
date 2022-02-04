package com.nadri.user.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;

@Component
public class LoginCheckInterceptor implements HandlerInterceptor{

	private static Logger logger = LogManager.getLogger(LoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("prehandle() 메소드가 실행됨");
		
		User user =(User) SessionUtils.getAttribute("LOGIN_USER");
		if (user == null) {
			
			request.setAttribute("error", "로그인 후 사용 가능한 서비스 입니다.");
			request.getRequestDispatcher("/WEB-INF/jsp/loginForm").forward(request, response);
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("postHandle() 메소드가 실행됨");
		
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		logger.info("afterCompletion() 메소드가 실행됨");
		
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
