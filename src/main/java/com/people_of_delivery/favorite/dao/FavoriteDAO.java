package com.people_of_delivery.favorite.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("favoriteDAO")
public interface FavoriteDAO {
	public int selectLikeCountByStoreIdOrUserId(
			@Param("storeId") int storeId, 
			@Param("userId") Integer userId);
	
	public int selectLikeCountByStoreId(int storeId);
	
	public void insertLike(
			@Param("storeId") int storeId, 
			@Param("userId") int userId);
	
	public void deleteLikeByStoreIdUserId(
			@Param("storeId") int storeId, 
			@Param("userId") int userId);
	
	public void deleteLikeByStoreId(int storeId);
}
