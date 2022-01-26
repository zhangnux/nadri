package com.nadri.manager.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.MethodParameter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import com.nadri.manager.annotation.LoginedManager;
import com.nadri.manager.exception.LoginErrorException;
import com.nadri.manager.util.SessionUtils;
import com.nadri.manager.vo.Manager;

/**
 * 관리자 페이지 들어갈 때 로그인 되어있는 사용자 인지 아닌지 판단하는 intercetor
 * @author song
 *
 */
public class ManagerLoginCheckInterceptor implements HandlerInterceptor {
	private static Logger log = LogManager.getLogger(ManagerLoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean hasLoginManager = false;
		HandlerMethod method = (HandlerMethod)handler;
		MethodParameter[] parameters = method.getMethodParameters();
		for (MethodParameter parameter : parameters) {
			if (parameter.hasMethodAnnotation(LoginedManager.class)) {
				hasLoginManager = true;
				break;
			}
		}
		// 요청핸들러 메소드의 매개변수에 LoginedManager가 부착되어 있는가? true/false
		log.info("어노테이션유무 :"+ hasLoginManager);
		
		// false면 true로 요청핸들러 메소드 실행
		if (!hasLoginManager) {
			return true;
		}
		
		// true면 로그인 되어 있는지 판단
		Manager manager = (Manager)SessionUtils.getAttribute("LOGIN_MANAGER");
		// 로그인 안되어 있으면 exception발생
		if (manager == null) {
			throw new LoginErrorException("관리자 권한이 없는 접근입니다.");
		}
		log.info("로그인되어 있는가? :"+ hasLoginManager);
		// 로그인 되어 있으면 요청핸들러 메소드 실행
		return true;
	}
}
