package com.people_of_delivery.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.people_of_delivery.store.model.Menu;
import com.people_of_delivery.store.model.Store;

@Repository
public interface StoreDAO {

	public boolean existStoreByname(String name);
	
	public boolean existStoreByRegistrationNumber(String registrationNumber);
	
	public boolean existStoreByPhoneNumber(String phoneNumber);
	
	public Store selectStoreById(int storeId);
	
	public List<Store> selectStoreListByUserId(int userId);
	
	public List<Store> selectStoreListByCategory(String category);
	
	public List<Menu> selectMenuListByStoreId(int storeId);
	
	public int insertStore(
			@Param("userId") int userId,
			@Param("name") String name,
			@Param("category") String category,
			@Param("registrationNumber") String registrationNumber,
			@Param("phoneNumber") String phoneNumber,
			@Param("minimumPrice") Integer minimumPrice,
			@Param("openTime") String openTime,
			@Param("closeTime") String closeTime,
			@Param("holiday") String holiday,
			@Param("deliveryArea") String deliveryArea,
			@Param("deliveryCost") int deliveryCost,
			@Param("facilities") String facilities,
			@Param("storeImagePath") String storeImagePath);
	
	public int createMenu(
			@Param("storeId") int storeId,
			@Param("category") String category,
			@Param("name") String menuName,
			@Param("price") int menuPrice,
			@Param("imagePath") String menuImagePath,
			@Param("explanation") String menuExplanation);
	
	public int updateStore(
			@Param("userId") int userId,
			@Param("storeId") int storeId,
			@Param("minimumPrice") Integer minimumPrice,
			@Param("openTime") String openTime,
			@Param("closeTime") String closeTime,
			@Param("holiday") String holiday,
			@Param("deliveryArea") String deliveryArea,
			@Param("deliveryCost") int deliveryCost,
			@Param("facilities") String facilities,
			@Param("storeImagePath") String storeImagePath);
}
