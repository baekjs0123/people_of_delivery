<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mypage p-5">
	<a href="#" class="update-inform-btn" data-toggle="modal" data-target="#updateInformModal" data-user-login-id="${userLoginId}">
		<h1 class="mt-3">내 정보 수정하기</h1>
	</a>
	<h2 class="mt-5">내가 찜한 가게</h2>
	<div class="favorite-store-list">
		<a href="#">
			<div class="store-box">
				<img src="/images/chinese_restaurant.jpg" alt="가게이름" width="200px" height="200px">
				<div class="d-flex align-items-center justify-content-between">
					<span>왕손짜장</span>
					<div class="d-flex align-items-center">
						<img src="/images/star.png" alt="별점" width="30px" height="30px">
						<span class="ml-2">4.5</span>
					</div>
				</div>
			</div>
		</a>
	</div>
	<h2 class="mt-5">최근에 주문한 가게</h2>
	<div class="latest-store-list">
		<a href="#">
			<div class="store-box">
				<img src="/images/chinese_restaurant.jpg" alt="가게이름" width="200px" height="200px">
				<div class="d-flex align-items-center justify-content-between">
					<span>왕손짜장</span>
					<div class="d-flex align-items-center">
						<img src="/images/star.png" alt="별점" width="30px" height="30px">
						<span class="ml-2">4.5</span>
					</div>
				</div>
			</div>
		</a>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="updateInformModal">
	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
		<div class="modal-content p-3">
			<h3 class="font-weight-bold">비밀번호 확인</h3>
			<div class="p-3">
				<span class="mt-3">회원 확인을 위해 비밀번호를 입력해주십시오.</span>
				<div class="mt-3">
					<span>비밀번호</span> <input type="password" id="password" name="password" class="form-control col-9">
				</div>
				<div class="d-flex justify-content-center mt-3">
					<div class="mr-3">
						<button type="button" id="updateBtn" class="buttons btn btn-primary">수정하기</button>
					</div>
					<div>
						<button type="button" class="buttons btn btn-secondary" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$('.update-inform-btn').on('click', function() {
		let loginId = $(this).data('user-login-id');
		
		$('#updateInformModal').data('user-login-id', loginId);
	});
	
	$('#updateInformModal #updateBtn').on('click', function(e) {
		e.preventDefault();
		//alert("업데이트 하기");

		let loginId = $('#updateInformModal').data('user-login-id');
		//alert(loginId);
		if (loginId == "") {
			alert("로그인되어 있지 않습니다. 로그인 해주세요.");
			return;
		}
		
		let password = $('#password').val().trim();
		if (password == '') {
			alert("비밀번호를 입력하세요.");
			return;
		}
		
		$.ajax({
			type: "post",
			url: "/user/password_check",
			data: {
				"loginId" : loginId,
				"password" : password
				},
			success: function(data) {
				if (data.result == "success") {
					location.href = "/user/update_user_information_view";
				} else {
					alert(data.error_message);
				}
			},
			error: function(error) {
				alert("비밀번호 확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>