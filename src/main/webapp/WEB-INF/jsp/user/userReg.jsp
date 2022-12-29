<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록 화면</title>

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
				<li class="breadcrumb-item">사용자 등록</li>
			</ol>
		</nav>
	</div>
	
	<form action="/user/userReg.do" method="post" id="userRegForm" style="margin: auto;">
		<table>
			<tr>
				<td><span class="target">*</span>사용자 성</td>
				<td><input type="text" id="userFirstName" class="form-control userRegInfo" name="userFirstName" /></td>
				<td><span class="target">*</span>사용자 이름</td>
				<td><input type="text" id="userMiddleName" class="form-control userRegInfo" name="userMiddleName" /></td>
			</tr>
			<tr id="nameCheck" style="height: 30px; display: none; padding: 5px; font-size: 12px">
				<td style="padding: 5px;" colspan="4" class="alert alert-danger">정확한 값을 입력해주세요.</td>
			</tr>
			<tr>
				<td><span class="target">*</span>아이디</td>
				<td><input type="text" id="userId" class="form-control userRegInfo" name="userId"/></td>
				<td>
					<input type="button" id="userIdCheck" class="btn btn-gray-800" value="중복 확인"/>
					<input id="confirmIdCheck" hidden/>
				</td>
				<td id="idCheckSuccess" class="alert alert-success" style="padding: 5px; font-size: 12px; display: none; margin-bottom: 0px;">사용가능한 아이디입니다.</td>
				<td id="idCheckFail" class="alert alert-danger" style="padding: 5px; font-size: 12px; display: none; margin-bottom: 0px;">이미 사용중인 아이디입니다.</td>
			</tr>
			<tr id="idCheck" style="height: 30px; display: none; padding: 5px; font-size: 12px">
				<td style="padding: 5px;" colspan="4" class="alert alert-danger">아이디는 6~12자리 숫자, 영문 조합으로 작성해주세요.</td>
			</tr>
			<tr>
				<td><span class="target">*</span>비밀번호</td>
				<td><input type="password" id="userPw" class="form-control userRegInfo" name="userPw" /></td>
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
				<td><span class="target">*</span>연락처</td>
				<td colspan="4">
					<select id="phoneF" class="form-select phone" style="float: left;">
						<option selected>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
					<input type="text" id="phoneM" class="form-control phone" style="float: left;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" />
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
					<input type="text" id="phoneL" class="form-control phone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" />
				</td>
				<input type="hidden" id="userPhone" name="userPhone"/>
			</tr>
			<tr>
				<td>자택 전화번호</td>
				<td colspan="4">
					<select id="homePhoneF" class="form-select phone" style="float: left;">
						<option selected>02</option>
						<option>031</option>
						<option>032</option>
						<option>042</option>
						<option>044</option>
						<option>051</option>
						<option>052</option>
						<option>062</option>
						<option>063</option>
						<option>064</option>
					</select>
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
					<input type="text" id="homePhoneM" class="form-control phone" style="float: left;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3" />
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> - </span>
					<input type="text" id="homePhoneL" class="form-control phone" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" />
					<input type="hidden" id="userHomePhone" name="userHomePhone"/>
				</td>
			</tr>
			<tr>
				<td><span class="target">*</span>개인 이메일</td>
				<td colspan="4">
					<input type="text" id="localBox" class="form-control email" style="float: left;" maxlength="15" />
					<span style="float: left; margin-right: 10px; margin-top: 8px;"> @ </span>
					<input type="text" id="domainBox" class="form-control email" style="float: left;" />
					<select id="selectDomain" class="form-select email">
						<option selected>직접입력</option>
						<option>daum.com</option>
						<option>gmail.com</option>
						<option>hanmail.net</option>
						<option>nate.com</option>
						<option>naver.com</option>
						<option>outlook.com</option>
						<option>yahoo.com</option>
					</select>
					<input type="hidden" id="userEmail" name="userEmail"/>
				</td>
			</tr>
			<tr id="emailCheck" style="height: 30px; display: none; padding: 5px; font-size: 12px">
				<td style="padding: 5px;" colspan="4" class="alert alert-danger">이메일 형식을 맞추어 작성해주세요.</td>
			</tr>
			<tr>
				<td>자택 주소</td>
				<td><input type="text" id="userZipCode" class="form-control userRegInfo" name="userZipCode"  readonly/></td>
				<td><input type="button" id="searchZipCode" class="btn btn-gray-800" value="우편번호 검색"/></td>
			</tr>
			<tr class="target">
				<td><input type="hidden" value="userAddr"/></td>
				<td colspan="3"><input type="text" id="userAddr" class="form-control" name="userAddr" readonly/></td>
			</tr>
			<tr class="target">
				<td><input type="hidden" value="userAddrDetail"/></td>
				<td colspan="3"><input type="text" id="userAddrDetail" class="form-control" name="userAddrDetail" /></td>
			</tr>
			<tr>
				<td><span class="target">*</span>소속 부서</td>
					<td>
						<select class="form-select" id="userDept" name="userDept">
							<option value="">::: 부서를 선택하세요 :::</option>
							<c:forEach items="${deptList}" var="d">
								<option value="${d.deptName}">${d.deptName}</option>
							</c:forEach>
						</select>
					</td>
			</tr>
			<tr>
				<td><span class="target">*</span>직급</td>
				<td>
					<select class="form-select" id="userRank" name="userRank">
						<option value="">::: 직급을 선택하세요 :::</option>
						<c:forEach items="${rankList}" var="r">
							<option value="${r.rankName}">${r.rankName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><span class="target">*</span>직책</td>
				<td>
					<select class="form-select" id="userPosition" name="userPosition">
						<option value="">::: 직책을 선택하세요 :::</option>
						<c:forEach items="${positionList}" var="p">
							<option value="${p.positionName}">${p.positionName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<div style=" text-align: center;">
			<button id="userRegBtn" type="button" class="btn btn-primary" style=" display: inline-block; width: 100px; margin-top: 20px;">등록</button>
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
		var out = confirm('사용자 등록을 취소하고 나가시겠습니까?');
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
	
	/* 사용자 아이디 유효성 검사 */
	$('#userId').keyup(function(){
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/gi, '' ) ); 
		var userIdVal = $('#userId').val(),
		userId = $('#userId'),
		id = /^[A-Za-z0-9]{6,12}$/;
		console.log($('#idCheck').val());
		if(userIdVal == "" || userIdVal == null || userIdVal == " "){
			$('#idCheck').css('display', 'none');
		}
		if(!id.test(userIdVal) && userIdVal != ""){
			$('#idCheck').css('display', 'contents');
			$('#idCheck').val(0);
		} else {
          	$('#idCheck').css('display', 'none');
          	$('#idCheck').val(1);
			
		}
	});
	/* 사용자 아이디 유효성 검사 */
	
	/* 중복확인 ajax */
	$('#userIdCheck').click(function(){
		var userId = $('#userId').val();
		
		if(userId == 'undefined' || userId == null || userId == ''){
			alert('중복확인 전에 아이디를 입력해주세요.');
			return false;
		}
		
		if($('#idCheck').val() < 1){
			alert('아이디를 규정에 맞춰 다시 작성해주세요.');
			$('#userId').focus();
			return false;
		} else {
			$.ajax({
				url: '/user/idCheck.do',
				method: 'POST',
				data: {'userId' : userId},
				success: (function(result){
					console.log('result', result);	
					if(result != 0){
						alert('중복된 아이디입니다. 다른 아이디를 사용해주세요.');
						$('#userId').focus();
						$('#idCheckSuccess').css('display', 'none');
			          	$('#idCheckFail').css('display', 'block');
			          	$('#confirmIdCheck').val(0);
						return false;
					} else {
						alert('사용가능한 아이디입니다.');
						var confirmIdCheck = $('#confirmIdCheck').val();
						$('#idCheckSuccess').css('display', 'block');
			          	$('#idCheckFail').css('display', 'none');
			          	$('#confirmIdCheck').val(1);
						return true;
					}
				}),
				error: (function(a,b,c){
					alert('에러',a,b,c);
				})
			});
		}
	})
	/* 중복확인 ajax */
	
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
    	
		if($('#pwCheck').val() == 1){
	    	if(userPwCheck == "" || userPwCheck == null || userPwCheck == " "){
	    		$('#pwCompareFail').css('display', 'none');
	          	$('#pwComparePass').css('display', 'none');
	    	}
	
	        if(userPw != userPwCheck && userPwCheck != ""){
	          	$('#pwCompareFail').css('display', 'contents');
	          	$('#pwComparePass').css('display', 'none');
	        } else if(userPw == userPwCheck && userPwCheck != "") {
	        	$('#pwCompareFail').css('display', 'none');
	          	$('#pwComparePass').css('display', 'contents');
	          	return true;
	        }
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
	$('#userRegBtn').click(function(){
		
		var 
		userFirstName = $('#userFirstName').val(),
		userMiddleName = $('#userMiddleName').val(),
		userId = $('#userId').val(),
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
		idCheckVal = $('#idCheck').val(),
		confirmIdCheckVal = $('#confirmIdCheck').val(),
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
		
		if(nameCheckVal != 1){
			alert('이름을 형식에 맞게 입력해주세요.');
			$('#userFirstName').focus();
			return false;
		}
	
		if(userId == 'undefined' || userId == null || userId == ''){
			alert('아이디를 입력해주세요');
			$('#userId').focus();
			return false;
		}
		
		if(idCheckVal != 1){
			alert('아이디를 형식에 맞게 입력해주세요.');
			$('#userId').focus();
			return false;
		}
		
		if(confirmIdCheckVal != 1){
			alert('아이디 중복검사를 해주세요');
			$('#confirmIdCheck').focus();
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
		
		if(pwCheckVal != 1){
			alert('비밀번호를 형식에 맞게 입력해주세요.');
			$('#userPw').focus();
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
		
		if(phoneMVal.length < 4){
			alert('연락처를 형식에 맞게 입력해주세요');
			$('#phoneM').focus();
			return false;
		}
		
		if(phoneLVal == 'undefined' || phoneLVal == null || phoneLVal == ''){
			alert('사용자 연락처를 입력해주세요');
			$('#phoneL').focus();
			return false;
		}
		
		if(phoneLVal.length < 4){
			alert('연락처를 형식에 맞게 입력해주세요');
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
		
		if(emailCheckVal != 1){
			alert('이메일을 형식에 맞게 입력해주세요.');
			$('#localBox').focus();
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