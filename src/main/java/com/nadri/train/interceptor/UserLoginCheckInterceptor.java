package com.nadri.train.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.nadri.train.exception.LoginException;
import com.nadri.train.util.SessionUtils;
import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.vo.User;

@Component
public class UserLoginCheckInterceptor implements HandlerInterceptor {
	private static Logger log = LogManager.getLogger(UserLoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("요청URI : " + request.getRequestURI());
		boolean hasLoginUser = false;
		HandlerMethod method = (HandlerMethod)handler;
		MethodParameter[] parameters = method.getMethodParameters();
		for (MethodParameter parameter : parameters) {
			if (parameter.hasParameterAnnotation(LoginedUser.class)) {
				hasLoginUser = true;
				break;
			}
		}
		// 요청핸들러 메소드의 매개변수에 LoginedManager가 부착되어 있는가? true/false
		log.info("어노테이션유무 :"+ hasLoginUser);
		
		// false면 true로 요청핸들러 메소드 실행
		if (!hasLoginUser) {
			return true;
		}
		
		// true면 로그인 되어 있는지 판단
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		// 로그인 안되어 있으면 exception발생
		if (user == null) {
			if (request.getRequestURI().startsWith("/api")) {
				throw new LoginException("로그인이 필요한 서비스 입니다.");
			} else  {
				response.sendRedirect("/user/login.nadri");
				return false;
			}
		}
		log.info("로그인되어 있는가? :"+ user.getNo());
		log.info("로그인되어 있는가? :"+ hasLoginUser);
		// 로그인 되어 있으면 요청핸들러 메소드 실행
		return true;
	}
}
