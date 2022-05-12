package com.people_of_delivery.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.people_of_delivery.common.FileManagerService;
import com.people_of_delivery.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	@Autowired
	private PermissionInterceptor interceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/download_images/**")  // http://localhost/images/baekjs0123_16205748673/sun.png  와 같이 접근 가능하게 매핑해준다.
		.addResourceLocations("file://" + FileManagerService.FILE_UPLOAD_PATH); // 실제 파일 저장 위치
		
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry
		.addInterceptor(interceptor)
		.addPathPatterns("/**")  // ** 아래 디렉토리까지 모두 확인
		.excludePathPatterns("/error", "/static/**", "/user/sign_out"); // 예외처리 (인터셉터 안타게)
	}
}
