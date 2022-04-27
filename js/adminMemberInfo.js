	$(function(){
		$("#cautionCountBtnMemberInfoBtn").on("click" , function() {
		   let idNumber = $("#idNumber").val();
		   $.ajax({
				type: 'get',
				data: {
					idNumber:idNumber
				},
				contentType: 'application/json;charset=UTF-8',
				url: "/jejufriends/admin/cautionAccount" ,
				//dataType: 'application/json;charset=UTF-8',
				success: function(data) {
					if(data == '1'){
						
						alert("회원 번호 " +  idNumber +" 경고처리 되었습니다.");
					} else {
						alert("경고처리에 실패하였습니다. 확인바람니다.");
					}
				
				},
				error:function(data){
					alert('error 재 로그인 후 진행해주세요.');
				}
				});
		});
	});
	
	$(function(){
		$("#suspendMemberInfoBtn").on("click" , function() {
			   let idNumber = $("#idNumber").val();
			   let enabled = $("#enabled").val();
			   $.ajax({
					type: 'get',
					data: {
						idNumber:idNumber,
						enabled:enabled
					},
					contentType: 'application/json;charset=UTF-8',
					url: "/jejufriends/admin/suspendAccount" ,
					//dataType: 'application/json;charset=UTF-8',
					success: function(data) {
						if(data == '0'){
							alert("존재하지 않는 아이디 입니다.");
						} else {
							alert("회원 번호 " + idNumber +"에 대한 계정처리가 완료되었습니다. ");
						}
					
					},
					error:function(data){
						alert('error 재 로그인 후 진행해주세요.');
					}
					});
			});
		});
	$(function(){
		$("#AdminAuthorityBtn").on("click" , function() {
			   let idNumber = $("#idNumber").val();
			   let authority = $("#authority").val();
			   $.ajax({
					type: 'get',
					data: {
						idNumber:idNumber,
						authority:authority
					},
					contentType: 'application/json;charset=UTF-8',
					url: "/jejufriends/admin/adminAuthority" ,
					//dataType: 'application/json;charset=UTF-8',
					success: function(data) {
	
							alert("회원 번호 " + idNumber +"  " + data);

					
					},
					error:function(data){
						alert('error 재 로그인 후 진행해주세요.');
					}
					});
			});
		});