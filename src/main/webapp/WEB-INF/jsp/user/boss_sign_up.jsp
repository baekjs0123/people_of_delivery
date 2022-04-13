<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sign-up mt-5">
	<h1>사장님 회원가입</h1>
	<div class="sign-up-box">
		<div class="pl-3 pt-3">
			<span>아이디(6자 이상)</span>
			<div class="d-flex">
				<input type="text" id="loginId" name="loginId" class="form-control col-9">
				<button type="button" id="checkDuplicateBtn" class="btn btn-success ml-3">중복확인</button>
			</div>
			<div id="idCheckLength" class="small text-danger d-none">아이디를 6자 이상 입력해주세요.</div>
			<div id="idCheckDuplicated" class="small text-danger d-none">이미 사용중인 아이디 입니다.</div>
			<div id="idCheckOk" class="small text-success d-none">사용 가능한 아이디 입니다.</div>
		</div>
		<div class="pl-3 pt-3">
			<span>비밀번호</span> <input type="password" id="password" name="password" class="form-control col-9">
		</div>
		<div class="pl-3 pt-3">
			<span>비밀번호 확인</span> <input type="password" id="confirmPassword" class="form-control col-9">
		</div>
		<div class="pl-3 pt-3">
			<span>이름</span> <input type="text" id="name" name="name" class="form-control col-9" placeholder="이름을 입력해주세요.">
		</div>
		<div class="pl-3 pt-3">
			<span>닉네임</span> <input type="text" id="nickName" name="nickName" class="form-control col-9" placeholder="닉네임을 입력해주세요.">
		</div>
		<div class="pl-3 pt-3">
			<span>전화번호</span> <input type="text" id="phoneNumber" name="phoneNumber" class="form-control col-9" placeholder="ex)01012345678">
		</div>
		<div class="pl-3 pt-3">
			<span>이메일</span> <input type="text" id="email" name="email" class="form-control col-9" placeholder="이메일을 입력해주세요.">
		</div>
		<div class="d-flex justify-content-center pt-3">
			<button type="button" id="signUpBtn" class="btn btn-info">가입하기</button>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	$('#checkDuplicateBtn').on('click', function() {
		//alert("중복확인 버튼");
		let loginId = $('#loginId').val().trim();
		
		// 경고 문구 초기화
		$('#idCheckLength').addClass('d-none');
		$('#idCheckDuplicated').addClass('d-none');
		$('#idCheckOk').addClass('d-none');
		
		if (loginId.length < 6) {
			$('#idCheckLength').removeClass('d-none');
			return;
		}
		
		$.ajax({
			url: "/user/is_duplicated_id",
			data: {"loginId" : loginId},
			success: function(data) {
				if (data.result) { // 중복인 경우
					$('#idCheckDuplicated').removeClass('d-none');
				} else { // 사용가능
					$('#idCheckOk').removeClass('d-none');
				}
			},
			error : function(error) {
				alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	$('#signUpBtn').on('click', function() {
		//alert("가입하기 버튼");
			let loginId = $('#loginId').val().trim();
			if (loginId == '') {
				alert("아이디를 입력하세요.");
				return;
			}

			let password = $('#password').val().trim();
			let confirmPassword = $('#confirmPassword').val().trim();
			if (password == '' || confirmPassword == '') {
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			// 비밀번호 확인 일치 여부
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
				// 텍스트박스의 값을 초기화 한다.
				$('#password').val('');
				$('#confirmPassword').val('');
				return;
			}
			
			let name = $('#name').val().trim();
			if (name == '') {
				alert("이름을 입력하세요.");
				return;
			}
			let nickName = $('#nickName').val().trim();
			if (nickName == '') {
				alert("닉네임을 입력하세요.");
				return;
			}
			let phoneNumber = $('#phoneNumber').val().trim();
			if (phoneNumber == '') {
				alert("전화번호를 입력하세요.");
				return;
			}
			
			let email = $('#email').val().trim();
			if (email == '') {
				alert("이메일 주소를 입력하세요.");
				return;
			}
			
			// 비밀번호, 전화번호, 이메일 정규식(보안성 강화)
			let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			let regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if (reg.test(password) === false) {
				alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				return false;
			} else if (regPhone.test(phoneNumber) === false) {
				alert("잘못된 휴대전화번호입니다. 다시 입력해주세요.");
			    return false;
			} else if (regEmail.test(email) === false) {
				alert("잘못된 이메일형식입니다. 다시 입력해주세요.");
				return false;
			}
			// 아이디 중복확인이 완료되었는지 확인
			//-- idCheckOk <div> 클래스에 d-none이 없으면 사용 가능
			// idCheckOk d-none이 있으면 => alert 띄운다.
			if ($('#idCheckOk').hasClass('d-none')) {
				alert("아이디 중복확인을 해주세요.");
				return;
			}

			$.ajax({
				type: "post",
				url: "/user/user_sign_up",
				data: {
					"loginId" : loginId,
					"password" : password,
					"name" : name,
					"nickName" : nickName,
					"phoneNumber" : phoneNumber,
					"email" : email
					},
				success: function(data) {
					if (data.result == "success") {
						alert("가입을 환영합니다! 로그인을 해주세요.");
						location.href = "/user/boss/sign_in_view";
					} else {
						alert(data.error_message);
					}
				},
				error: function(error) {
					alert("회원가입에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
	});
});
</script>