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