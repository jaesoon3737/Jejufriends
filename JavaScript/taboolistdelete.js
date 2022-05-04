	

	$(function(){
		$(".tabooBtn").on("click" , function() {
			   var str = ""
			   var tdArr = new Array();
			   var checkBtn = $(this);
			   var tr = checkBtn.parent().parent();
			   var td = tr.children();
			   let tabooWordNumbers  = td.eq(0).text();
				$.ajax({
					type: 'get',
					data: {tabooWordNumber:tabooWordNumbers},
					contentType: 'application/json;charset=UTF-8',
					url: "/jejufriends/admin/deletetaboo" ,
	
					//dataType: 'application/json;charset=UTF-8',
					success: function(data) {
						if(data == 'fail'){
							
							alert("금지어가 존재하지 않습니다. 확인 후 다시 시도해주세요.");
						} else {
							tr.css("text-decoration" , "line-through");
							alert("금지어 " + td.eq(1).text()+" 의 삭제 성공하였습니다.");
						}
					
					},
					error:function(data){
						alert('error 재 로그인 후 진행해주세요.');
					}
					});
			});
		});
 