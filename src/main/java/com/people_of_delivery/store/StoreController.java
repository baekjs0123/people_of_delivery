package com.people_of_delivery.store;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/store")
@Controller
public class StoreController {

	@RequestMapping("/store_list_view")
	public String storeListView(Model model) {
		
		model.addAttribute("viewName", "store/store_list");
		
		return "template/layout";
	}
}
