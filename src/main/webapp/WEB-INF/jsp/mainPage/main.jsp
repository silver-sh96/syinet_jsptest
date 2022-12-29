<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Do+Hyeon&family=Dongle&family=Gothic+A1&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Jua&family=Nanum+Gothic&family=Noto+Sans+KR&family=Stylish&family=Sunflower:wght@500&display=swap');
	div {
		font-family: "Nanum Gothic", sans-serif;
	}
</style>
<link href="../../../css/pagination.css" rel="stylesheet" type="text/css">
<script src="../js/userList.js"></script>
</head>

<body>
	<div class="d-block mb-4 mb-md-0" style="margin-top: 10px;">
	    <nav aria-label="breadcrumb" class="d-none d-md-inline-block">
	        <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
	            <li class="breadcrumb-item">
                    <svg class="icon icon-xxs" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
	            </li>
	        </ol>
	    </nav>
	</div><br/>
	<form id="searchForm" method="get" action="/user/userList.do">
		<input style="display: none;" />
		<select id="searchKey" class="form-select" name="searchKey" style="width: 100px; float: left;">
		    <option value="user_dept" <c:if test="${searchKey eq 'user_dept'}">selected</c:if>>부서</option>
		    <option value="user_name" <c:if test="${searchKey eq 'user_name'}">selected</c:if>>이름</option>
		    <option value="user_rank" <c:if test="${searchKey eq 'user_rank'}">selected</c:if>>직급</option>
		    <option value="user_position" <c:if test="${searchKey eq 'user_position'}">selected</c:if>>직책</option>
		    <option value="user_phone" <c:if test="${searchKey eq 'user_phone'}">selected</c:if>>연락처</option>
		    <option value="user_email" <c:if test="${searchKey eq 'user_email'}">selected</c:if>>이메일</option>
		</select>
		<div class="input-group" style="float: left; width: 400px;">
		    <input id="searchValue" type="search" class="form-control" name="searchValue" value="${searchValue}" placeholder="Search" aria-label="Search" />
		    <button id="searchBtn" type=submit class="input-group-text">
		    	<svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
		    		<path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path>
		    	</svg>  
		    </button>
		</div>
	
	
	<div style="float: right">
		<button class="btn btn-gray-200" type="button">
			<a href="/user/userReg.do">등록</a> 
		</button>
		<button class="btn btn-gray-200" type="button" id="modifyBtn">수정</button>
		<button class="btn btn-danger" type="button" id="delBtn">삭제</button><br/>
	</div>
	<br/>
	<br/>
	<br/>
	<p style="float: right;">총 사용자 수 : ${total}</p>
	<div style="float: left; width: 120px; height: 50px;">
		<select id="cntPerPage" name="cntPerPage" class="form-select">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div>
	<table class="table table-hover" style="margin: auto; vertical-align: middle;">
		<thead>
			<tr>
				<th scope="col" style="width: 5%; height: 30px; margin-left: 20px;" >
					<input type="checkbox" id="allSelect" name="allSelect" />
				</th>
				<th scope="col" style="display: none;">아이디</th>
				<th scope="col" width="15%">부서</th>
				<th scope="col" width="15%">이름</th>
				<th scope="col" width="10%">직급</th>
				<th scope="col" width="15%">직책</th>
				<th scope="col" width="20%">이메일</th>
				<th scope="col" width="20%">연락처</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty userList}">
				<tr>
					<td colspan="7" style="text-align: center;">검색 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${userList}" var="u">
				<tr>
					<td>
						<input type="checkbox" class="userSelect" name="checkedUser" value="${u.userId}"/>
					</td>
					<td class="targetId" style="display: none;">${u.userId}</td>
					<td>${u.userDept}</td>
					<td><a class="targetName">${u.userName}</a></td>
					<td>${u.userRank}</td>
					<td>${u.userPosition}</td>
					<td>${u.userEmail}</td>
					<td>${u.userPhone}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>	
	
</body>
<footer>
	<div class="page_wrap">
		<div class="page_nation">
			<c:choose>
				<c:when test="${(paging.nowPage-1) == paging.beginPage}">
					<a class="arrow prev" href="/user/userList.do?nowPage=${paging.beginPage}&cntPerPage=${paging.cntPerPage}&searchKey=${searchKey}&searchValue=${searchValue}">&lt;</a>
				</c:when>
				<c:when test="${paging.nowPage != paging.beginPage && paging.beginPage != paging.lastPage}">
					<a class="arrow pprev" href="/user/userList.do?nowPage=${paging.beginPage}&cntPerPage=${paging.cntPerPage}&searchKey=${searchKey}&searchValue=${searchValue}">&lt;&lt;</a>
					<a class="arrow prev" href="/user/userList.do?nowPage=${paging.nowPage-1}&cntPerPage=${paging.cntPerPage}&searchKey=${searchKey}&searchValue=${searchValue}">&lt;</a>
				</c:when>	
			</c:choose>
			<c:choose>
				<c:when test="${paging.endPage <= paging.lastPage}">
					<c:forEach begin="${paging.windowStart }" end="${paging.windowEnd }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage}">
								<a class="active">${p}</a>
							</c:when>
							<c:when test="${p != paging.nowPage && p != '0'}">
								<a href="/user/userList.do?nowPage=${p}&cntPerPage=${paging.cntPerPage}&searchKey=${searchKey}&searchValue=${searchValue}">${p}</a>
							</c:when>
							<c:when test="${p == '0'}">
								<a class="active">1</a>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${(paging.nowPage+1) == paging.lastPage }">
					<a class="arrow next" href="/user/userList.do?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&searchKey=${searchKey}&searchValue=${searchValue}">&gt;</a>
				</c:when>
				<c:when test="${paging.lastPage > 0 && paging.nowPage < paging.lastPage}">
					<a class="arrow next" href="/user/userList.do?nowPage=${paging.nowPage+1}&cntPerPage=${paging.cntPerPage}&searchKey=${searchKey}&searchValue=${searchValue}">&gt;</a>
					<a class="arrow nnext" href="/user/userList.do?nowPage=${paging.lastPage }&cntPerPage=${paging.cntPerPage}&searchKey=${searchKey}&searchValue=${searchValue}">&gt;&gt;</a>
				</c:when>
			</c:choose>
		</div>
	</div>
	
</footer>

</html>