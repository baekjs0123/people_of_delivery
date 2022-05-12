package com.people_of_delivery.favorite;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.people_of_delivery.favorite.bo.FavoriteBO;

@RestController
public class FavoriteRestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	
	@RequestMapping("/favorite/{storeId}")
	public Map<String, Object> like(
			@PathVariable("storeId") int storeId,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			result.put("result", "error");
			logger.error("[좋아요] 로그인 세션이 없습니다.");
			return result;
		}
		
		favoriteBO.like(storeId, userId);
		result.put("result", "success");
		return result;
	}
}
