package com.people_of_delivery.user;

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
}
