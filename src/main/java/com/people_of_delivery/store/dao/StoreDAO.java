package com.people_of_delivery.store.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StoreDAO {

	public boolean existStoreByname(String name);
	
	public boolean existStoreByRegistrationNumber(String registrationNumber);
	
	public boolean existStoreByPhoneNumber(String phoneNumber);
	
	public int insertStore(
			@Param("userId") int userId,
			@Param("name") String name,
			@Param("category") String category,
			@Param("registrationNumber") String registrationNumber,
			@Param("phoneNumber") String phoneNumber,
			@Param("minimumPrice") Integer minimumPrice,
			@Param("openTime") Date openTime,
			@Param("closeTime") Date closeTime,
			@Param("holiday") String holiday,
			@Param("deliveryArea") String deliveryArea,
			@Param("deliveryCost") int deliveryCost,
			@Param("facilities") String facilities,
			@Param("storeImagePath") String storeImagePath);
}
