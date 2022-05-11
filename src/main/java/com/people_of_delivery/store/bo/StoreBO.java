package com.people_of_delivery.store.bo;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.people_of_delivery.common.FileManagerService;
import com.people_of_delivery.store.dao.StoreDAO;
import com.people_of_delivery.store.model.Menu;
import com.people_of_delivery.store.model.Store;

@Service
public class StoreBO {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private StoreDAO storeDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public boolean existStoreByname(String name) {
		return storeDAO.existStoreByname(name);
	}
	
	public boolean existStoreByRegistrationNumber(String registrationNumber) {
		return storeDAO.existStoreByRegistrationNumber(registrationNumber);
	}
	
	public boolean existStoreByPhoneNumber(String phoneNumber) {
		return storeDAO.existStoreByPhoneNumber(phoneNumber);
	}
	
	public Store getStoreById(int storeId) {
		return storeDAO.selectStoreById(storeId);
	}
	
	public List<Store> getStoreListByUserId(int userId) {
		return storeDAO.selectStoreListByUserId(userId);
	}
	
	public List<Store> getStoreListByCategory(String category) {
		return storeDAO.selectStoreListByCategory(category);
	}
	
	public List<Menu> getMenuListByStoreId(int storeId) {
		return storeDAO.selectMenuListByStoreId(storeId);
	}
	
	public int addStore(int userId, String name, String category, String registrationNumber,
			 String phoneNumber, Integer minimumPrice, String openTime, String closeTime,
			 String holiday, String deliveryArea, int deliveryCost, String facilities,
			 MultipartFile file) {
		
		String storeImagePath = null;
		if (file != null) {
			try {
				storeImagePath = fileManagerService.saveFile(userId, file);
			} catch (IOException e) {
				logger.error("[StoreBO addStore] 이미지 업로드 실패 userId:{}", userId);
			}
			
		}
		
		return storeDAO.insertStore(userId, name, category, registrationNumber, phoneNumber, minimumPrice, openTime, closeTime, holiday, deliveryArea, deliveryCost, facilities, storeImagePath);
	}
	
	public int createMenu(int userId, int storeId, List<Map<String, Object>> menuList,
			List<MultipartFile> fileList) {
		
		String menuImagePath = null;
		int result = 0;
		for (int i = 0; i < menuList.size() - 1; i++) {
			MultipartFile file = fileList.get(i);
			if (file != null) {
				try {
					menuImagePath = fileManagerService.saveFile(userId, file);
				} catch (IOException e) {
					logger.error("[StoreBO addStore] 이미지 업로드 실패 userId:{}", userId);
				}
			}
			
			String category = (String)menuList.get(i).get("category");
			String menuName = (String)menuList.get(i).get("menuName");
			int menuPrice = (int) Integer.parseInt((String) menuList.get(i).get("menuPrice"));
			String menuExplanation = (String)menuList.get(i).get("menuExplanation");
			result = storeDAO.createMenu(storeId, category, menuName, menuPrice, menuImagePath, menuExplanation);
		}
		return result;
	}
	
	public int updateStore(int userId, int storeId, Integer minimumPrice, String openTime, String closeTime,
			String holiday, String deliveryArea, int deliveryCost, String facilities,
			MultipartFile file) {
		Store store = getStoreById(storeId);
		String existingStoreImagePath = store.getStoreImagePath();
		
		if (existingStoreImagePath != null) {
			// 기존 이미지 삭제
			try {
				fileManagerService.deleteFile(store.getStoreImagePath());
			} catch (IOException e) {
				logger.error("[delete store] 이미지 삭제 실패. userId:{}", userId);
				return 0;
			}		
		} 
		
		String storeImagePath = null;
		if (file != null) {
			try {
				storeImagePath = fileManagerService.saveFile(userId, file);
			} catch (IOException e) {
				logger.error("[StoreBO addStore] 이미지 업로드 실패 userId:{}", userId);
			}
			
		}
		
		return storeDAO.updateStore(userId, storeId, minimumPrice, openTime, closeTime, holiday, deliveryArea, deliveryCost, facilities, storeImagePath);
	}
}
