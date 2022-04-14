<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<div class="gnb">
	<div class="d-flex justify-content-center pt-4">
		<c:if test="${userType == 'user' || empty userType}">
		<a href="/main/user/main_view">
			<div class="logo d-flex justify-content-center align-items-center">
				<h1>배달의 민족</h1>
			</div>
		</a>
		</c:if>
		<c:if test="${userType == 'boss'}">
		<a href="/main/boss/main_view">
			<div class="logo d-flex justify-content-center align-items-center">
				<h1>배달의 민족</h1>
			</div>
		</a>
		</c:if>
	</div>
	<div class="login-info d-flex justify-content-end">
		<c:if test="${not empty userName}">
		<span>${userNickName}님</span>
		<div class="ml-2 mr-2">
			<a href="/user/sign_out" class="font-weight-bold">로그아웃</a>
		</div>
		<div class="ml-5 mr-2">
			<a href="/user/mypage_view" class="font-weight-bold">마이페이지</a>
		</div>
		</c:if>
		<c:if test="${empty userName}">
		<div>
			<a href="/user/sign_in_view" class="font-weight-bold">로그인</a>
		</div>
		<div class="ml-5 mr-2">
			<a href="/user/sign_up_select_view" class="font-weight-bold">회원가입</a>
		</div>
		</c:if>
	</div>
</div>
