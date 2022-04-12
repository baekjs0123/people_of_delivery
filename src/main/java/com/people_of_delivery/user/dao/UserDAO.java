package com.people_of_delivery.user.dao;

import org.apache.ibatis.annotations.Param;

public interface UserDAO {

	public boolean existUserByLoginId(String loginId);
	
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("nickName") String nickName,
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email);
	
	public int insertBossUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("nickName") String nickName,
			@Param("phoneNumber") String phoneNumber,
			@Param("email") String email);
}
