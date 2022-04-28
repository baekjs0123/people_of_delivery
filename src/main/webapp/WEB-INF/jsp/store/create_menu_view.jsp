<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<div class="create-menu mt-5">
	<h1>메뉴 추가하기</h1>
	<div class="create-menu-box">
		<div class="pl-5 pt-3">
			<span>가게 선택</span>
			<select id="storeSelect">
			<c:forEach items="${storeList}" var="store">
				<option id="storeId" value="${store.id}">${store.name}</option>
			</c:forEach>
			</select>
		</div>
		<div class="pl-5 pt-3 menu-box d-flex flex-wrap align-items-center">
			<div class="pl-2 mb-3 d-flex align-items-center">
				<span>메뉴 카테고리</span><span class="text-danger">*</span>
				<div class="d-flex">
					<select id="categorySelect" class="ml-2">
						<option class="category" value="메인메뉴">메인메뉴</option>
						<option class="category" value="사이드메뉴">사이드메뉴</option>
						<option class="category" value="음료">음료</option>
						<option class="category" value="주류">주류</option>
						<option class="category" value="direct">직접입력</option>
					</select>
					<input type="text" id="selectDirect" class=" ml-2 form-control col-6">
				</div>
			</div>
			<div class="pl-2 mb-3 d-flex align-items-center">
				<span>메뉴명</span><span class="text-danger">*</span>
				<input type="text" id="menuName" class="form-control col-9 ml-2" placeholder="메뉴명을 입력해주세요">
			</div>
			<div class="pl-2 mb-3 d-flex align-items-center pr-2">
				<span>메뉴가격</span><span class="text-danger">*</span>
				<input type="text" id="menuPrice" class="form-control col-8 ml-2" placeholder="ex) 6000">
			</div>
			<div class="mb-3 d-flex align-items-center w-50">
				<span>메뉴사진</span>
				<div class="file-upload d-flex w-75">
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					<div id="fileName" class="form-control col-8 ml-2"></div>
					<button type="button" id="fileUploadBtn" class="btn btn-primary ml-2">사진 업로드</button>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center pt-3 pb-3">
			<button type="button" id="addBtn" class="btn btn-info">추가하기</button>
		</div>
	</div>
</div>