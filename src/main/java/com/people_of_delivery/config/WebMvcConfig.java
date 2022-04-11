package com.people_of_delivery.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.people_of_delivery.interceptor.PermissionInterceptor;

public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry
		.addInterceptor(interceptor)
		.addPathPatterns("/**")  // ** 아래 디렉토리까지 모두 확인
		.excludePathPatterns("/error", "/static/**", "/user/sign_out"); // 예외처리 (인터셉터 안타게)
	}
}
