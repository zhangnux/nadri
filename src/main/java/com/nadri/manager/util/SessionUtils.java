package com.nadri.manager.util;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * HttpSession객체에 속성을 저장, 조회, 삭제하는 기능을 제공하는 유틸클래스 
 * @author song
 *
 */
public class SessionUtils {
	
	/**
	 * 속성명, 객체를 전달받아서 HttpSession객체에 저장한다.
	 * @param name 속성명
	 * @param value 객체
	 */
	public static void addAttribute(String name, Object value) {
		/* 
		 * RequestContextHolder
		 *  	+spring에서 제공하는 유틸클래스
		 *  	+요청객체와 세션객체의 속성에 접근할 수 있는 기능을 제공한다.
		 * 		+.getRequestAttributes()는 RequestAttributes객체를 반환한다.
		 * 		+RequestAttributes가 제공하는 주요 API
		 * 			setAttribute(name, value, scope)
		 * 			removeAttribute(name, scope)
		 * 			getAttribute(name, scope)
		 * 		 메소드를 활용하면 요청객체 혹은 세션객체에 속성을 추가, 삭제, 조회할 수 있다.
		 * 		+메소드의 scope 자리에 RequestAttributes.SCOPE_REQUEST, RequestAttributes.SCOPE_SESSION를 지정해서
		 *  	 요청객체/세션객체를 구분해서 속성을 관리할 수 있다.
		 *  다양한 객체의 속성정보를 조작 할 수 있다.
		 * 
		 */
		RequestContextHolder.getRequestAttributes().setAttribute(name, value, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * 속성명을 전달받아서 HttpSession객체에 해당 속성명으로 저장된 속성(객체)을 삭제한다.
	 * @param name 삭제할 속성의 이름
	 */
	public static void removeAttribute(String name) {
		RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
		
	}
	
	/**
	 * 속성명을 전달받아서 HttpSession객체에 해당 속성명으로 저장된 속성(객체)을 반환한다.
	 * @param name 조회할 속성명
	 * @return HttpSession객체에 저장된 속성
	 */
	public static Object getAttribute(String name) {
		return RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	}
	
}
