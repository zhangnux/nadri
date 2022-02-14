package com.nadri.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.nadri.manager.interceptor.ManagerLoginCheckInterceptor;
import com.nadri.train.interceptor.UserLoginCheckInterceptor;
import com.nadri.user.argumentResolrver.LoginedUserArgumentResolver;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
	
	@Autowired
	ManagerLoginCheckInterceptor managerLoginCheckInterceptor;
	
	@Autowired
	UserLoginCheckInterceptor userLoginCheckInterceptor;
	
	@Autowired
	LoginedUserArgumentResolver loginedUserArgumentResolver;
	
	// 질문
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(managerLoginCheckInterceptor).addPathPatterns("/admin/**").addPathPatterns("/rest/admin/**");
		registry.addInterceptor(userLoginCheckInterceptor).addPathPatterns("/api/train/**").addPathPatterns("/train/**");
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(loginedUserArgumentResolver);
	}
}
