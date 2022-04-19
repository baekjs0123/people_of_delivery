<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents">
	<%-- 매장 추가, 수정 선택 --%>
	<div class="select-box d-flex justify-content-center mt-5">
		<a href="/store/create_store_view">
			<h2>매장 추가하기</h2>
			<div class="select mr-5">
				<img src="/images/add_icon.png" alt="매장 추가" width="300px" height="300px">
			</div>
		</a>
		<a href="/store/update_store_view" class="ml-5">
			<h2>매장 수정하기</h2>
			<div class="select">
				<img src="/images/edit_icon.png" alt="매장 수정" width="300px" height="300px">
			</div>
		</a>
	</div>
</div>