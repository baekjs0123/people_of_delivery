package com.people_of_delivery.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MainController {

	@RequestMapping("/user/main_view")
	public String userMainView(Model model) {
		model.addAttribute("viewName", "main/user/main");
		
		return "template/layout";
	}
}
