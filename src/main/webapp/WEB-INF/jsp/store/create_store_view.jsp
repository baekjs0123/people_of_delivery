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
			<button type="button" class="btn btn-info">추가하기</button>
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
});
</script>