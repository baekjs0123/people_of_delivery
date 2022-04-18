<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="update-user-inform mt-5">
	<h1>내 정보 수정하기</h1>
	<div class="update-user-inform-box">
		<div class="pl-5 pt-3 ">
			<span>이름</span> <input type="text" id="name" name="name" class="form-control col-10" placeholder="이름을 입력해주세요." value="">
		</div>
		<div class="pl-5 pt-3">
			<span>닉네임</span> <input type="text" id="nickName" name="nickName" class="form-control col-10" placeholder="닉네임을 입력해주세요.">
		</div>
		<div class="pl-5 pt-3">
			<span>전화번호</span> <input type="text" id="phoneNumber" name="phoneNumber" class="form-control col-10" placeholder="ex)010-1234-5678">
		</div>
		<div class="pl-5 pt-3">
			<span>이메일</span> <input type="text" id="email" name="email" class="form-control col-10" placeholder="이메일을 입력해주세요.">
		</div>
		<div class="d-flex justify-content-center pt-3">
			<button type="button" id="pwChangeBtn" class="btn btn-secondary mb-3"  data-toggle="modal" data-target="#pwChangeModal" data-user-login-id="${userLoginId}">비밀번호 변경하기</button>
		</div>		
		<div class="d-flex justify-content-center pt-3">
			<button type="button" id="updateBtn" class="btn btn-info mb-3">수정하기</button>
		</div>		
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="pwChangeModal">
	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
		<div class="modal-content p-3">
			<h3 class="font-weight-bold">비밀번호 수정하기</h3>
			<div class="p-3">
				<div class="mt-3">
					<span>현재 비밀번호</span> <input type="password" id="password" name="password" class="form-control col-9">
				</div>
				<div class="mt-3">
					<span>변경할 비밀번호</span> <input type="password" id="changePassword" name="changePassword" class="form-control col-9">
				</div>
				<div class="mt-3">
					<span>변경할 비밀번호 확인</span> <input type="password" id="changePasswordConfirm" name="changePasswordConfirm" class="form-control col-9">
				</div>
				<div class="d-flex justify-content-center mt-3">
					<div class="mr-3">
						<button type="button" id="updateBtn" class="buttons btn btn-primary" data-toggle="modal" data-target="#pwChangeModal">수정하기</button>
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
	$('#updateBtn').on('click', function() {
		//alert("수정하기 버튼");
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
			
		$.ajax({
			type: "put",
			url: "/user/update_user_information",
			data: {
				"name" : name,
				"nickName" : nickName,
				"phoneNumber" : phoneNumber,
				"email" : email
				},
			success: function(data) {
				if (data.result == "success") {
					alert("정상적으로 회원정보가 수정되었습니다!");
					location.href = "/user/mypage_view";
				} else {
					alert(data.error_message);
				}
			},
			error: function(error) {
				alert("회원정보 수정에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	$('#pwChangeBtn').on('click', function() {
		//alert("비밀번호 변경");
		let loginId = $(this).data('user-login-id');
			
		$('#pwChangeModal').data('user-login-id', loginId);
	});
	
	$('#pwChangeModal #updateBtn').on('click', function(e) {
		e.preventDefault();
		//alert("업데이트 하기");

		let loginId = $('#pwChangeModal').data('user-login-id');
		//alert(loginId);
		if (loginId == "") {
			alert("로그인되어 있지 않습니다. 로그인 해주세요.");
			return;
		}
		
		let password = $('#password').val().trim();
		if (password == '') {
			alert("현재 비밀번호를 입력하세요.");
			return;
		}
		
		let changePassword = $('#changePassword').val().trim();
		let changePasswordConfirm = $('#changePasswordConfirm').val().trim();
		if (changePassword == '' || changePasswordConfirm == '') {
			alert("변경할 비밀번호를 입력하세요.");
			return;
		}
		
		if (password == changePassword) {
			alert("이전 비밀번호와 동일합니다. 비밀번호를 다시 설정해주세요.");
			return;
		}
		
		if (changePassword != changePasswordConfirm) {
			alert("변경할 비밀번호가 일치하지 않습니다. 다시 입력하세요.");
			return;
		}
		
		
		// 비밀번호, 전화번호, 이메일 정규식(보안성 강화)
		let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		
		if (reg.test(changePassword) === false) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			return false;
		}
		
		$.ajax({
			type: "post",
			url: "/user/password_check",
			data: {
				"loginId" : loginId,
				"password" : password
				},
			async: false,
			success: function(data) {
				if (data.result == "success") {
					location.href = "/user/update_user_information_view";
					
					$.ajax({
						type: "put",
						url: "/user/update_password",
						data: {"password" : changePassword},
						async: false,
						success: function(data) {
							if (data.result == "success") {
								alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
								location.href = "/user/sign_out";
								location.href = "/user/sign_in_view";
							} else {
								alert(data.error_message);
							}
						},
						error: function(error) {
							alert("비밀번호 변경에 실패했습니다. 관리자에게 문의해주세요.");
						}
					});
				} else {
					alert(data.error_message);
				}
			},
			error: function(error) {
				alert("비밀번호 변경에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>