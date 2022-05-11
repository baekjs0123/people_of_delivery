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
						<input type="text" class="selectDirect ml-2 form-control col-6 d-none">
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
	$(document).on('change', ".categorySelect",function() {
		//alert("카테고리 고르기");
		//직접입력을 누를 때 나타남
		if($(this).val() == "direct") {
	    	$(this).siblings().removeAttr('class', 'd-none');
	    } else {
	    	$(this).siblings().attr('class', 'd-none');
	    }
	});
	
	$(document).on('click', ".add-btn", function() {
		//alert("메뉴추가");
		$('.menu-box').append(
			'<div class="pl-5 pt-3 menu d-flex flex-wrap align-items-center">\
				<div class="pl-2 mb-3 d-flex align-items-center">\
					<span>메뉴 카테고리</span><span class="text-danger">*</span>\
					<div class="d-flex">\
						<select class="categorySelect" class="ml-2">\
							<option class="category" value="메인메뉴">메인메뉴</option>\
							<option class="category" value="사이드메뉴">사이드메뉴</option>\
							<option class="category" value="음료">음료</option>\
							<option class="category" value="주류">주류</option>\
							<option class="category" value="direct">직접입력</option>\
						</select>\
						<input type="text" class="selectDirect ml-2 form-control col-6 d-none">\
					</div>\
				</div>\
				<div class="pl-2 mb-3 d-flex align-items-center">\
					<span>메뉴명</span><span class="text-danger">*</span>\
					<input type="text" class="menuName form-control col-9 ml-2" placeholder="메뉴명을 입력해주세요">\
				</div>\
				<div class="pl-2 mb-3 d-flex align-items-center pr-2">\
					<span>메뉴가격</span><span class="text-danger">*</span>\
					<input type="text" class="menuPrice form-control col-8 ml-2" placeholder="ex) 6000">\
				</div>\
				<div class="mb-3 d-flex align-items-center w-50">\
					<span>메뉴사진</span>\
					<div class="file-upload d-flex w-75">\
						<input type="file" class="file d-none" accept=".gif, .jpg, .png, .jpeg">\
						<div class="fileName form-control col-8 ml-2"></div>\
						<button type="button" class="fileUploadBtn btn btn-primary ml-2">사진 업로드</button>\
					</div>\
				</div>\
				<div class="mb-3 d-flex align-items-center w-100">\
					<span>메뉴설명</span>\
					<textarea cols="50" rows="4" class="menuExplanation form-control col-9 ml-2"></textarea>\
				</div>\
				<div class="d-flex justify-content-end w-100">\
					<a href="#" type="button" class="add-btn"><img src="/images/addbtn_icon.png" alt="추가버튼" width="50px"></a>\
					<a href="#" type="button" class="delete-btn ml-3"><img src="/images/backspace_button.png" alt="삭제버튼" width="50px"></a>\
				</div>\
			</div>'
		);
	});
	
	$(document).on('click', '.delete-btn', function() {
		//alert("메뉴박스 삭제");
		$(this).parent().parent().remove();
	});
	
	$(document).on('click', '.fileUploadBtn', function(e) {
		e.preventDefault(); // 위로 올라가는 현상 방지
		$(this).siblings('.file').click(); // input file을 클릭한 것과 같은 효과
	});
	
	$(document).on('change', '.file', function(e) {
		//alert("체인지");
		let fileName = e.target.files[0].name;
		//alert(fileName);
		let fileArr = fileName.split(".")
		
		
		// 확장자 유효성 체크
		if (fileArr.length < 2 || 
				(fileArr[fileArr.length - 1].toLowerCase()) != "gif"
				&& (fileArr[fileArr.length - 1].toLowerCase()) != "png"
				&& (fileArr[fileArr.length - 1].toLowerCase()) != "jpeg"
				&& (fileArr[fileArr.length - 1].toLowerCase()) != "jpg") {
			alert("이미지 파일만 업로드 해주세요.");
			$(this).val(''); // 파일이 서버에 넘어가지 않도록 비워줌
			$(this).siblings('.fileName').text(''); // 파일명도 비워줌
			return;
		}
		
		$(this).siblings('.fileName').text(fileName);
	});
	
	$('#createBtn').on('click', function() {
		//alert("추가하기");
		var menuList = new Array();
		var fileInput = $('.file');
		console.log(fileInput);
		let formData = new FormData();
		
		for (let i = 0; i < fileInput.length; i++) {
			let obj = new Object();
			obj.category = $(".menu .categorySelect").eq(i).val().trim();
			obj.menuName = $(".menuName").eq(i).val().trim();
			obj.menuPrice = $(".menuPrice").eq(i).val().trim();
			console.log($('.file')[i].files[0]);
			formData.append('file', $('.file')[i].files[0]);
			if ($(".menuExplanation").eq(i).val().trim() != '') {
				obj.menuExplanation = $(".menuExplanation").eq(i).val().trim();
			} else {
				obj.menuExplanation = "";
			}
			
			if (obj.menuName == "") {
				alert("메뉴명을 입력해주세요.")
				return;
			}
			
			if (obj.menuPrice == "") {
				alert("메뉴가격을 입력해주세요.")
				return;
			}
			
			let check = /^[0-9]+$/;
			if (check.test(obj.menuPrice) === false) {
				alert("메뉴가격은 숫자만 입력 가능합니다.");
				return;
			}
			
			menuList.push(obj);
		}
		let storeId = $('#storeSelect').val();
		//alert(storeId);
		console.log(storeId);
		console.log(menuList);
		
		formData.append('menuList', new Blob([JSON.stringify(menuList)], {type : "application/json"}));
		formData.append("storeId", storeId);
		
		$.ajax({
			type:"post"
			, url:"/store/create_menu"
			, data: formData
			, enctype: "multipart/form-data" // 파일 업로드를 위한 필수 설정
			, processData: false // 파일 업로드를 위한 필수 설정
			, contentType: false // 파일 업로드를 위한 필수 설정
			, success: function(data) {
				if (data.result == "success") {
					alert("메뉴가 성공적으로 등록되었습니다.");
					location.href = "/main/boss/main_view";
				} else {
					alret(data.error_message);
				}
			}
			, error: function(e) {
				alert("메뉴 등록에 실패했습니다. 관리자에게 문의 해주세요.");
			}
		});
	});
});
</script>