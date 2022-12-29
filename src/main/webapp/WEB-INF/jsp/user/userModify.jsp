<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 수정 화면</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Do+Hyeon&family=Dongle&family=Gothic+A1&family=Gowun+Dodum&family=IBM+Plex+Sans+KR&family=Jua&family=Nanum+Gothic&family=Noto+Sans+KR&family=Stylish&family=Sunflower:wght@500&display=swap');

	table {
		border-collapse: separate;
		border-spacing: 5px 5px;
		table-layout: fixed;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
	}
	
	.userRegInfo {
		width: 200px;
	}
	
	.phone {
		width: 80px;
		margin-right: 10px;
	}
	
	.target {
		color: red;
		margin-right: 5px;
	}
	
	.email {
		width: 160px;
		margin-right: 10px;
	}
	
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	
	div, h2 {
		font-family: "Nanum Gothic", sans-serif;
	}
	
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="d-block mb-4 mb-md-0" style="margin-top: 10px;">
		<nav aria-label="breadcrumb" class="d-none d-md-inline-block">
			<ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
				<li class="breadcrumb-item"><a href="/"> <svg
							class="icon icon-xxs" fill="none" stroke="currentColor"
							viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
							<path stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2"
								d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
				</a></li>
				<li class="breadcrumb-item">사용자 수정</li>
			</ol>
		</nav>
	</div>
	<form action="/user/userModify.do" method="post" id="userModifyForm" style="margin: auto;">
		<table>
			<c:forEach items="${modifyUser}" var="m">
				<tr>
				<td>사용자 성</td>
				<td><input type="text" id="userFirstName" class="form-control userRegInfo" name="userFirstName" value="${m.userFirstName}" /></td>
				<td>사용자 이름</td>
				<td><input type="text" id="userMiddleName" class="form-control userRegInfo" name="userMiddleName" value="${m.userMiddleName}" /></td>
			</tr>
			<tr id="nameCheck" style="height: 30px; display: none; padding: 5px; font-size: 12px;">
				<td style="padding: 5px;" colspan="4" class="alert alert-danger">정확한 값을 입력해주세요.</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" class="form-control userRegInfo" name="userId" value="${m.userId}" readonly /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="userPw" class="form-control userRegInfo" name="userPw" value="${m.userPw}" /></td>
				<td><span class="target">*</span>비밀번호 확인</td>
				<td>
					<input type="password" id="userPwCheck" class="form-control userRegInfo" />
				</td>
			</tr>
			<tr id="pwComparePass" style="height: 30px; display: none; padding: 5px; font-size: 12px">
				<td colspan="4" class="alert alert-success" style="padding: 5px;">비밀번호가 일치합니다.</td>
			</tr>
			<tr id="pwCompareFail" style="height: 30px; display: none; padding: 5px; font-size: 12px">
				<td style="padding: 5px;" colspan="4" class="alert alert-danger">비밀번호가 일치하지 않습니다.</td>
			</tr>
			<tr id="pwCheck" style="height: 30px; display: none; padding: 5px; font-size: 12px">
				<td style="padding: 5px;" colspan="4" class="alert alert-danger">비밀번호는 연속, 반복되지 않는 8~12자 사이의 특수문자, 숫자, 영문 조합으로 작성해주세요.</td>
			</tr>
				<tr>
				<td>연락처</td>
				<td colspan="4">
					<select id="phoneF" class="form-select phone" style="float: left;">
						<option <c:if test="${fn:substring(m.userPhone, 0, 3) == 010}">selected</c:if>>010</option>
						<option <c:if test="${fn:substring(m.userPhone, 0, 3) == 011}">selected</c:if>>011</option>
						<option <c:if test="${fn:substring(m.userPhone, 0, 3) == 016}">selected</c:if>>016</option>
						<option <c:if test="${fn:substring(m.userPhone, 0, 3) == 017}">selected</c:if>>017</option>
						<option <c:if test="${fn:substring(m.userPhone, 0, 3) == 018}">selected</c:if>>018</option>
						<option <c:if test="${fn:substring(m.userPhone, 0, 3) == 019}">selected</c:if>>019</option>
					</select>
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
					<input type="text" id="phoneM" class="form-control phone" style="float: left;" value="${fn:substring(m.userPhone, 3, 7)}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" />
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
					<input type="text" id="phoneL" class="form-control phone" value="${fn:substring(m.userPhone, 7, 12)}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" />
				</td>
				<input type="hidden" id="userPhone" name="userPhone"/>
			</tr>
			<tr>
				<td>자택 전화번호</td>
				<td colspan="4">
					<select id="homePhoneF" class="form-select phone" style="float: left;">
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 2) == 02}">selected</c:if>>02</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 031}">selected</c:if>>031</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 032}">selected</c:if>>032</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 042}">selected</c:if>>042</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 044}">selected</c:if>>044</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 051}">selected</c:if>>051</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 052}">selected</c:if>>052</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 062}">selected</c:if>>062</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 063}">selected</c:if>>063</option>
						<option <c:if test="${fn:substring(m.userHomePhone, 0, 3) == 064}">selected</c:if>>064</option>
					</select>
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
					<c:choose>
						<c:when test="${fn:substring(m.userHomePhone, 0, 2) == 02}">
							<input type="text" id="homePhoneM" class="form-control phone" style="float: left;" value="${fn:substring(m.userHomePhone, 2, 6)}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3" />
							<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
							<input type="text" id="homePhoneL" class="form-control phone" value="${fn:substring(m.userHomePhone, 6, 10)}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" />
						</c:when>
						<c:otherwise>
							<input type="text" id="homePhoneM" class="form-control phone" style="float: left;" value="${fn:substring(m.userHomePhone, 3, 6)}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3" />
							<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
							<input type="text" id="homePhoneL" class="form-control phone" value="${fn:substring(m.userHomePhone, 6, 10)}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" />
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="userHomePhone" name="userHomePhone"/>
				</td>
			</tr>
			<tr>
				<td>개인 이메일</td>
				<td colspan="4">
					<input type="text" id="localBox" class="form-control email" value="${fn:split(m.userEmail, '@')[0]}" style="float: left;" maxlength="15" />
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> @ </span>
					<input type="text" id="domainBox" class="form-control email" value="${fn:split(m.userEmail, '@')[1]}" style="float: left;" />
					<select id="selectDomain" class="form-select email">
						<option>직접입력</option>
						<option <c:if test="${fn:split(m.userEmail, '@')[1] == 'daum.com'}">selected</c:if>>daum.com</option>
						<option <c:if test="${fn:split(m.userEmail, '@')[1] == 'gmail.com'}">selected</c:if>>gmail.com</option>
						<option <c:if test="${fn:split(m.userEmail, '@')[1] == 'hanmail.net'}">selected</c:if>>hanmail.net</option>
						<option <c:if test="${fn:split(m.userEmail, '@')[1] == 'nate.com'}">selected</c:if>>nate.com</option>
						<option <c:if test="${fn:split(m.userEmail, '@')[1] == 'naver.com'}">selected</c:if>>naver.com</option>
						<option <c:if test="${fn:split(m.userEmail, '@')[1] == 'outlook.com'}">selected</c:if>>outlook.com</option>
						<option <c:if test="${fn:split(m.userEmail, '@')[1] == 'yahoo.com'}">selected</c:if>>yahoo.com</option>
					</select>
					<input type="hidden" id="userEmail" name="userEmail"/>
				</td>
			</tr>
			<tr id="emailCheck" style="height: 30px; display: none; padding: 5px; font-size: 12px">
				<td style="padding: 5px;" colspan="4" class="alert alert-danger">이메일 형식을 맞추어 작성해주세요.</td>
			</tr>
			<tr>
				<td>자택 주소</td>
				<td><input type="text" id="userZipCode" class="form-control userRegInfo" name="userZipCode" value="${m.userZipCode}" readonly/></td>
				<td><input type="button" id="searchZipCode" class="btn btn-gray-800" value="우편번호 검색"/></td>
			</tr>
			<tr class="target">
				<td><input type="hidden" value="userAddr"/></td>
				<td colspan="3"><input type="text" id="userAddr" class="form-control" name="userAddr" value="${m.userAddr}" readonly/></td>
			</tr>
			<tr class="target">
				<td><input type="hidden" value="userAddrDetail"/></td>
				<td colspan="3"><input type="text" id="userAddrDetail" class="form-control" name="userAddrDetail" value="${m.userAddrDetail}" /></td>
			</tr>
				<tr>
					<td>소속 부서</td>
						<td>
							<select class="form-select" id="userDept" name="userDept">
								<option selected="selected">${m.userDept}</option>
								<c:forEach items="${deptList}" var="d">
									<c:if test="${m.userDept != d.deptName}">
										<option>${d.deptName}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
						<select class="form-select" id="userRank" name="userRank">
							<option selected="selected">${m.userRank}</option>
							<c:forEach items="${rankList}" var="r">
								<c:if test="${m.userRank != r.rankName}">
									<option>${r.rankName}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>직책</td>
					<td>
						<select class="form-select" id="userPosition" name="userPosition">
							<option selected="selected">${m.userPosition}</option>
							<c:forEach items="${positionList}" var="p">
								<c:if test="${m.userPosition != p.positionName}">
									<option>${p.positionName}</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div style=" text-align: center;">
			<button id="modifyBtn" type="button" class="btn btn-primary" style=" display: inline-block; width: 100px; margin-top: 20px;">등록</button>
			<button id="cancleBtn" type="button" class="btn btn-danger" style=" display: inline-block; width: 100px; margin-top: 20px; margin-left: 30px;">취소</button>
		</div>
	</form>

</body>

<script type="text/javascript">
$(function(){
	
	"use strict";
	
	/* 취소 버튼 */
	$('#cancleBtn').click(function(){
		var cancle = confirm('취소하시겠습니까?');
		if(cancle == true) {
           //yes
        	location.href = "/user/userList.do";
        } else {
            //no
        	return false;
        }
	});
	/* 취소 버튼 */
	
	/* 페이지 나가기 */
	$('.nav-item').click(function(){
		var out = confirm('수정을 취소하고 나가시겠습니까?');
		if(out == true) {
           //yes
        	location.href = "/user/userList.do";
        } else {
            //no
        	return false;
        }
	})
	/* 페이지 나가기 */
	
	/* 주소검색 api */
	function kakaopost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#userZipCode").value = data.zonecode;
				document.querySelector("#userAddr").value = data.address
			}
		}).open({    left: (window.screen.width / 2) - 250,
		    top: (window.screen.height / 2) - 300});
	}
	/* 주소검색 api */
	
	/* 우편번호 검색 이벤트 */
	$('#searchZipCode').click(function(){
		kakaopost();
	});
	/* 우편번호 검색 이벤트 */
	
	/* 사용자 성 유효성 검사 */
	$('#userFirstName').keyup(function(){
		var userFirstNameVal = $('#userFirstName').val(),
		userFirstName = $('#userFirstName'),
		name = /([^가-힣\x20])/i;
		console.log($('#nameCheck').val());
		if(name.test(userFirstNameVal)){
			$('#nameCheck').css('display', 'contents');
			$('#nameCheck').val(0);
		}else{
			$('#nameCheck').css('display', 'none');
			$('#nameCheck').val(1);
		}
	});
	/* 사용자 성 유효성 검사 */
	
	/* 사용자 이름 유효성 검사 */
	$('#userMiddleName').keyup(function(){
		var userMiddleNameVal = $('#userMiddleName').val(),
		userMiddleName = $('#userMiddleName'),
		name = /([^가-힣\x20])/i;
		console.log($('#nameCheck').val());
		if(name.test(userMiddleNameVal)){
			$('#nameCheck').css('display', 'contents');
			$('#nameCheck').val(0);
		}else{
			$('#nameCheck').css('display', 'none');
			$('#nameCheck').val(1);
		}
	});
	/* 사용자 이름 유효성 검사 */
	
	
	/* 사용자 비밀번호 유효성 검사 */
	$('#userPw').keyup(function(){
		console.log($('#pwCheck').val(),'valllll')
		var userPwVal = $('#userPw').val(),
		userPwCheckVal = $('#userPwCheck').val(),
		userPw = $('#userPw'),
		password = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/,
		again = /(\w)\1\1\1/;
		/* 연속 문자 확인 */
		var ascSeqCharCnt = 0; // 오름차순 연속 문자 카운트
		var descSeqCharCnt = 0; // 내림차순 연속 문자 카운트
		  
		var char_0;
		var char_1;
		var char_2;
		  
		var diff_0_1;
		var diff_1_2;
		  
		for(var i = 0; i < userPwVal.length; i++){
			// charAt(): 문자값 반환
			char_0 = userPwVal.charAt(i);
			char_1 = userPwVal.charAt(i+1);
			char_2 = userPwVal.charAt(i+2);
		    
			// charCodeAt(): 유니코드값 반환
			diff_0_1 = char_0.charCodeAt(0) - char_1.charCodeAt(0);
			diff_1_2 = char_1.charCodeAt(0) - char_2.charCodeAt(0);
		
			if(diff_0_1 === 1 && diff_1_2 === 1){
				ascSeqCharCnt += 1;
			}
		
			if(diff_0_1 === -1 && diff_1_2 === -1){
				descSeqCharCnt += 1;
			}
		}
		/* 연속 문자 확인 */
		
		if(userPwVal == "" || userPwVal == null || userPwVal == " "){
			$('#pwCompareFail').css('display', 'none');
          	$('#pwComparePass').css('display', 'none');
			$('#pwCheck').css('display', 'none');
		};
		
		if(!password.test(userPwVal) && userPwVal != ""){
			$('#pwCompareFail').css('display', 'none');
          	$('#pwComparePass').css('display', 'none');
			$('#pwCheck').css('display', 'contents');
			$('#pwCheck').val(0);
			return false;
		}else if(userPwVal != ""){
			$('#pwCheck').css('display', 'none');
			$('#pwCheck').val(1);
			if(userPwVal == userPwCheckVal){
				$('#pwComparePass').css('display', 'contents');
				$('#pwCompareFail').css('display', 'none');
			}else if(userPwVal != userPwCheckVal && userPwCheckVal !=''){
				$('#pwComparePass').css('display', 'none');
				$('#pwCompareFail').css('display', 'contents');
			}
		}
		
		if(again.test(userPwVal) && userPwVal != ""){
			$('#pwCompareFail').css('display', 'none');
          	$('#pwComparePass').css('display', 'none');
			$('#pwCheck').css('display', 'contents');
			$('#pwCheck').val(0);
			return false;
		}else if(userPwVal != ""){
			$('#pwCheck').css('display', 'none');
			$('#pwCheck').val(1);
			if(userPwVal == userPwCheckVal){
				$('#pwComparePass').css('display', 'contents');
				$('#pwCompareFail').css('display', 'none');
			}else if(userPwVal != userPwCheckVal && userPwCheckVal !=''){
				$('#pwComparePass').css('display', 'none');
				$('#pwCompareFail').css('display', 'contents');
			}
		}
		
		if((ascSeqCharCnt > 1 || descSeqCharCnt > 1) && userPwVal != ""){
			$('#pwCompareFail').css('display', 'none');
          	$('#pwComparePass').css('display', 'none');
			$('#pwCheck').css('display', 'contents');
			$('#pwCheck').val(0);
			return false;
		}else if(userPwVal != ""){
			$('#pwCheck').css('display', 'none');
			$('#pwCheck').val(1);
			if(userPwVal == userPwCheckVal){
				$('#pwComparePass').css('display', 'contents');
				$('#pwCompareFail').css('display', 'none');
			}else if(userPwVal != userPwCheckVal && userPwCheckVal !=''){
				$('#pwComparePass').css('display', 'none');
				$('#pwCompareFail').css('display', 'contents');
			}
		}
		
		
	});
	/* 사용자 비밀번호 유효성 검사 */
	
	/* 비밀번호 확인 체크 실시간 */
    $('#userPwCheck').keyup(function(){
    	var userPwCheck = $('#userPwCheck').val(),
    	userPw = $('#userPw').val();
    	
        if(userPw != userPwCheck && userPwCheck != ""){
          	$('#pwCompareFail').css('display', 'contents');
          	$('#pwComparePass').css('display', 'none');
        } else if(userPw == userPwCheck && userPwCheck != "") {
        	$('#pwCompareFail').css('display', 'none');
          	$('#pwComparePass').css('display', 'contents');
          	return true;
        }
    });
	/* 비밀번호 확인 체크 실시간 */
	
	/* 사용자 연락처 이벤트 */
	var userPhone = $('#userPhone'),
		userHomePhone = $('#userHomePhone'),
		phoneF = $('#phoneF'),
		phoneM = $('#phoneM'),
		phoneL = $('#phoneL'),
		homePhoneF = $('#homePhoneF'),
		homePhoneM = $('#homePhoneM'),
		homePhoneL = $('#homePhoneL');
	
	userPhone.val($('#phoneF option:selected').text() + phoneM.val() + phoneL.val());
	userHomePhone.val($('#homePhoneF option:selected').text() + homePhoneM.val() + homePhoneL.val());
	
	$('#phoneF').change(function(){
		userPhone.val($('#phoneF option:selected').text() + phoneM.val() + phoneL.val());
	});
	$('#homePhoneF').change(function(){
		userHomePhone.val($('#homePhoneF option:selected').text() + $('#homePhoneM').val() + $('#homePhoneL').val());
	});

	
	$('.phone').keyup(function(){
		userPhone.val($('#phoneF option:selected').text() + phoneM.val() + phoneL.val());
		userHomePhone.val($('#homePhoneF option:selected').text() + homePhoneM.val() + homePhoneL.val());
		
		if(this.value.length == 4){
			if(this.id == 'phoneM'){
				phoneL.focus();
			}else if(this.id == 'phoneL'){
				homePhoneF.focus();
			}else if(this.id == 'homePhoneL'){
				$('#localBox').focus();
			}
		}
		if(this.id == 'homePhoneM'){
			if(this.value.length == 3){
				homePhoneL.focus();
			}
		}
	});
	/* 사용자 연락처 이벤트 */
	
	/* 사용자 이메일 유효성 검사 */
	var userEmail = $('#userEmail'),
		domainBox = $('#domainBox'),
		localBox = $('#localBox');
	userEmail.val(localBox.val() + '@' + domainBox.val());
	
	$('#localBox').keyup(function(){
		userEmail.val(localBox.val() + '@' + domainBox.val());
		var localBoxVal = $('#localBox').val(),
		localEmail = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]$/;
		
		if(localBoxVal == "" || localBoxVal == null || localBoxVal == " "){
    		$('#emailCheck').css('display', 'none');
    	}
		
		if(!localEmail.test(localBoxVal) && localBoxVal != ""){
          	$('#emailCheck').css('display', 'contents');
          	$('#emailCheck').val(0);
		}else{
			$('#emailCheck').css('display', 'none');
          	$('#emailCheck').val(1);
		}
	});
	
	$('#selectDomain').change(function(){
		var domain = $('#selectDomain option:selected').text();
		var selDomText = $('#selectDomain option:selected').text();
		console.log(selDomText, 'selDomText');
		
		if(selDomText == "직접입력"){
			domainBox.val('');
			$('#domainBox').prop('disabled', false);
			userEmail.val(localBox.val() + '@' + domainBox.val());
		}else{
			$('#domainBox').val(domain);
			$('#domainBox').prop('disabled', true);
			$('#emailCheck').css('display', 'none');
          	$('#emailCheck').val(1);
			userEmail.val(localBox.val() + '@' + domainBox.val());
		}
	})
	
	$('#domainBox').keyup(function(){
		userEmail.val(localBox.val() + '@' + domainBox.val());
		var domainBoxVal = $('#domainBox').val(),
		domainEmail = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		
		if(domainBoxVal == "" || domainBoxVal == null || domainBoxVal == " "){
    		$('#emailCheck').css('display', 'none');
    	}
		
		if(!domainEmail.test(domainBoxVal) && domainBox != ""){
          	$('#emailCheck').css('display', 'contents');
          	$('#emailCheck').val(0);
		}else{
			$('#emailCheck').css('display', 'none');
          	$('#emailCheck').val(1);
		}
	
	});
	/* 사용자 이메일 유효성 검사 */
	
	/* 등록 전 공백 검사 */
	$('#modifyBtn').click(function(){
		
		var 
		userFirstName = $('#userFirstName').val(),
		userMiddleName = $('#userMiddleName').val(),
		userPw = $('#userPw').val(),
		userPwCheck = $('#userPwCheck').val(),
		userPhone = $('#userPhone').val(),
		userHomePhone = $('#userHomePhone').val(),
		userEmail = $('#userEmail').val(),
		userZipCode = $('#userZipCode').val(),
		userAddr = $('#userAddr').val(),
		userAddrDetail = $('#userAddrDetail').val(),
		userDept = $('#userDept option:selected').val(),
		userRank = $('#userRank option:selected').val(),
		userPosition = $('#userPosition option:selected').val(),
		nameCheckVal = $('#nameCheck').val(),
		pwCheckVal = $('#pwCheck').val(),
		phoneMVal = $('#phoneM').val(),
		phoneLVal = $('#phoneL').val(),
		homePhoneMVal = $('#homePhoneM').val(),
		homePhoneLVal = $('#homePhoneL').val(),
		localBoxVal = $('#localBox').val(),
		domainBoxVal = $('#domainBox').val(),
		emailCheckVal = $('#emailCheck').val();
		
		console.log(nameCheckVal)
		
		if(userFirstName == 'undefined' || userFirstName == null || userFirstName == ''){
			alert('사용자 성을 입력해주세요');
			$('#userFirstName').focus();
			return false;
		} 
	
		if(userMiddleName == 'undefined' || userMiddleName == null || userMiddleName == ''){
			alert('사용자 이름을 입력해주세요');
			$('#userMiddleName').focus();
			return false;
		}
		
		if(userPw == 'undefined' || userPw == null || userPw == ''){
			alert('비밀번호를 입력해주세요');
			$('#userPw').focus();
			return false;
		}
		
		if(userPwCheck == 'undefined' || userPwCheck == null || userPwCheck == ''){
			alert('비밀번호 확인란을 입력해주세요');
			$('#userPwCheck').focus();
			return false;
		}
		
		if(userPwCheck != userPw){
			alert('비밀번호 확인이 다릅니다.');
			$('#userPwCheck').focus();
			return false;
		}
		
		if(phoneMVal == 'undefined' || phoneMVal == null || phoneMVal == ''){
			alert('사용자 연락처를 입력해주세요');
			$('#phoneM').focus();
			return false;
		}
		
		if(phoneLVal == 'undefined' || phoneLVal == null || phoneLVal == ''){
			alert('사용자 연락처를 입력해주세요');
			$('#phoneL').focus();
			return false;
		}
		
		if(localBoxVal == 'undefined' || localBoxVal == null || localBoxVal == ''){
			alert('이메일을 입력해주세요');
			$('#localBox').focus();
			return false;
		}
		
		if(domainBoxVal == 'undefined' || domainBoxVal == null || domainBoxVal == ''){
			alert('이메일을 입력해주세요');
			$('#domainBox').focus();
			return false;
		}
		
		if(userDept == '' || userDept == null){
			alert('부서를 선택해주세요');
			$('#userDept').focus();
			return false;
		}
		
		if(userRank == '' || userRank == null){
			alert('직급을 선택해주세요');
			$('#userRank').focus();
			return false;
		}
		
		if(userPosition == '' || userPosition == null){
			alert('직책을 선택해주세요');
			$('#userPosition').focus();
			return false;
			
		} else {
			var result = confirm('사용자를 등록 하시겠습니까?');
			if(result == true) {
	           //yes
	        	alert('사용자가 등록 되었습니다.');
	        	$('#userRegForm').submit();
	        	
	        } else {
	            //no
	        	return false;
	        }
		}
	});
	/* 등록 전 공백 검사 */
});
</script>

</html>