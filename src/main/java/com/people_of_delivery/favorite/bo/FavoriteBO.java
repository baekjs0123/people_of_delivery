package com.people_of_delivery.favorite.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.people_of_delivery.favorite.dao.FavoriteDAO;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public void like(int storeId, int userId) {
		boolean existLike = existLike(storeId, userId);
		if (existLike) {
			favoriteDAO.deleteLikeByStoreIdUserId(storeId, userId);;
		} else {
			favoriteDAO.insertLike(storeId, userId);
		}
	}
	
	public boolean existLike(int storeId, Integer userId) {
		// 비로그인 상태면 세팅된 좋아요는 없다.
		if (userId == null) {
			return false;
		}
		int count = favoriteDAO.selectLikeCountByStoreIdOrUserId(storeId, userId);
		if (count > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public int getLikeCountByStoreId(int storeId) {
		return favoriteDAO.selectLikeCountByStoreId(storeId);
	}
	
	public void deleteLikeByStoreIdUserId(int storeId, int userId) {
		favoriteDAO.deleteLikeByStoreIdUserId(storeId, userId);
	}
	
	public void deleteLikeByPostId(int storeId) {
		favoriteDAO.deleteLikeByStoreId(storeId);
	}
}
