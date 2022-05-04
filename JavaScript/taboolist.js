	$(function(){
	    let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
	    let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
	    let csrfToken = $('meta[name="_csrf"]').attr('content');
		$('#tabooinsertBtn').on("click" , function() {
			const taboo = $('#tabooinsertinput').val();
				$.ajax({
					type: 'POST',
					data: JSON.stringify({tabooWordCheck:taboo}),
					contentType: 'application/json;charset=UTF-8',
					url: '/jejufriends/admin/insertTaboo',
					//dataType: 'application/json;charset=UTF-8',
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader(csrfHeader, csrfToken);
	                }  ,
					success: function(data) {
						if(data == 'fail'){
							alert('이미 존재하는 금칙어 입니다. ');
							
						} else {
							alert('금칙어 '+ data +'(이) 가 추가 되었습니다. ');
						}
					},
					error:function(data){
						alert('error 재 로그인 후 진행해주세요.');
					}
					});
			});
		}); 
 