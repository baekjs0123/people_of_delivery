package com.people_of_delivery.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.people_of_delivery.common.EncryptUtils;
import com.people_of_delivery.user.bo.UserBO;
import com.people_of_delivery.user.model.User;

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
	
	/**
	 * 사용자 회원가입
	 * @param loginId
	 * @param password
	 * @param name
	 * @param nickName
	 * @param phoneNumber
	 * @param email
	 * @return
	 */
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
		
		int row = userBO.addUser(loginId, encryptPassword, salt, name, nickName, phoneNumber, email);
		if (row < 1) {
			result.put("result", "error");
		} else {
			result.put("error_message", "회원가입에 실패했습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
	
	/**
	 * 사장님 회원가입
	 * @param loginId
	 * @param password
	 * @param name
	 * @param nickName
	 * @param phoneNumber
	 * @param email
	 * @return
	 */
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
		
		int row = userBO.addBossUser(loginId, encryptPassword, salt, name, nickName, phoneNumber, email);
		if (row < 1) {
			result.put("result", "error");
		} else {
			result.put("error_message", "회원가입에 실패했습니다. 다시 시도해주세요.");
		}
		
		return result;
	}
	
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, Object> userSignIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		// password 해싱
		String salt = userBO.getUserByLoginId(loginId).getSalt();
		String encryptPassword = EncryptUtils.SHA512(password, salt);
		
		// DB login, 해싱된 password select
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		User userPwCheck = userBO.getUserByLoginId(loginId);
		Map<String, Object> result = new HashMap<>();
		
		// 결과가 있으면 로그인 처리
		if (user != null) {
			// 타입 확인 후 각각의 메인 페이지로 보내기
			if (user.getType().equals("user")) {
				result.put("result", "user");
			} else if (user.getType().equals("boss")) {
				result.put("result", "boss");
			}
			
			// 세션에 로그인 정보 저장(로그인 상태를 유지)
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userNickName", user.getNickName());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userType", user.getType());
		} else if (userPwCheck != null && userPwCheck.getPassword() != encryptPassword) {
			// DB의 패스워드와 불일치 할 때
			result.put("result", "error");
			result.put("error_message", "잘못된 비밀번호입니다.");
		} else {
			// 결과가 없으면 에러 처리
			result.put("result", "error");
			result.put("error_message", "존재하지 않는 아이디입니다.");
		}
		
		return result;
	}
	
	
	@PostMapping("/password_check")
	public Map<String, Object> passwordCheck(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		Map<String, Object> result = new HashMap<>();
		
		if (loginId.equals("")) {
			result.put("result", "error");
			result.put("error_message", "로그인 여부를 확인하세요.");
		}
		// password 해싱
		String salt = userBO.getUserByLoginId(loginId).getSalt();
		String encryptPassword = EncryptUtils.SHA512(password, salt);
		
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptPassword);
		
		if (user != null) {
			// 비밀번호가 일치하는 유저가 있을 시 수정하는 페이지로 이동
			result.put("result", "success");
		} else {
			result.put("result", "error");
			result.put("error_message", "비밀번호를 확인하세요.");
		}
		
		return result;
	 }
	
	@PutMapping("/update_user_information")
	public Map<String, Object> updateUser(
			@RequestParam("name") String name,
			@RequestParam("nickName") String nickName,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("email") String email,
			HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		int row = userBO.updateUserByuserId(userId, name, nickName, phoneNumber, email);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("error_message", "정보 변경에 실패했습니다.");
		}
		
		return result;
	}
	 
}
