package com.people_of_delivery.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MainController {

	@RequestMapping("/user/main_view")
	public String userMainView(Model model,
			HttpSession session) {
		model.addAttribute("viewName", "main/user/main");
		
		String userType = (String) session.getAttribute("userType");
		model.addAttribute("userType", userType);
		
		return "template/layout";
	}
	
	@RequestMapping("/boss/main_view")
	public String bossMainView(Model model,
			HttpSession session) {
		model.addAttribute("viewName", "main/boss/main");
		
		String userType = (String) session.getAttribute("userType");
		model.addAttribute("userType", userType);
		
		return "template/layout";
	}
}
