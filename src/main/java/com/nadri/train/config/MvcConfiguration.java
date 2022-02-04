package com.nadri.train.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.nadri.train.argumentResolver.LoginedUserArgumentResolver;
import com.nadri.train.interceptor.UserLoginCheckInterceptor;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
public class MvcConfiguration implements WebMvcConfigurer {

	@Autowired
	UserLoginCheckInterceptor userLoginCheckInterceptor;
	@Autowired
	LoginedUserArgumentResolver loginedUserArgumentResolver;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(userLoginCheckInterceptor).addPathPatterns("/api/train/**").addPathPatterns("/train/**");
		
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(loginedUserArgumentResolver);
	}
}
