		$(function(){	
	  		$('#pwdCheck').on("keyup"  , function(){
				let pwdChecked = false;
				const btn = document.querySelector('#findPasswordButton');
				$("#pwdCheck").focusout(function(){
						pwdCheckedf($(this).val())
				})	
					if($('#pwd').val()!=$('#pwdCheck').val()){
						$("#checkPw").html("비밀번호가 일치하지않습니다.");
						pwdChecked = false;
						btn.disabled = true;
					} else {
						$("#checkPw").html("비밀번호가 일치합니다.");
						$("#checkPw").css('font-weight' ,  "bold");
						pwdChecked = true;
						btn.disabled = false;
					}	
			  });
		});
			$(function(){	
				$('#pwd').on("keyup"  , function(){
					let pwdval =  $('#pwd').val();
					let pcheck1  = /[0-9]/;
					let pcheck2  = /[a-z]/;
					let pcheck3  = /[!@#$%^&*]/;
					if(pcheck1.test(pwdval) && pcheck2.test(pwdval) && pcheck3.test(pwdval)){
						$('#messagespwd').text("사용가능한 비밀번호입니다.");
						$('#messagespwd').css( "color", "green" );
						$('#messagespwd').css('font-weight' ,  "bold");
					} else if ((pcheck1.test(pwdval) && pcheck2.test(pwdval)) || (pcheck2.test(pwdval) && pcheck3.test(pwdval)) || (pcheck1.test(pwdval) && pcheck3.test(pwdval)) ){
						$('#messagespwd').text("적합하지 않은 비밀번호 입니다.");
						$('#messagespwd').css( "color", "yellow" );
						$('#messagespwd').css('font-weight' ,  "bold");
					}else {
						$('#messagespwd').text("적합하지 않은 비밀번호 입니다.");
						$('#messagespwd').css( "color", "red" );
						$('#messagespwd').css('font-weight' ,  "bold");
					}				
				});
			});