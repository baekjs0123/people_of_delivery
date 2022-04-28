<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<div class="create-store mt-5">
	<h1>내 가게 수정하기</h1>
	<div class="create-store-box">
		<div class="pl-5 pt-3">
			<span>가게 선택</span>
			<select id="storeSelect">
			<c:forEach items="${storeList}" var="store">
				<option id="storeId" value="${store.id}">${store.name}</option>
			</c:forEach>
			</select>
		</div>
		<div class="pl-5 pt-3">
			<span>최소 주문금액</span><input type="text" id="minimumPrice" class="form-control col-10" placeholder="금액을 입력해주세요.">
		</div>
		<div class="pl-5 pt-3">
			<span>오픈시간</span><span class="text-danger">*</span><input type="time" id="openTime" class="form-control col-10">
		</div>
		<div class="pl-5 pt-3">
			<span>마감시간</span><span class="text-danger">*</span><input type="time" id="closeTime" class="form-control col-10">
		</div>
		<div class="pl-5 pt-3">
			<span>휴무일</span><span class="text-danger">*</span><input type="text" id="holiday" class="form-control col-10">
		</div>
		<div class="pl-5 pt-3">
			<span>배달지역</span><span class="text-danger">*</span><input type="text" id="deliveryArea" class="form-control col-10" placeholder="ex) 3KM or 미사1동, 망월동">
		</div>
		<div class="pl-5 pt-3">
			<span>배달비</span><span class="text-danger">*</span><input type="text" id="deliveryCost" class="form-control col-10" placeholder="ex) 3000">
		</div>
		<div class="pl-5 pt-3">
			<span>편의시설</span><input type="text" id="facilities" class="form-control col-10">
		</div>
		<div class="pl-5 pt-3">
			<span>매장대표사진</span><span class="text-danger">*</span>
			<div class="file-upload d-flex">
				<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<div id="fileName" class="form-control col-10"></div>
				<button type="button" id="fileUploadBtn" class="btn btn-primary ml-2">사진 업로드</button>
			</div>
		</div>
		<div class="d-flex justify-content-center pt-3 pb-3">
			<button type="button" id="updateBtn" class="btn btn-info">수정하기</button>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	$('#storeSelect').on('change', function() {
		//alert("가게 선택");
		let storeId = $('#storeSelect').val();
		//alert(storeId);
		
		$.ajax({
			type:"get"
			, url:"/store/update_store_view"
			, data: {"storeId" : storeId}
		});
	});
	
	// 파일 업로드 이미지 버튼 클릭 => 파일 선택 창이 떠야함
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault(); // 위로 올라가는 현상 방지
		$('#file').click(); // input file을 클릭한 것과 같은 효과
	});
	
	// 사용자가 파일 업로드를 했을 때 유효성 확인 및 업로드 된 파일 이름 노출
	$('#file').on('change', function(e) {
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
			$('#fileName').text(''); // 파일명도 비워줌
			return;
		}
		
		$('#fileName').text(fileName);
	});
	
	$('#updateBtn').on('click', function() {
		//alert("수정하기");
		let storeId = $('#storeSelect').val();
		
		let openTime = $('#openTime').val().trim();
		if (openTime == '') {
			alert("오픈 시간을 입력하세요.");
			return;
		}
		
		let closeTime = $('#closeTime').val().trim();
		if (closeTime == '') {
			alert("마감 시간을 입력하세요.");
			return;
		}
		
		let holiday = $('#holiday').val().trim();
		if (holiday == '') {
			alert("휴무일을 입력하세요.");
			return;
		}
		
		let deliveryArea = $('#deliveryArea').val().trim();
		if (deliveryArea == '') {
			alert("배달지역을 입력하세요.");
			return;
		}
		
		let deliveryCost = $('#deliveryCost').val().trim();
		if (deliveryCost == '') {
			alert("배달비를 입력하세요.");
			return;
		}
		
		let file = $('#file').val();
		if (file == '') {
			alert("매장대표사진을 첨부하세요.");
			return;
		}
		
		let minimumPrice = $('#minimumPrice').val().trim();
		let facilities = $('#facilities').val().trim();
		
		let check = /^[0-9]+$/;
		if (check.test(minimumPrice) === false || check.test(deliveryCost) === false) {
			alert("최소주문금액과 배달비는 숫자만 입력 가능합니다.");
			return;
		}

		let formData = new FormData();
		if (minimumPrice != "") {
			formData.append("minimumPrice", minimumPrice);
		}
		formData.append("storeId", storeId);
		formData.append("openTime", openTime);
		formData.append("closeTime", closeTime);
		formData.append("holiday", holiday);
		formData.append("deliveryArea", deliveryArea);
		formData.append("deliveryCost", deliveryCost);
		if (facilities != "") {
			formData.append("facilities", facilities);
		}
		formData.append("file", $("#file")[0].files[0]);
		
		$.ajax({
			type:"post"
			, url:"/store/update_store"
			, data: formData
			, enctype: "multipart/form-data" // 파일 업로드를 위한 필수 설정
			, processData: false // 파일 업로드를 위한 필수 설정
			, contentType: false // 파일 업로드를 위한 필수 설정
			, success: function(data) {
				if (data.result == "success") {
					alert("매장이 성공적으로 수정되었습니다.");
					location.href = "/main/boss/main_view";
				} else {
					alret(data.error_message);
				}
			}
			, error: function(e) {
				alert("매장 등록에 실패했습니다. 관리자에게 문의 해주세요.");
			}
		});
	});
});
</script>