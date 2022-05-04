$(function(){
		$(".memberSuspendBtn").on("click" , function() {
			   var str = ""
			   var tdArr = new Array();
			   var checkBtn = $(this);
			   var tr = checkBtn.parent().parent();
			   var td = tr.children();
			   let idNumber  = td.eq(0).text();
			   let enabled = td.eq(4).text();

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
							alert("회원 번호 " + td.eq(0).text() +" (아이디 : "+ td.eq(1).text() +") 에 대한 계정처리가 완료되었습니다.");
							window.location.reload();
						}
					
					},
					error:function(data){
						alert('error 재 로그인 후 진행해주세요.');
					}
					});
			});
		});
	
	
	$(function(){
		$(".memberCautionBtn").on("click" , function() {
			   var str = ""
			   var tdArr = new Array();
			   var checkBtn = $(this);
			   var tr = checkBtn.parent().parent();
			   var td = tr.children();
			   let idNumber  = td.eq(0).text();
				   var f = confirm("회원명 "+td.eq(1).text()  + "를 경고처리 하시겠습니까 ?");
			if(f){
			   $.ajax({
					type: 'get',
					data: {idNumber:idNumber},
					contentType: 'application/json;charset=UTF-8',
					url: "/jejufriends/admin/cautionAccount" ,
	
					//dataType: 'application/json;charset=UTF-8',
					success: function(data) {
						if(data == '1'){
							
							alert("회원 번호 " + td.eq(0).text() +" (아이디 : "+ td.eq(1).text() +") 경고처리 되었습니다.");
							window.location.reload();
						} else {
							alert("경고처리에 실패하였습니다. 확인바람니다.");
						}
					
					},
					error:function(data){
						alert('error 재 로그인 후 진행해주세요.');
					}
					});
				}
			});
		});

	