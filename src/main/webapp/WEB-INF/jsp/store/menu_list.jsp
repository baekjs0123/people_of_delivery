<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="store-menu-list mt-5">
	<nav class="top-menu">
		<ul class="nav nav-fill">
			<li class="nav-item"><a href="#" class="nav-link">메뉴</a></li>
			<li class="nav-item"><a href="#" class="nav-link">정보</a></li>
			<li class="nav-item"><a href="#" class="nav-link">리뷰</a></li>
		</ul>
	</nav>
	
	<div class="store-menu">
		<div class="d-flex mt-5">
			<h1>${storeView.store.name}</h1>
			<%-- 찜 --%>
			<div class="card-like m-3">
				<a href="#" id="like-btn" data-store-id="${storeView.store.id}" data-user-id="${userId}">
					<%-- 찜 해제 상태 --%>
					<c:if test="${storeView.filledLike eq false}">
						<img src="/images/empty-heart-icon.png" alt="빈 하트" width="20px">
					</c:if>
					<%-- 찜 상태 --%>
					<c:if test="${storeView.filledLike eq true}">
						<img src="/images/red-heart-icon.png" alt="하트" width="20px">
					</c:if>
				</a>
				<a href="#" class="text-dark">찜 ${storeView.count}개</a>
			</div>
		</div>
		<div class="menu-box">
			<h3>메인메뉴</h3>
			<c:forEach items="${storeView.menuList}" var="menu">
			<c:if test="${menu.category eq '메인메뉴'}">
				<div>
					<img src="${menu.imagePath}" alt="메뉴 사진">
					<div>
						<h4>${menu.name}</h4>
						<span>${menu.explanation}</span><br>
						<span>${menu.price}</span>
					</div>
				</div>
			</c:if>
			</c:forEach>
			<h3>사이드메뉴</h3>
			<c:forEach items="${storeView.menuList}" var="menu">
				<c:if test="${menu.category eq '사이드메뉴'}">
				<c:if test="${empty menu}">
					<h1>사이드 메뉴 없음</h1>
				</c:if>
				<div>
					<img src="${menu.imagePath}" alt="메뉴 사진">
					<div>
						<h4>${menu.name}</h4>
						<span>${menu.explanation}</span><br>
						<span>${menu.price}</span>
					</div>
				</div>
				</c:if>
			</c:forEach>
		</div>
		
		
	</div>
</div>
<script>
$(document).ready(function() {
	// 좋아요 버튼 클릭
	$('#like-btn').on('click', function(e) {
		e.preventDefault();
		
		var storeId = $(this).data('store-id');
		var userId = $(this).data('user-id'); // 로그인 여부 확인 용

		console.log(storeId);
		console.log(userId);
		
		if (userId == '') {
			alert('로그인 후에 이용 가능합니다');
			return; 
		}
		
		$.ajax({
			type:'POST',
			url:'/favorite/' + storeId,
			data: {"storeId":storeId}, // userId는 서버의 세션에서 가져올 것이다. 
			success: function(data) {
				if (data.result == 'success') {
					location.reload(); // 새로고침
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				var errorMsg = jqXHR.responseJSON.status;
				alert(errorMsg + ":" + textStatus);
			}
		});
	});
});
</script>