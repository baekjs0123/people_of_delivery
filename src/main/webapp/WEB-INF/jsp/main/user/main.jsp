<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents">
	
	<%-- 검색창 --%>
	<div class="search-box d-flex justify-content-center align-items-center">
		<input type="text" class="search form-control col-8" placeholder="검색할 메뉴를 입력해주세요.">
		<button type="button" class="btn btn-success">검색</button>
	</div>
	
	<%-- 배달, 포장 선택 --%>
	<div class="select-box d-flex justify-content-center mt-5">
		<a href="#">
			<h2>배달</h2>
			<div class="select mr-5">
				<img src="/images/delivery.jpg" alt="배달 사진" width="300px" height="300px">
			</div>
		</a>
		<a href="#" class="ml-5">
			<h2>포장</h2>
			<div class="select">
				<img src="/images/to_go.jpg" alt="포장 사진" width="300px" height="300px">
			</div>
		</a>
	</div>
	
	<%-- 내가 찜한 가게 --%>
	<div class="mt-5">
		<h1>내가 찜한 가게</h1>
		<div>
			<img src="/images/chinese_restaurant.jpg" alt="가게 대표이미지" width="200px" height="200px">
			<div class="d-flex align-items-center">
				<span class="store-text mr-5">왕손짜장</span>
				<img src="/images/star.png" alt="별점" width="25px" height="25px">
				<span class="store-text ml-2">4.5</span>
			</div> 
		</div>	
	</div>
	
	<%-- 최근에 주문한 가게 --%>
	<div class="mt-5">
		<h1>최근에 주문한 가게</h1>
		<div>
			<img src="/images/chinese_restaurant.jpg" alt="가게 대표이미지" width="200px" height="200px">
			<div class="d-flex align-items-center">
				<span class="store-text mr-5">왕손짜장</span>
				<img src="/images/star.png" alt="별점" width="25px" height="25px">
				<span class="store-text ml-2">4.5</span>
			</div> 
		</div>	
	</div>
</div>