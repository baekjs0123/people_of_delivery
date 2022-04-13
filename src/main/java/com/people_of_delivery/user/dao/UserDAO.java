package com.people_of_delivery.user.dao;

import org.apache.ibatis.annotations.Param;

import com.people_of_delivery.user.model.User;

public interface UserDAO {

	public boolean existUserByLoginId(String loginId);
	
	public User selectUserByLoginId(String loginId);
	
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("salt") String salt,
			@Param("name") String name,
			@Param("nickName") String nickName,
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email);
	
	public int insertBossUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("salt") String salt,
			@Param("name") String name,
			@Param("nickName") String nickName,
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email);
}
