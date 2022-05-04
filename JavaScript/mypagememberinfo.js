    // 비밀번호 강도 검증 
	$(function(){	
			let pwdcheck = false;
			$('#newPwd').on("keyup"  , function(){
				let pwdval =  $('#newPwd').val();
				let pcheck1  = /[0-9]/;
				let pcheck2  = /[a-zA-Z]/;
				let pcheck3  = /[!@#$%^&*]/;
				let pcheck4  = /^[0-9]+$/;
				if(pcheck1.test(pwdval) && pcheck2.test(pwdval) && pcheck3.test(pwdval)){
					$('#messagespwd').text("사용가능한 비밀번호 입니다.");
					$('#messagespwd').css( "color", "green" );
				
				} else if ( (pcheck1.test(pwdval) && pcheck2.test(pwdval)) || (pcheck2.test(pwdval) && pcheck3.test(pwdval)) || (pcheck1.test(pwdval) && pcheck3.test(pwdval)) ){
					$('#messagespwd').text("적절하지 않은 비밀번호입니다.");
					$('#messagespwd').css( "color", "orange" );
					
				} else {
					$('#messagespwd').text("적절하지 않은 비밀번호입니다.");
					$('#messagespwd').css( "color", "red" );
					
				}				
			});
		});
     // 비밀번호 변경 
  	  $(function(){
			var check = "<c:out value='${errorAlertPassword}'/>";
  			if(check == 'errorNumber' ){
  				alert("비밀번호가 맞지 않습니다.");
  			} else if(check == 'sucess'){
  				alert("비밀번호가 변경되었습니다.");
  			} else if(check == 'errorNumberValid'){
  				alert("올바른 형식의 비밀번호를 작성해주세요.");
  			}
  	  });

 		$(function(){
			const btn = document.querySelector('#changePassword');
			$("#pwdCheck").on("keyup", function(){
					if($('#newPwd').val()!=$('#pwdCheck').val()){
						$("#checkPw").html("비밀번호가 일치하지 않습니다.");
						$("#checkPw").css('color', 'gray');	
					} else {
						$("#checkPw").html("비밀번호가 일치합니다.");
						$("#checkPw").css('color', 'green');	
						btn.disabled = false;
						}	
					});
			});
	    //닉네임 검증
		$(function(){
			$('#nickName').on("keyup" , function(){
				$.ajax({
					type:'GET',
					url:'/jejufriends/member/mypage/nickNameTabooCheck',
					data:{nickName:$('#nickName').val()},
					success: function(data) {
							$('#messagenick').text(""+data+"");
							$('#messagenick').css('font-weight' ,  "bold");
					},
					error:function(data){
					}
	
					});
				});
			});
		//정보 변경 
		$(function(){
		    let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
		    let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
		    let csrfToken = $('meta[name="_csrf"]').attr('content');
			$('#changeInfo').click(function(){
			   $.ajax({
					type:'post',
					url:'/jejufriends/rest/updateinfo',
					dataType: 'json',
					data: {
						nickName: $('#nickName').val(),
						phoneNumber: $('#phoneNumber').val()	
					} ,
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader(csrfHeader, csrfToken);
	                }  ,
					success: function(data) {
						if(data==0){
							alert("정보변경에 성공하였습니다.");
							 location.href = "/jejufriends/member/mypage/memberinfo";
						} else if (data==1){
							alert("올바른 핸드폰 번호를 입력해주세요.");
						} else if (data==2){
							alert("불건전한 닉네임을 사용하였습니다 재입력해주세요.");
						} else if(data==3){
							alert("업데이트 실패 ");
						} else if(data==4){
							alert("형식에 맞게 입력해주세요. (닉네임 3글자 이상 , 불건전 닉네임 금지)");
						}
					},
					error:function(xhr, status){
						alert(xhr + " : " + status);
					}
	
					});
				});
			});
		
		// 비밀번호 변경 
		$(function(){
		    let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
		    let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
		    let csrfToken = $('meta[name="_csrf"]').attr('content');
			$('#changePassword').click(function(){
			   $.ajax({
					type:'post',
					url:'/jejufriends/rest/updatepassword',
					dataType: 'json',
					data: {
						pwd: $('#pwd').val(),
						newPwd: $('#newPwd').val()	
					} ,
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader(csrfHeader, csrfToken);
	                }  ,
					success: function(data) {
						if(data==1){
							alert("비밀번호 변경에 성공하였습니다.");
							 location.href = "/jejufriends/member/mypage/memberinfo";
						} else if (data==2){
							alert("비밀번호는 특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요");
						} else if (data==3){
							alert("입력 값을 양식에 맞춰 입력해주세요.");
						} else if (data==4){
							alert("현재 비밀번호가 맞지 않습니다. 재 인증해주세요.");
						}
					},
					error:function(xhr, status){
						alert(xhr + " : " + status);
					}
	
					});
				});
			});

		$(function(){
			$(".memberinfoBtn").on("click", function() {
				 
				var str = ""
				var check = $(this);
				var tr = check.parent().parent();
				var td = tr.children();
			    let email  = td.eq(1).text();
			    (function () {
			        var popUrl = "/jejufriends/admin/memberInfo/" + email;
			        var popOption = "width=900px,height=600px,scrollbars=yes";
			        window.open(popUrl,'제주프렌즈 회원정보' , popOption);
			    })();
			});
		});

		function deletePopup(){
			  var popup = window.open('/jejufriends/member/withdraw', '회원 탈퇴', 'width=400px,height=600px,scrollbars=yes');
			}
			