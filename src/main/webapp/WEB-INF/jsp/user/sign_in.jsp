<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="login mt-5">
	<h1>로그인</h1>
	<form id="loginForm" method="post" action="/user/user_sign_in">
		<div class="login-box">
			<div class="d-flex justify-content-end align-items-center pt-5 pr-5">
				<span>아이디</span> <input type="text" id="loginId" name="loginId"
					class="form-control col-9 ml-2">
			</div>
			<div class="d-flex justify-content-end align-items-center pt-2  pr-5">
				<span>비밀번호</span> <input type="password" id="password"
					name="password" class="form-control col-9 ml-2">
			</div>
			<div class="form-inline d-felx justify-content-between button-box mt-3">
					<a class="btn btn-dark buttons" href="/user/sign_up_select_view">회원가입</a>
					<input type="button" id="loginBtn"
						class="btn btn-primary buttons" value="로그인">
			</div>
		</div>
	</form>
</div>
<script>
$(document).ready(function() {
	$('#loginBtn').on('click', function() {
		let loginId = $('#loginId').val().trim();

		// validation
		if (loginId == '') {
			alert("아이디를 입력해주세요");
			return false;
		}

		let password = $('#password').val();
		if (password == '') {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		$.ajax({
			type: "post",
			url: "/user/sign_in",
			data: {
				"loginId" : loginId,
				"password" : password,
				},
			success: function(data) {
				if (data.result == "user") {
					location.href = "/main/user/main_view";
				} else if (data.result == "boss") {
					location.href = "/main/boss/main_view";
				} else {
					alert(data.error_message);
				}
			},
			error: function(error) {
				alert("로그인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>