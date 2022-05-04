
	let pwdChecked = false;
	const btn = document.querySelector('#signUpButton');
	$("#pwdCheck").focusout(function(){
			pwdCheckedf($(this).val())
	})
	function pwdCheckedf(pw){
		if(pw==""){
			$("#email").text("");
			return;
		}
		if($('#pwd').val()!=$('#pwdCheck').val()){
			$("#checkPw").html("비밀번호가 일치하지 않습니다.");
			$("#checkPw").css('color', 'white');
			$("#pwdCheck").val('');			
			pwdChecked = false;
		} else {
			$("#checkPw").html("비밀번호가 일치합니다.");
			$("#checkPw").css('font-weight' ,  "bold");
			pwdChecked = true;
			btn.disabled = false;
			}	
		}				

	$(function(){
		$('#nickName').on("keyup" , function(){
			$.ajax({
				type:'GET',
				url:'/jejufriends/signup/nickCheck',
				data:{nickName:$('#nickName').val()},
				success: function(data) {
						$('#messagenick').text(""+data+"");
						$('#messagenick').css('font-weight' ,  "bold");
						
						if(data == 1){
							$('#messagenick').text("불건전한 닉네임 입니다.");
						} else if(data == 2){
							$('#messagenick').text("사용 가능한 닉네임 입니다.");
						} else if(data == 3){
							$('#messagenick').text("사용 불가능한 닉네임 입니다.");
						}
				},
				error:function(data){
				}

				});
			});
		});

		$(function(){
			var regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			$('#email').on("keyup" , function(){
				$.ajax({
					type:'GET',
					url:'/jejufriends/signup/emailCheck',
					data:{email:$('#email').val()},
					success: function(data) {
							if($('#email').val().length >= 5 && regemail.test($('#email').val())){
								$('#messages').empty();
							} else {
								$('#messages').text("이메일 형식을 입력해주세요");
							}	
					},
					error:function(data){
						$('#messages').text(error);
					
					}
	
					});
				});
			});

				$(function(){
					var regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
					$('#checkEmailbutton').on("click" , function(){
						if($('#email').val().length == 0 || $('#email').val() == null ) return alert("이메일을 입력하세요.");
						$.ajax({
							type:'GET',
							url:'/jejufriends/signup/emailCheck',
							data:{email:$('#email').val()},
							success: function(data) {
								if(regemail.test($('#email').val())){
									$('#messages').text(""+data+"");
									$('#messages').css('font-weight' ,  "bold");
								} else {
									$('#messages').text("이메일을 입력해주세요.");
								}
							},
							error:function(data){
								$('#messages').text(error);
							}
			
							});
						});
					});

		$(function(){	
				let pwdcheck = false;
				const btn = document.querySelector('#signUpButton');
				$('#pwd').on("keyup"  , function(){
					let pwdval =  $('#pwd').val();
					let pcheck1  = /[0-9]/;
					let pcheck2  = /[a-zA-Z]/;
					let pcheck3  = /[!@#$%^&*]/;
					let pcheck4  = /^[0-9]+$/;
					if(pcheck1.test(pwdval) && pcheck2.test(pwdval) && pcheck3.test(pwdval)){
						$('#messagespwd').text("사용가능한 비밀번호입니다.");
						$('#messagespwd').css( "color", "aqua" );
						$('#messagespwd').css('font-weight' ,  "bold");
					} else if ( (pcheck1.test(pwdval) && pcheck2.test(pwdval)) || (pcheck2.test(pwdval) && pcheck3.test(pwdval)) || (pcheck1.test(pwdval) && pcheck3.test(pwdval)) ){
						$('#messagespwd').text("적절하지 않은 비밀번호입니다.");
						$('#messagespwd').css( "color", "yellow" );
						$('#messagespwd').css('font-weight' ,  "bold");
					} else {
						$('#messagespwd').text("적절하지 않은 비밀번호입니다.");
						$('#messagespwd').css( "color", "red" );
						$('#messagespwd').css('font-weight' ,  "bold");
						btn.disabled = true;
					}				
				});
			});	

	    $(function(){	
	    		$.validator.addMethod("regex", function(value, element, regex){
	    		  var regExp = new RegExp(regex);
	    		  return regExp.test(value);
	    		});
	    		
	    	
			    $("#fSign").validate({
			    	submitHandler: function() {
						var f = confirm("입력한 정보로 회원가입을 진행하시겠습니까 ?");
						if(f){
							return true;
						} else {
							return false;
						}
					},
					
					rules: {
						email: {
					    	required: true,
					    	minlength: 5,
					    	email: true ,
					    	remote: {
					    		url: '/jejufriends/signup/emailduplication',
					    		type: "get", 
					    		data:  { 
					    					email: function() {
					    	              			return $("#email").val();
					    	            	}
										}
					    		}
					    	 },
					    name: {
					    	required: true,
					    	minlength: 2,
					    	regex: "^[가-힣]+$"
					    },
					    nickName: {
					    	required: true,
					    	minlength: 3
					    },
					    phoneNumber: {
					    	required: true,
					    	regex: "^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$" 
					    },
					    pwd: {
					    	required: true,
					    	regex: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$"
					    },
					    pwdCheck: {
					    	required: true,
					    	equalTo: pwd
					    },
					    birth: {
					    	required: true
					    },
					    gender: {
					    	required: true
					    }
					},
					
			        messages: {
						email: {
					    	required: "필수 입력 항목 입니다.",
					    	email: "이메일을 입력하세요.", 
					    	remote: "이미 존재하는 아이디입니다."
					    },
					    name: {
					    	required: "필수 입력 항목 입니다.",
					    	minlength : "2글자 이상 입력하세요",
					    	regex: "올바른 이름을 입력해주세요."
					    },
					    nickName: {
					    	required: "필수 입력 항목 입니다.",
					    	minlength : "3글자 이상 입력하세요"
					    },
					    phoneNumber: {
					    	required: "필수 입력 항목 입니다.",
					    	regex: "휴대폰 번호를 입력하세요." 
					    },
					    pwd: {
					    	required: "필수 입력 항목 입니다.",
					    	regex: "10글자 이상 특수문자 , 문자 , 숫자를 조합하여 입력하세요",
					    	minlength: "10글자 이상 특수문자 , 문자 , 숫자를 조합하여 입력하세요"
					    },
					    pwdCheck: {
					    	required: "필수 입력 항목 입니다.",
					    	equalTo: "입력한 패스워드와 일치하지 않습니다."
					    },
					    birth: {
					    	required: "필수 입력 항목 입니다."
					    },
					    gender: {
					    	required: "필수 입력 항목 입니다."
					    }
			        }
			    });
	
		 })
