package com.people_of_delivery.store.model;

import java.util.List;

// 하나의 가게에 관련된 모든 정보를 의미
public class StoreView {
	// 가게 하나
	private Store store;
	// 메뉴 리스트
	private List<Menu> menuList;
	// 찜 수
	private int count;
	// 로그인 된 사용자가 찜 눌렀는지 여부
	private boolean filledLike;
	
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	}
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public boolean isFilledLike() {
		return filledLike;
	}
	public void setFilledLike(boolean filledLike) {
		this.filledLike = filledLike;
	}
}
