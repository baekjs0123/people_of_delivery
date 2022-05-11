package com.people_of_delivery.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.people_of_delivery.store.bo.StoreBO;
import com.people_of_delivery.store.bo.StoreViewBO;
import com.people_of_delivery.store.model.Store;
import com.people_of_delivery.store.model.StoreView;

@RequestMapping("/store")
@Controller
public class StoreController {

	@Autowired
	StoreBO storeBO;
	
	@Autowired
	StoreViewBO storeViewBO;
	
	@RequestMapping("/store_list_view")
	public String storeListView(Model model,
			@RequestParam("category") String category) {
		
		List<Store> storeList = storeBO.getStoreListByCategory(category);
		model.addAttribute("viewName", "store/store_list");
		model.addAttribute("category", category);
		model.addAttribute("storeList", storeList);
		
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
	
	@RequestMapping("/menu_list_view")
	public String menuListView(
			@RequestParam("storeId") int storeId,
			Model model,
			HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		
		StoreView storeView = storeViewBO.generateStoreView(storeId, userId);
		
		model.addAttribute("viewName", "store/menu_list");
		model.addAttribute("storeView", storeView);
		
		return "template/layout";
	}
}
