//회원탈퇴 비밀번호
$(function(){
			const btn = document.querySelector('#deleteuserbutton');
	$("#pwdCheck").on("keyup", function(){
			if($('#pwd').val()!=$('#pwdCheck').val()){
				$("#checkPw").html("비밀번호가 일치하지 않습니다.");
				$("#checkPw").css('color', 'white');	
			} else {
				$("#checkPw").html("비밀번호가 일치합니다.");
				$("#checkPw").css('color', 'white');	
				$("#checkPw").css('font-weight', 'bold');	
					btn.disabled = false;
					}	
				});
		});
//회원탈퇴
$(function(){
let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
let csrfToken = $('meta[name="_csrf"]').attr('content');
$('#deleteuserbutton').click(function(){
   $.ajax({
		type:'post',
		url:'/jejufriends/rest/userdelete.json',
		contentType: "application/json",
		dataType: 'json',
		data: JSON.stringify({pwd:$('#pwd').val()}),
	    beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }  ,
		success: function(data) {
			if(data==1){
				alert("회원탈퇴에 성공했습니다. 회원님의 정보는 7일 간 보존됩니다.");
				window.close();
				opener.parent.location= "/jejufriends";
			} else if (data==2){
				alert("비밀번호 인증에 실패하였습니다 다시 인증을 진행해주세오.");
			} else if (data==3){
				alert("비밀번호 형식이 맞지 않습니다.");
			} else if (data==4){
				alert("회원탈퇴에 성공했습니다. 회원님의 정보는 7일 간 보존됩니다.");
				window.close();
				opener.parent.location= "/jejufriends/login";
			} else {
				alert("회원 탈퇴 실패 관리자에게 문의하세요.");
			}
		},
		error:function(xhr, status){
			alert(xhr + " : " + status);
		}

		});
	});
});