package com.people_of_delivery.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.people_of_delivery.store.bo.StoreBO;
import com.people_of_delivery.store.model.Store;

@RequestMapping("/store")
@Controller
public class StoreController {

	@Autowired
	StoreBO storeBO;
	
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
	public String updateStoreView(Model model,
			@RequestParam(value= "storeId", required= false) Integer storeId,
			HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		
		Store store= null;
		if(storeId != null) {
			store = storeBO.getStoreById(storeId);
		}
		model.addAttribute("store", store);
		
		List<Store> storeList = storeBO.getStoreListByUserId(userId);
		model.addAttribute("viewName", "store/update_store_view");
		model.addAttribute("storeList", storeList);
		
		return "template/layout";
	}
	
	@RequestMapping("/create_menu_view")
	public String createMenuView(
			@RequestParam(value= "storeId", required= false) Integer storeId,
			HttpSession session,
			Model model) {
		Integer userId = (Integer) session.getAttribute("userId");
		
		List<Store> storeList = storeBO.getStoreListByUserId(userId);
		model.addAttribute("viewName", "store/create_menu_view");
		model.addAttribute("storeList", storeList);
		
		return "template/layout";
	}
}
