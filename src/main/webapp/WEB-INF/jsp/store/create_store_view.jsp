<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="create-store mt-5">
	<h1>내 가게 추가하기</h1>
	<div class="create-store-box">
		<div class="pl-5 pt-3">
			<span>매장명</span><span class="text-danger">*</span>
			<div class="d-flex">
				<input type="text" id="name" class="form-control col-10" placeholder="가게명을 입력해주세요.">
				<button type="button" id="checkNameDuplicateBtn" class="btn btn-success ml-3">중복확인</button>
			</div>
			<small id="nameCheckDuplicated" class="d-none text-danger">이미 존재하는 매장명입니다.</small>
			<small id="nameCheckOk" class="d-none text-success">사용가능한 매장명입니다.</small>
		</div>
		<div class="pl-5 pt-3">
			<span>업종카테고리</span><span class="text-danger">*</span>
			<select id="category" class="form-control col-10">
				<option>선택</option>
				<option value="일식">일식</option>
				<option value="중식">중식</option>
				<option value="한식">한식</option>
				<option value="양식">양식</option>
				<option value="치킨">치킨</option>
				<option value="피자">피자</option>
				<option value="족발, 보쌈">족발, 보쌈</option>
				<option value="아시안">아시안</option>
				<option value="패스트푸드">패스트푸드</option>
				<option value="야식">야식</option>
			</select>
		</div>
		<div class="pl-5 pt-3">
			<span>사업자등록번호</span><span class="text-danger">*</span>
			<div class="d-flex">
				<input type="text" id="registrationNumber" class="form-control col-10" placeholder="-을 빼고 입력해주세요.">
				<button type="button" id="checkRgNumDuplicateBtn" class="btn btn-success ml-3">중복확인</button>
			</div>
			<small id="rgNumCheckDuplicated" class="d-none text-danger">이미 존재하는 사업자등록번호입니다.</small>
			<small id="rgNumCheckOk" class="d-none text-success">사용가능한 사업자등록번호입니다.</small>
		</div>
		<div class="pl-5 pt-3">
			<span>매장 전화번호</span><span class="text-danger">*</span>
			<div class="d-flex">
				<input type="text" id="phoneNumber" class="form-control col-10" placeholder="-을 빼고 입력해주세요.">
				<button type="button" id="checkPhNumDuplicateBtn" class="btn btn-success ml-3">중복확인</button>
			</div>
			<small id="phNumCheckDuplicated" class="d-none text-danger">이미 존재하는 전화번호입니다.</small>
			<small id="phNumCheckOk" class="d-none text-success">사용가능한 전화번호입니다.</small>
		</div>
		<div class="pl-5 pt-3">
			<span>최소 주문금액</span><input type="text" id="minimumPrice" class="form-control col-10" placeholder="금액을 입력해주세요. ex) 8000">
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
			<button type="button" id="addBtn" class="btn btn-info">추가하기</button>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
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
	
	$('#checkNameDuplicateBtn').on('click', function() {
		//alert("매장명 중복확인");
		let name = $('#name').val().trim();
		
		// 경고 문구 초기화
		$('#nameCheckDuplicated').addClass('d-none');
		$('#nameCheckOk').addClass('d-none');
		
		if (name.length < 1) {
			alert("매장명은 최소 1글자 이상 입력해주세요.");
			return;
		}
		
		$.ajax({
			url: "/store/is_duplicated_name",
			data: {"name" : name},
			success: function(data) {
				if (data.result) { // 중복인 경우
					$('#nameCheckDuplicated').removeClass('d-none');
				} else { // 사용가능
					$('#nameCheckOk').removeClass('d-none');
				}
			},
			error : function(error) {
				alert("매장명 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	$('#checkRgNumDuplicateBtn').on('click', function() {
		//alert("사업자등록번호 중복확인");
		let registrationNumber = $('#registrationNumber').val().trim();
		
		// 경고 문구 초기화
		$('#rgNumCheckDuplicated').addClass('d-none');
		$('#rgNumCheckOk').addClass('d-none');
		
		if (registrationNumber.length != 10) {
			alert("사업자등록번호 10자리를 다시 입력해주세요.");
			return;
		}
		
		let reg= /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;

		if (reg.test(registrationNumber) === false) {
			alert('사업자등록번호는 10자리이며 숫자만 입력가능합니다. 다시 입력해주세요.');
			return false;
		}
		
		$.ajax({
			url: "/store/is_duplicated_rgNum",
			data: {"registrationNumber" : registrationNumber},
			success: function(data) {
				if (data.result) { // 중복인 경우
					$('#rgNumCheckDuplicated').removeClass('d-none');
				} else { // 사용가능
					$('#rgNumCheckOk').removeClass('d-none');
				}
			},
			error : function(error) {
				alert("매장명 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	$('#checkPhNumDuplicateBtn').on('click', function() {
		//alert("사업자등록번호 중복확인");
		let phoneNumber = $('#phoneNumber').val().trim();
		
		// 경고 문구 초기화
		$('#phNumCheckDuplicated').addClass('d-none');
		$('#phNumCheckOk').addClass('d-none');
		
		let regPhone = /^(0[2-8][0-5]?)-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/;

		if (regPhone.test(phoneNumber) === false) {
			alert('잘못된 번호입니다. 전화번호를 다시 입력해주세요.');
			return false;
		}
		
		$.ajax({
			url: "/store/is_duplicated_phoneNumber",
			data: {"phoneNumber" : phoneNumber},
			success: function(data) {
				if (data.result) { // 중복인 경우
					$('#phNumCheckDuplicated').removeClass('d-none');
				} else { // 사용가능
					$('#phNumCheckOk').removeClass('d-none');
				}
			},
			error : function(error) {
				alert("매장명 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	$('#addBtn').on('click', function() {
		//alert("추가하기");
		let name = $('#name').val().trim();
		if (name == '') {
			alert("매장명을 입력하세요.");
			return;
		}
		
		let category = $('#category').val().trim();
		if (category == '') {
			alert("업종카테고리를 입력하세요.");
			return;
		}
		
		let registrationNumber = $('#registrationNumber').val().trim();
		if (registrationNumber == '') {
			alert("사업자등록번호를 입력하세요.");
			return;
		}
		
		let phoneNumber = $('#phoneNumber').val().trim();
		if (phoneNumber == '') {
			alert("매장 전화번호를 입력하세요.");
			return;
		}
		
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
		
		if ($('#nameCheckOk').hasClass('d-none')) {
			alert("매장명 중복확인을 해주세요.");
			return;
		}
		
		if ($('#rgNumCheckOk').hasClass('d-none')) {
			alert("사업자등록번호 중복확인을 해주세요.");
			return;
		}
		
		if ($('#phNumCheckOk').hasClass('d-none')) {
			alert("매장전화번호 중복확인을 해주세요.");
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
		formData.append("name", name);
		formData.append("category", category);
		formData.append("registrationNumber", registrationNumber);
		formData.append("phoneNumber", phoneNumber);
		if (minimumPrice != "") {
			formData.append("minimumPrice", minimumPrice);
		}
		formData.append("openTime", openTime);
		formData.append("closeTime", closeTime);
		formData.append("holiday", holiday);
		formData.append("deliveryArea", deliveryArea);
		formData.append("deliveryCost", deliveryCost);
		if (facilities != "") {
			formData.append("facilities", facilities);
		}
		formData.append("file", $("#file")[0].files[0]);
		
		for (let key of formData.keys()) {
			console.log(key, ":", formData.get(key));
		}
		
		$.ajax({
			type:"post"
			, url:"/store/create_store"
			, data: formData
			, enctype: "multipart/form-data" // 파일 업로드를 위한 필수 설정
			, processData: false // 파일 업로드를 위한 필수 설정
			, contentType: false // 파일 업로드를 위한 필수 설정
			, success: function(data) {
				if (data.result == "success") {
					alert("매장이 성공적으로 등록되었습니다.");
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