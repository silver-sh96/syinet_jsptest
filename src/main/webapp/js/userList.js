$(function(){
	
	"use strict";
	
	/* searchKey 값 고정 */
		var selectedKey = $("#searchKey option:selected").val();
		console.log(selectedKey,'selectedKey');
		
		$('#searchKey').val(selectedKey).attr('selected','selected');
		/* searchKey 값 고정 */
		
		/* 검색버튼 클릭 이벤트 */
		$('#searchBtn').click(function(){
			var searchValue = $('#searchValue').val();
			console.log(searchValue,'searchValue');
			if(searchValue == 'undefined' || searchValue == null || searchValue == '' || searchValue == ' '){
				alert('검색값을 입력해주세요.');
				return false;
			}
		});
		/* 검색버튼 클릭 이벤트 */
		
		/* 사용자 목록 개수 변경 이벤트 */
		var cntPerPage = $('#cntPerPage');
		cntPerPage.change(function(){
			$('#searchForm').submit();	
		});
		/* 사용자 목록 개수 변경 이벤트 */
		
		/* 체크박스 전체선택 이벤트 */
		var allSelect = $('#allSelect');
		var userSelect = $('.userSelect');
		
		allSelect.click(function(){
			if(allSelect.is(":checked")) userSelect.prop("checked", true);
			else userSelect.prop("checked", false);
		})
		
		userSelect.click(function(){		
			var cntPerPageLen = $('#cntPerPage').val();
			var checked = $("input:checkbox[name=checkedUser]:checked").length;
			
			if(checked < cntPerPageLen){
				allSelect.prop("checked", false);
			}else{
				allSelect.prop("checked", true);
			}
		})
		/* 체크박스 전체선택 이벤트 */
		
		/* 수정버튼 이벤트 */
		$('#modifyBtn').click(function(){
			var selList = [];
			var checkbox = $("input[name=checkedUser]:checked");
			checkbox.each(function(i){
				var userId = $(this).val();
				console.log(userId, 'userId');
				selList.push(userId);
				console.log(selList, 'selList');
			});
			if(selList.length > 1){
				alert('수정은 1명만 선택할 수 있습니다 !');
				$('#allSelect').prop("checked",false);
				checkbox.prop("checked",false);
				return false;
			}else if(selList.length < 1){
				alert('수정할 대상을 선택해주세요 !');
			}else{
				location.href = "/user/userModify.do?userId=" + selList
			}
		});
		/* 수정버튼 이벤트 */
		
		/* 삭제버튼 이벤트 */
		$('#delBtn').click(function(){
			var checkbox = $("input[name=checkedUser]:checked");
			console.log(checkbox.length);
			
			if(checkbox.length < 1){
				alert('삭제할 대상을 선택해주세요.');
				return false;
			} else {
				var result = confirm('정말 사용자를 삭제하시겠습니까?');
				if(result == true) {
		           //yes
		        	alert('성공적으로 삭제 되었습니다.');
		           
		        	checkbox.each(function(i){
		    			var userId = $(this).val();
		    			console.log(userId, 'userId');
		    			
		    			var request =
		    				$.ajax({
		    					url: "/user/userDelete.do",
		    					type: "POST",
		    					data : {
		    							"userId" : userId
		    					},
		    					success: function(data){
		    						location.href='/user/userList.do'
		    					}
		    				});
		    				request.fail(function( jqXHR, textStatus ) {
		    					alert( "Request failed: " + textStatus );
		    				});
		    		});
		        } else {
		            //no
		        	alert('정상적으로 취소되었습니다.');
		        	location.href = "/user/userList.do";
		        	return false;
		        }
			}
		});
		/* 삭제버튼 이벤트 */
		
		/* 이름 클릭 이벤트 */
		$('.targetName').hover(function(){
			$(this).css("color", "skyblue");
		}, function(){
			$(this).css("color", "black");
		});
		
		$('.targetName').click(function(){
			console.log($(this).text());
			var tr = $(this).parent().parent();
			console.log(tr);
			var targetId = tr.find('.targetId').text();
			console.log(targetId, 'targetId');
			
			location.href = "/user/userModify.do?userId=" + targetId;
		})
		/* 이름 클릭 이벤트 */
	
	
	
	
});