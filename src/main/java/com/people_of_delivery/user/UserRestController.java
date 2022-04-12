package com.people_of_delivery.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.people_of_delivery.common.EncryptUtils;
import com.people_of_delivery.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	/**
	 * 아이디 중복확인
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Boolean> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("result", userBO.existUserByLoginId(loginId));
		return result;
	}
	
	@PostMapping("/user_sign_up")
	public Map<String, Object> userSignUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("nickName") String nickName,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email
			) {
		// password hashing
		String salt = EncryptUtils.Salt();
		String encryptPassword = EncryptUtils.SHA512(password, salt);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		int row = userBO.addUser(loginId, encryptPassword, name, nickName, phoneNumber, email);
		if (row < 1) {
			result.put("result", "error");
		} else {
			result.put("error_message", "회원가입에 실패했습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
	
	@PostMapping("/boss_sign_up")
	public Map<String, Object> bossSignUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("nickName") String nickName,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email
			) {
		// password hashing
		String salt = EncryptUtils.Salt();
		String encryptPassword = EncryptUtils.SHA512(password, salt);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		int row = userBO.addBossUser(loginId, encryptPassword, name, nickName, phoneNumber, email);
		if (row < 1) {
			result.put("result", "error");
		} else {
			result.put("error_message", "회원가입에 실패했습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
}
