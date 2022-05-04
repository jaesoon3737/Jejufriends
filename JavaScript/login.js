
$(function(){	
	$.validator.addMethod("regex", function(value, element, regex){
	  var regExp = new RegExp(regex);
	  return regExp.test(value);
	});
    $("#fLogin").validate({		
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
		    	 },
		    pwd: {
		    	required: true,
		    	regex: "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$"
		    }

		},
		
        messages: {
			email: {
		    	required: "필수 입력 항목 입니다.",
		    	email: "이메일을 입력하세요.", 
		    	minlength: "이메일을 입력하세요",
		    	remote : "존재하지 않는 아이디입니다."
		    },
		    pwd: {
		    	required: "필수 입력 항목 입니다.",
		    	regex: "10글자 이상 특수문자 , 문자 , 숫자를 조합하여 입력하세요",
		    	minlength: "10글자 이상 특수문자 , 문자 , 숫자를 조합하여 입력하세요"
		    }
        }
    });

})