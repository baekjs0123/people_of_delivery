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
	
	@RequestMapping("/create_store_view")
	public String createStoreView(Model model) {
		
		model.addAttribute("viewName", "store/create_store_view");
		
		return "template/layout";
	}
	
	@RequestMapping("/update_store_view")
	public String updateStoreView(Model model) {
		
		model.addAttribute("viewName", "store/update_store_view");
		
		return "template/layout";
	}
	
}
