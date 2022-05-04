	$(function(){
		$('#mail-check-btn').on("click" , function() {
			const email = $('#email').val();
			const checkInput = $('#checkNumber'); 
			var regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(regemail.test(email)){
				$.ajax({
					type: 'get',
					data: {email:email},
					url: '/jejufriends/forgetPassword',
					success: function(data) {
						checkInput.attr('disabled', false);
						alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확히 입력하세요!');
					}
					});
			} else {
				alert('이메일 형식을 입력하세요.');
			}
			});
		});
  	  $(function(){
  			const btn = document.querySelector('#checkNumber');
			var check = "<c:out value='${errorAlertNumber}'/>";
  			if(check == 'errorNumber' ){
  				btn.disabled = false;
  			}
  	  });
  	  $(function(){
			const btn = document.querySelector('#mailcheck');
			$("#checkNumber").on("keyup" ,function(){
				if($('#checkNumber').val().length == 6){
					btn.disabled = false;
				} else {
					btn.disabled = true;
				}	
			});
  	  });

  	$(function(){	
  		$.validator.addMethod("regex", function(value, element, regex){
  		  var regExp = new RegExp(regex);
  		  return regExp.test(value);
  		});
  	    $("#restPwdf").validate({		
  			rules: {
  				email: {
  			    	required: true,
  			    	minlength: 5,
  			    	email: true ,
  			    	remote: {
  			    		url: '/jejufriends/login/emailduplication',
  			    		type: "get", 
  			    		data:  { 
  			    					email: function() {	
  			    	              			return $("#email").val();
  			    	            	}
  								}
  			    		}
  			    	 }

  			},
  			
  	        messages: {
  				email: {
  			    	required: "필수 입력 항목 입니다.",
  			    	email: "이메일을 입력하세요.", 
  			    	minlength: "이메일을 입력하세요",
  			    	remote : "존재하지 않는 아이디입니다. 다시 입력해주세요"
  			    }
  	        }
  	    });

  	})