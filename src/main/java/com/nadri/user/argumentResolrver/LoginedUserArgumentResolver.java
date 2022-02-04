package com.nadri.user.argumentResolrver;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.nadri.user.annotation.LoginedUser;
import com.nadri.user.util.SessionUtils;

@Component
public class LoginedUserArgumentResolver implements HandlerMethodArgumentResolver {

	static final Logger logger = LogManager.getLogger(LoginedUserArgumentResolver.class);
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		
		logger.info("@LoginedUser 어노테이션을 가지고 있나?" + parameter.hasParameterAnnotation(LoginedUser.class));
		logger.info("매개변수의 클래스 이름: " + parameter.getParameterType().getName());
		logger.info("매개변수의 이름: " + parameter.getParameterName());
		
		return parameter.hasParameterAnnotation(LoginedUser.class);
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		logger.info("@LoginedUser가 부착된 매개변수, HttpSession객체에 저장된 인증된 사용자정보를 매개변수로 전달함");
		// HttpSession 객체에 "LOGIN_USER" 속성명으로 저장된 사용자정보 반환
		return SessionUtils.getAttribute("LOGIN_USER");
	}
	
}
