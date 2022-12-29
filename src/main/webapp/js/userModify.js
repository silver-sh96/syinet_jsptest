$(function(){
	
	"use strict";
	
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
	$('#userFirstName').blur(function(){
		var userFirstNameVal = $('#userFirstName').val(),
		userFirstName = $('#userFirstName'),
		name = /([^가-힣\x20])/i;
		
		if(name.test(userFirstNameVal)){
			alert('정확한 값을 입력하세요');
			userFirstName.val('');
			userFirstName.focus();
			return false;
		}
	});
	/* 사용자 성 유효성 검사 */
	
	/* 사용자 이름 유효성 검사 */
	$('#userMiddleName').blur(function(){
		var userMiddleNameVal = $('#userMiddleName').val(),
		userMiddleName = $('#userMiddleName'),
		name = /([^가-힣\x20])/i;
		
		if(name.test(userMiddleNameVal)){
			console.log('name.test', userMiddleNameVal)
			alert('정확한 값을 입력하세요');
			userMiddleName.val('');
			userMiddleName.focus();
			return false;
		}
	});
	/* 사용자 이름 유효성 검사 */
	
	/* 사용자 비밀번호 유효성 검사 */
	$('#userPw').blur(function(){
		var userPwVal = $('#userPw').val(),
		userPw = $('#userPw'),
		password = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/,
		again = /(\w)\1\1\1/;
		
		
		if(!password.test(userPwVal)){
			alert('비밀번호는 영어, 숫자, 특문을 포함한 8~15자리만 가능합니다.');
			userPw.val('');
			userPw.focus();
			return false;
		}
		
		if(again.test(userPwVal)){
			alert('비밀번호는 동일한 문자를 4회이상 연속으로 사용할 수 없습니다.');
			userPw.val('');
			userPw.focus();
			return false;
		} else {
			/* 비밀번호 확인 체크 실시간 */
		    $('#userPwCheck').keyup(function(){
		
		        if($('#userPw').val() != $('#userPwCheck').val()){
		          	$('#alert-danger').css('display', 'contents');
		          	$('#alert-success').css('display', 'none');
		          	return false;
		        } else{
		        	$('#alert-danger').css('display', 'none');
		          	$('#alert-success').css('display', 'contents');
		          	return true;
		        }
		
		    });
			/* 비밀번호 확인 체크 실시간 */
		}
		
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
    
		if(ascSeqCharCnt > 1 || descSeqCharCnt > 1){
			alert("비밀번호에 4회이상 연속되는 문자열을 사용할 수 없습니다.");
			userPw.val('');
			userPw.focus();
			return false;
		}
		/* 연속 문자 확인 */
		
	});
	/* 사용자 비밀번호 유효성 검사 */
	
	/* 사용자 연락처 유효성 검사 */
	$('#userPhone').blur(function(){
		var userPhoneVal = $('#userPhone').val(),
		userPhone = $('#userPhone'),
		phone = /^\d{2,3}\d{3,4}\d{4}$/;
		
		if(!phone.test(userPhoneVal)){
			alert('전화번호는 -를 제외한 9~11자리 숫자를 입력해주세요.');
			userPhone.val('');
			userPhone.focus();
			return false;
		}
	});
	/* 사용자 연락처 유효성 검사 */
	
	/* 사용자 집 연락처 유효성 검사 */
	$('#userHomePhone').blur(function(){
		var userHomePhoneVal = $('#userHomePhone').val(),
		userHomePhone = $('#userHomePhone'),
		phone = /^\d{2,3}\d{3,4}\d{4}$/;
		
		if(!phone.test(userHomePhoneVal)){
			alert('전화번호는 -를 제외한 9~11자리 숫자를 입력해주세요.');
			userHomePhone.val('');
			userHomePhone.focus();
			return false;
		}
	});
	/* 사용자 집 연락처 유효성 검사 */
	
	/* 사용자 이메일 유효성 검사 */
	$('#userEmail').blur(function(){
		var userEmailVal = $('#userEmail').val(),
		userEmail = $('#userEmail'),
		email = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
		
		if(!email.test(userEmailVal)){
			alert('이메일 형식을 지켜서 작성해주세요.');
			userEmail.val('');
			userEmail.focus();
			return false;
		}
	});
	/* 사용자 이메일 유효성 검사 */
	
	/* 등록 전 공백 검사 */
	$('#modifyBtn').click(function(){
		var 
		userFirstName = $('#userFirstName').val(),
		userMiddleName = $('#userMiddleName').val(),
		userId = $('#userId').val(),
		confirmIdCheck = $('#confirmIdCheck').val(),
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
		userPosition = $('#userPosition option:selected').val();
		
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
		
		if(userPhone == 'undefined' || userPhone == null || userPhone == ''){
			alert('사용자 연락처를 입력해주세요');
			$('#userPhone').focus();
			return false;
		}
		
		if(userHomePhone == 'undefined' || userHomePhone == null || userHomePhone == ''){
			alert('사용자 자택 연락처를 입력해주세요');
			$('#userHomePhone').focus();
			return false;
		}
		
		if(userEmail == 'undefined' || userEmail == null || userEmail == ''){
			alert('사용자 이메일을 입력해주세요');
			$('#userEmail').focus();
			return false;
		}
		
		if(userZipCode == 'undefined' || userZipCode == null || userZipCode == ''){
			alert('사용자 주소를 입력해주세요');
			$('#userZipCode').focus();
			return false;
		}
		
		if(userAddr == 'undefined' || userAddr == null || userAddr == ''){
			alert('사용자 주소를 입력해주세요');
			$('#userAddr').focus();
			return false;
		}
		
		if(userAddrDetail == 'undefined' || userAddrDetail == null || userAddrDetail == ''){
			alert('사용자 주소를 입력해주세요');
			$('#userAddrDetail').focus();
			return false;
		} else {
			var result = confirm('사용자를 수정 하시겠습니까?');
			if(result == true) {
	           //yes
	        	alert('정상적으로 수정 되었습니다.');
	        	$('#userModifyForm').submit();
	        	
	        } else {
	            //no
	        	return false;
	        }
			
		}
	});
	/* 등록 전 공백 검사 */
});