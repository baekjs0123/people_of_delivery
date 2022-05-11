package com.people_of_delivery.store.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.people_of_delivery.favorite.bo.FavoriteBO;
import com.people_of_delivery.store.model.Menu;
import com.people_of_delivery.store.model.Store;
import com.people_of_delivery.store.model.StoreView;

@Service
public class StoreViewBO {

	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	
	public StoreView generateStoreView(int storeId, Integer userId) {
		
		StoreView storeView = new StoreView();
		Store store = storeBO.getStoreById(storeId);
			
		// 가게 정보
		storeView.setStore(store);
			
		// 메뉴 리스트
		List<Menu> menuList = storeBO.getMenuListByStoreId(storeId);
		storeView.setMenuList(menuList);
			
		// 찜하기
		storeView.setFilledLike(favoriteBO.existLike(storeId, userId));
			
		// 찜 갯수
		storeView.setCount(favoriteBO.getLikeCountByStoreId(storeId));
			
		return storeView;
	}
}
