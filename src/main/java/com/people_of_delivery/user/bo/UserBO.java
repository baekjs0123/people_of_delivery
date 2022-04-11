package com.people_of_delivery.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.people_of_delivery.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public boolean existUserByLoginId(String loginId) {
		return userDAO.existUserByLoginId(loginId);
	}
}
