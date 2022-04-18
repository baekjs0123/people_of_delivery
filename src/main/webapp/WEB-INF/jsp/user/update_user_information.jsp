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
			<button type="button" id="pwChangeBtn" class="btn btn-secondary mb-3"  data-toggle="modal" data-target="pwChangeModal">비밀번호 변경하기</button>
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
	$('#pwChangeBtn').on('click', function() {
		//alert("비밀번호 변경");
		
	});
	
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
});
</script>