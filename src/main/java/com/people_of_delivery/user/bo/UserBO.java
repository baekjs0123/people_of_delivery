package com.people_of_delivery.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.people_of_delivery.user.dao.UserDAO;
import com.people_of_delivery.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public boolean existUserByLoginId(String loginId) {
		return userDAO.existUserByLoginId(loginId);
	}
	
	public User getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}
	public User getUserByLoginIdAndPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, password);
	}
	
	public int addUser(String loginId, String password, String salt, String name, String nickName,
			String phoneNumber, String email) {
		return userDAO.insertUser(loginId, password, salt, name, nickName, phoneNumber, email);
	}
	
	public int addBossUser(String loginId, String password, String salt, String name, String nickName,
			String phoneNumber, String email) {
		return userDAO.insertBossUser(loginId, password, salt, name, nickName, phoneNumber, email);
	}
	
	public int updateUserByuserId(int userId, String name, String nickName, String phoneNumber,
			String email) {
		return userDAO.updateUserByuserId(userId, name, nickName, phoneNumber, email);
	}
}
