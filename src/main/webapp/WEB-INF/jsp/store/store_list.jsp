<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="store-list mt-5">
	<h1 class="font-weight-bold">${category}</h1>
	<div class="store-list-box">
		<c:forEach items="${storeList}" var="store">
		<a href="/store/menu_list_view?storeId=${store.id}">
			<div class="store d-flex mb-4">
				<img src="${store.storeImagePath}" alt="${store.name}" width="300px" height="200px">
				<div class="store-info p-3">
					<h3 class="font-weight-bold">${store.name}</h3>
					<div class="d-flex align-items-center">
						<img src="/images/star.png" alt="별점" width="30px" height="30px">
						<h4 class="store-text ml-2 mr-2">4.5</h4>
						<h4>짜장면, 쟁반짜장...</h4>
					</div>
					<h5>최소주문 ${store.minimumPrice}원, 배달팁 ${store.deliveryCost}원</h5>
				</div>
			</div>
		</a>
		</c:forEach>
	</div>
</div>