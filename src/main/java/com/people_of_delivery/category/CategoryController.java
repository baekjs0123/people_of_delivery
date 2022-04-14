package com.people_of_delivery.category;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/category")
@Controller
public class CategoryController {

	@RequestMapping("/delivery_view")
	public String deliveryView(Model model) {
		model.addAttribute("viewName", "category/delivery_view");
		
		return "template/layout";
	}
	
	@RequestMapping("/packing_view")
	public String packingView(Model model) {
		model.addAttribute("viewName", "category/packing_view");
		
		return "template/layout";
	}
}
