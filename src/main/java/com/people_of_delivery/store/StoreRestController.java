package com.people_of_delivery.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.people_of_delivery.store.bo.StoreBO;

@RequestMapping("/store")
@RestController
public class StoreRestController {
	
	@Autowired
	private StoreBO storeBO;
	
	/**
	 * 가게명 중복확인
	 * @param name
	 * @return
	 */
	@RequestMapping("/is_duplicated_name")
	public Map<String, Boolean> isDuplicatedId(
			@RequestParam("name") String name) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", storeBO.existStoreByname(name));
		return result;
	}
	
	/**
	 * 사업자등록번호 중복확인
	 * @param registrationNumber
	 * @return
	 */
	@RequestMapping("/is_duplicated_rgNum")
	public Map<String, Boolean> isDuplicatedRgNum(
			@RequestParam("registrationNumber") String registrationNumber) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", storeBO.existStoreByRegistrationNumber(registrationNumber));
		return result;
	}
	
	/**
	 * 가게 전화번호 중복확인
	 * @param phoneNumber
	 * @return
	 */
	@RequestMapping("/is_duplicated_phoneNumber")
	public Map<String, Boolean> isDuplicatedPhoneNumber(
			@RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", storeBO.existStoreByPhoneNumber(phoneNumber));
		return result;
	}
	
	/**
	 * 가게 생성하기
	 * @param name
	 * @param category
	 * @param registrationNumber
	 * @param phoneNumber
	 * @param minimumPrice
	 * @param openTime
	 * @param closeTime
	 * @param holiday
	 * @param deliveryArea
	 * @param deliveryCost
	 * @param facilities
	 * @param file
	 * @param session
	 * @return
	 */
	@PostMapping("/create_store")
	public Map<String, Object> createStore(
			@RequestParam("name") String name,
			@RequestParam("category") String category,
			@RequestParam("registrationNumber") String registrationNumber,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam(value = "minimumPrice", required = false) Integer minimumPrice,
			@RequestParam("openTime") String openTime,
			@RequestParam("closeTime") String closeTime,
			@RequestParam("holiday") String holiday,
			@RequestParam("deliveryArea") String deliveryArea,
			@RequestParam("deliveryCost") int deliveryCost,
			@RequestParam(value = "facilities", required = false) String facilities,
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int row = storeBO.addStore(userId, name, category, registrationNumber, phoneNumber, minimumPrice, openTime, closeTime, holiday, deliveryArea, deliveryCost, facilities, file);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		if (row < 1) {
			result.put("result", "error");
			result.put("error_message", "매장등록에 실패했습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
	
	/**
	 * 가게 수정하기
	 * @param storeId
	 * @param minimumPrice
	 * @param openTime
	 * @param closeTime
	 * @param holiday
	 * @param deliveryArea
	 * @param deliveryCost
	 * @param facilities
	 * @param file
	 * @param session
	 * @return
	 */
	@PostMapping("/update_store")
	public Map<String, Object> updateStore(
			@RequestParam("storeId") int storeId,
			@RequestParam(value = "minimumPrice", required = false) Integer minimumPrice,
			@RequestParam("openTime") String openTime,
			@RequestParam("closeTime") String closeTime,
			@RequestParam("holiday") String holiday,
			@RequestParam("deliveryArea") String deliveryArea,
			@RequestParam("deliveryCost") int deliveryCost,
			@RequestParam(value = "facilities", required = false) String facilities,
			@RequestParam("file") MultipartFile file,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		int row = storeBO.updateStore(userId, storeId, minimumPrice, openTime, closeTime, holiday, deliveryArea, deliveryCost, facilities, file);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		if (row < 1) {
			result.put("result", "error");
			result.put("error_message", "매장수정에 실패했습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
	
	@PostMapping("/create_menu")
	public Map<String, Object> createMenu(
			@RequestPart("menuList") List<Map<String, Object>> menuList,
			@RequestPart(value = "file",  required = false) List<MultipartFile> fileList,
			@RequestParam("storeId") int storeId,
			HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		
		int row = storeBO.createMenu(userId, storeId, menuList, fileList);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
	
		if (row < 1) {
			result.put("result", "error"); 
			result.put("error_message", "메뉴추가에 실패했습니다. 다시 시도해주세요."); 
		}
		
		
		return result;
	}
	
	
}
