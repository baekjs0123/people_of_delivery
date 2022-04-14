package com.people_of_delivery.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/sign_up_select_view")
	public String userSignUpSelectView(Model model) {
		model.addAttribute("viewName", "/user/sign_up_select");
		
		return "template/layout";
	}
	
	@RequestMapping("/user/sign_up_view")
	public String userSignUpView(Model model) {
		model.addAttribute("viewName", "/user/user_sign_up");
		return "template/layout";
	}
	
	@RequestMapping("/boss/sign_up_view")
	public String bossSignUpView(Model model) {
		model.addAttribute("viewName", "/user/boss_sign_up");
		return "template/layout";
	}
	
	@RequestMapping("/sign_in_view")
	public String userSignInView(Model model) {
		model.addAttribute("viewName", "/user/sign_in");
		return "template/layout";
	}
	
	@RequestMapping("/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 로그아웃 할 때 세션에 있는 모든 것들을 비운다.
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userNickName");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userType");
		
		return "redirect:/main/user/main_view";
	}
	
	@RequestMapping("/mypage_view")
	public String userMypageView(Model model) {
		model.addAttribute("viewName", "/user/mypage");
		return "template/layout";
	}
	
	@RequestMapping("/update_user_information_view")
	public String updateUserInformationView(Model model) {
		model.addAttribute("viewName", "/user/update_user_information");
		return "template/layout";
	}
}
