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
		<div class="menu-box mt-3">
			<div class="pl-5 pt-3 menu d-flex flex-wrap align-items-center">
				<div class="pl-2 mb-3 d-flex align-items-center">
					<span>메뉴 카테고리</span><span class="text-danger">*</span>
					<div class="d-flex">
						<select class="categorySelect" class="ml-2">
							<option class="category" value="메인메뉴">메인메뉴</option>
							<option class="category" value="사이드메뉴">사이드메뉴</option>
							<option class="category" value="음료">음료</option>
							<option class="category" value="주류">주류</option>
							<option class="category" value="direct">직접입력</option>
						</select>
						<input type="text" class="selectDirect ml-2 form-control col-6">
					</div>
				</div>
				<div class="pl-2 mb-3 d-flex align-items-center">
					<span>메뉴명</span><span class="text-danger">*</span>
					<input type="text" class="menuName form-control col-9 ml-2" placeholder="메뉴명을 입력해주세요">
				</div>
				<div class="pl-2 mb-3 d-flex align-items-center pr-2">
					<span>메뉴가격</span><span class="text-danger">*</span>
					<input type="text" class="menuPrice form-control col-8 ml-2" placeholder="ex) 6000">
				</div>
				<div class="mb-3 d-flex align-items-center w-50">
					<span>메뉴사진</span>
					<div class="file-upload d-flex w-75">
						<input type="file" class="file d-none" accept=".gif, .jpg, .png, .jpeg">
						<div class="fileName form-control col-8 ml-2"></div>
						<button type="button" class="fileUploadBtn btn btn-primary ml-2">사진 업로드</button>
					</div>
				</div>
				<div class="mb-3 d-flex align-items-center w-100">
					<span>메뉴설명</span>
					<textarea cols="50" rows="4" class="menuExplanation form-control col-9 ml-2"></textarea>
				</div>
				<div class="d-flex justify-content-end w-100">
					<a href="#" type="button" class="add-btn"><img src="/images/addbtn_icon.png" alt="추가버튼" width="50px"></a>
					<a href="#" type="button" class="delete-btn ml-3"><img src="/images/backspace_button.png" alt="삭제버튼" width="50px"></a>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-center pt-3 pb-3">
			<button type="button" id="createBtn" class="btn btn-info">추가하기</button>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$(".selectDirect").hide();
	$(".categorySelect").change(function() {
		//alert("카테고리 고르기");
		//직접입력을 누를 때 나타남
		if($(".categorySelect").val() == "direct") {
	    	$(".selectDirect").show();
	    } else {
	    	$(".selectDirect").hide();
	    }
	});
	
	$(".add-btn").on('click', function() {
		//alert("메뉴추가");
		$('.menu-box').append(
			'<div class="pl-5 pt-3 menu d-flex flex-wrap align-items-center">
				<div class="pl-2 mb-3 d-flex align-items-center">
					<span>메뉴 카테고리</span><span class="text-danger">*</span>
					<div class="d-flex">
						<select class="categorySelect" class="ml-2">
							<option class="category" value="메인메뉴">메인메뉴</option>
							<option class="category" value="사이드메뉴">사이드메뉴</option>
							<option class="category" value="음료">음료</option>
							<option class="category" value="주류">주류</option>
							<option class="category" value="direct">직접입력</option>
						</select>
						<input type="text" class="selectDirect ml-2 form-control col-6">
					</div>
				</div>
				<div class="pl-2 mb-3 d-flex align-items-center">
					<span>메뉴명</span><span class="text-danger">*</span>
					<input type="text" class="menuName form-control col-9 ml-2" placeholder="메뉴명을 입력해주세요">
				</div>
				<div class="pl-2 mb-3 d-flex align-items-center pr-2">
					<span>메뉴가격</span><span class="text-danger">*</span>
					<input type="text" class="menuPrice form-control col-8 ml-2" placeholder="ex) 6000">
				</div>
				<div class="mb-3 d-flex align-items-center w-50">
					<span>메뉴사진</span>
					<div class="file-upload d-flex w-75">
						<input type="file" class="file d-none" accept=".gif, .jpg, .png, .jpeg">
						<div class="fileName form-control col-8 ml-2"></div>
						<button type="button" class="fileUploadBtn btn btn-primary ml-2">사진 업로드</button>
					</div>
				</div>
				<div class="mb-3 d-flex align-items-center w-100">
					<span>메뉴설명</span>
					<textarea cols="50" rows="4" class="menuExplanation form-control col-9 ml-2"></textarea>
				</div>
				<div class="d-flex justify-content-end w-100">
					<a href="#" type="button" class="add-btn"><img src="/images/addbtn_icon.png" alt="추가버튼" width="50px"></a>
					<a href="#" type="button" class="delete-btn ml-3"><img src="/images/backspace_button.png" alt="삭제버튼" width="50px"></a>
				</div>
			</div>
		</div>'
		);
	});
});
</script>