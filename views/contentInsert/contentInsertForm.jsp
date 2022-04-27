<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>JEJU FRIENDS</title>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta charset="utf-8"/>
<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://rlgh2587.cafe24.com/myshop/index.html" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gamja+Flower&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/fonts/iconic/css/material-design-iconic-font.min.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/fonts/linearicons-v1.0.0/icon-font.min.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css"/>
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css"/>
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/vendor/slick/slick.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/vendor/MagnificPopup/magnific-popup.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/vendor/perfect-scrollbar/perfect-scrollbar.css"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/css/mypageinfo.css"  />
   <link rel="stylesheet" type="text/css" href="/css/mypagememberinfo.css"  />
   <link rel="stylesheet" type="text/css" href="/css/util.css"/>
   <link rel="stylesheet" type="text/css" href="/css/main.css"/>
   
   	<script src="/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/bootstrap/js/popper.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="/vendor/daterangepicker/moment.min.js"></script>
	<script src="/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/slick/slick.min.js"></script>
	<script src="/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function sample6_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				            var addr = ''; // 주소 변수
				            var extraAddr = ''; // 참고항목 변수
				            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				              addr = data.roadAddress;
				            } else { // 사용자가 지번 주소를 선택했을 경우(J)
				              addr = data.jibunAddress;
				            }
				           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				        if(data.userSelectedType === 'R'){
				           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				         extraAddr += data.bname;
				        }
				        // 건물명이 있고, 공동주택일 경우 추가한다.
				        if(data.buildingName !== '' && data.apartment === 'Y'){
				         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				        }
				        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				        if(extraAddr !== ''){
				         extraAddr = ' (' + extraAddr + ')';
				        }
				        // 조합된 참고항목을 해당 필드에 넣는다.
				         document.getElementById("sample6_extraAddress").value = extraAddr;
				        } else {
				         document.getElementById("sample6_extraAddress").value = '';
				        }
				         // 우편번호와 주소 정보를 해당 필드에 넣는다.
				         document.getElementById('sample6_postcode').value = data.zonecode;
		                 document.getElementById("sample6_address").value = addr;
				         // 커서를 상세주소 필드로 이동한다.
				         document.getElementById("sample6_detailAddress").focus();
			            }
			        }).open();
			}
	   </script>
<!--===============================================================================================-->
<script src="/js/main.js"></script>
<script src="/js/mypagememberinfo.js"></script>
<script src="/js/adminForm.js"></script>
</head>
<body style=" font-family: 'Nanum Gothic', sans-serif;" >

<header>
    <div class="wrap-menu-desktop" style="margin-top: -50px;">
             <nav class="limiter-menu-desktop container">
               <!-- Logo desktop -->      
               <a href="#" class="logo">
                  <img src="/img/jeju2.png" alt="IMG-LOGO" style='width: 100px; height: 50px; margin-left: 50px;; margin-right: -20px;'/>
               </a>

               <!-- Menu desktop -->
               <div class="menu-desktop" style='margin-top: 10px;'>
                  <ul class="main-menu">
                     <li>
                        <a href="index.html" style="font-size: 18px;">Home</a>
                     </li>

                     <li class="label1" data-label1="hot">
                       <a href="" style="font-size: 18px;">Course</a>
                       <ul class="sub-menu">
                          <li><a href="/jejufriends/select_course/select.do">코스추천</a></li>
                          <li><a href="/jejufriends/make_course/make.do">나만의코스</a></li>
                       </ul>
                    </li>

                    <li >
                       <a>Contents</a>
                       <ul class="sub-menu">
                          <li><a href="/jejufriends/food/list.do">소문난맛집</a></li>
                          <li><a href="/jejufriends/landmark/list.do">관광지</a></li>
                          <li><a href="/jejufriends/activity/list.do">로컬체험</a></li>
                          <li><a href="/jejufriends/hotel/list.do">숙소</a></li>
                       </ul>
                    </li>
                     <li>
                        <a>Community</a>
                     </li>


                     <li>
                        <a>CS</a>
                        <ul class="sub-menu">
                           <li><a href="/jejufriends/qna/list.do">Q&A</a></li>
                           <li><a href="/jejufriends/faq/list.do">FAQ</a></li>
                        </ul>
                     </li>
		             <li>
                        <a href="about.html" style="font-size: 18px;">About</a>
                     </li>
                  </ul>
               </div>   

               <!-- Icon header -->
               <!-- logout-->
               <div class="wrap-icon-header flex-w flex-r-m" style="margin-bottom: -10px;">
               	 <sec:authorize access="isAuthenticated()">
               	     <form action="/jejufriends/logout" method="post">
                      	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
					    <button type="submit" value="Logout" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
					     <p style="font-size: 18px; font-weight: bold;">Logout</p>
					    </button>
					  </form>
                  </sec:authorize>
                  <sec:authorize access="isAnonymous()">
                  <!-- login-->
                  <a href="/jejufriends/login" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
                      <i class="zmdi zmdi-sign-in"></i>
                  </a>
                  </sec:authorize>
				<!--  장바구니 아이콘
                  <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
                     <i class="zmdi zmdi-shopping-cart"></i>
                  </div>
				-->
                  <a href="/jejufriends" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
                     <i class="zmdi zmdi-home"></i>
                  </a>
               </div>
            </nav>
         </div>   
</header>
	<div id="wrap" style="margin-top: 150px; ">
			<div id="container">
				<div id="contents">
					<div>
						<div>
						<div>
						<div class ="card z-depth-3">
					<div class="card-body text-center bg-primary rounded-top">
						<img src="/img/jeju2.png" style='width: 140px; height: 80px; margin-left: 2px; margin-right: 30px;' />
				            <h1><font color="#555555" style="margin-bottom: 70px; margin-top: 70px; font-weight: bold; color: white;">컨텐츠 등록</font> </h1>
				            <c:if test="${not empty emptys}">
				            	<h3><font color="#555555" style="margin-bottom: 30px; color: red;">${emptys}</font> </h3>
				            </c:if>
				            <c:if test="${not empty duplicationfName}">
				            	<h3><font color="#555555" style="margin-bottom: 30px; color: red;">${duplicationfName}</font> </h3>
				            </c:if>
			       		</div>
	       		 		</div>
		  				</div>
					</div>
					<form method="post" action="/jejufriends/content/write" enctype="multipart/form-data" style="width:100%; height:500px; ">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						<input type="hidden" name="email" type="text" value=""/>
						<div class="card z-depth-3" style="width: 45%; margin-right: 20px; margin-top: 50px;">
							<div class="card-body">
								<h3>제목 및 소제목</h3>
								<hr></hr>
								<input class="form-control" name="name" type="text" value="" style="width:100%;height:40px;" placeholder="컨텐츠의 제목을 입력해주세요"/>
								<input class="form-control" name="bigIntro" type="text" value="" style="width:100%;height:40px;" placeholder="컨텐츠의 소제목을 입력해주세요"/>
							</div>
						</div>
							<div class="card z-depth-3" style="width:45%; margin-right: 20px; float:right; margin-top: -195px;">
							<div class="card-body">
								<h3>카테고리 및 지역</h3>
								<hr></hr>
							<!--  <div style="width:200px;height:40px;float:right; margin-top: -100px;">-->
								<select name="checkCategory" id="checkCategory" style="width:100%;height:100%;">
									<option value="" selected>카테고리</option>
									<option value="food">맛집</option>
									<option value="landmark">관광지</option>
									<option value="activity">로컬체험</option>
									<option value="hotel">숙소</option>
								</select>
								<select name="division" style="width:100%;height:100%; margin-top: 20px;">
									<option value="" >지역</option>
									<option value="1" selected>중앙지역</option>
									<option value="2">서쪽지역</option>
									<option value="3">북쪽지역</option>
									<option value="4">동쪽지역</option>
									<option value="5">남쪽지역</option>
								</select>
							</div>
							</div>
						<div>
						<div style="margin-top:20px;">
						<h2 style="font-weight: bold; margin-top: 20px;">이미지</h2>
						<hr></hr>
						<div class="card z-depth-3" style="width: 33%; margin-right: 20px;">
								<div class="card-body">
									<input name="file" type="file"  multiple style="margin-top: 5px; "/>
								</div>
						</div>
						<div id="prices" style="margin-top: 20px;"></div>
						</div>
						</div>
						<div style="margin-top: 20px;">
						 <h2 style="font-weight: bold;">영업시간 및 브레이크 타임</h2>
							<hr></hr>
						<div class="card z-depth-3" style="width: 33%; margin-right: 20px;">
								<div class="card-body">
									<div class="row" style="margin-left: 2px;">
										<label for="breakcStart" style="font-weight: bold;">브레이크 타임</label>
										<input id="breakcStart" type="text" style="width:150px;height:40px; margin-right: 10px;" class="dateSelectorBreak" placeholder="브레이크타임시작" name="breakStartTime"/>
										<input id="breakEnd" type="text" style="width:150px;height:40px; margin-right: 10px;" class="dateSelectorBreak" placeholder="브레이크타임끝" name="breakEndTime"/>
										<label for="ocpl" style="font-weight: bold; margin-top: 3px;">운영 시간</label>
										<input id="ocpl" type="text" style="width:150px;height:40px; margin-right: 10px;" class="dateSelector" placeholder="오픈시간" name="openTime"/>
										<input type="text" style="width:150px;height:40px; margin-right: 10px;" class="dateSelector" placeholder="닫는시간" name="closedTime"/>
									</div>
								</div>
						</div>
						</div>	
						<div>
							<div>
							<h2 style="font-weight: bold; margin-top: 80px;">주소 및 전화번호</h2>
							<hr></hr>
								<h5 style="font-weight: bold; margin-top: 20px;">주소</h5>
									<hr></hr>
								<div class="card z-depth-3">
									<div class="card-body">
						         	 <input type="button" style="width:140px;height:40px;" class="btn btn-primary"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
						         	 <input type="text" style="width:100px;height:40px;" id="sample6_postcode"  name = "postNumber" placeholder="우편번호"/>
						         	 <input type="text" style="width:300px;height:40px;" id="sample6_address" name="addressR" placeholder="주소"/>
						         	 <input type="text" style="width:300px;height:40px;" id="sample6_detailAddress" name="upAddress" placeholder="상세주소"/>
						         	 <input type="text" style="width:100px;height:40px;" id="sample6_extraAddress" placeholder="참고"/>
									</div>
								</div>
							</div>
							<h5 style="font-weight: bold; margin-top: 20px;">전화번호</h5>
							<hr></hr>
							<div class="card z-depth-3">
								<div class="card-body">
									<div>
										 <input type="tel" class="form-control" style="width:200px;height:40px;"   name ="phone" placeholder="전화번호"/>
									</div>
								</div>
							</div>	
						</div>
						
						<h2 style="font-weight: bold; margin-top: 20px;">내용</h2>
						<hr></hr>
						<div class="card z-depth-3">
								<div class="card-body">
									<textarea name="smallIntro" style="width:100%;height: 200px;" placeholder="게시글의 내용을 입력해주세요"></textarea>
									
								</div>
						</div>		
						<input type="submit" class="btn btn-primary"  style="margin-top:20px;" value="등록" />
					</form>
			</div>
		</div>

		</div><!-- //container -->
	</div><!-- //wrap -->
	<div id="footer" style="margin-top:1200px;">
			<jsp:include page="../footer.jsp" flush="true"/>
			<!-- //inner -->
		</div>
		
<script type="text/javascript">

    $(".dateSelectorBreak").timepicker({
        timeFormat: 'h:mm p',
        interval: 60,
        minTime: '7',
        maxTime: '11:00pm',
        startTime: '13:00',
        dropdown: true,
        scrollbar: true        
    });
	
    $(".dateSelector").timepicker({
        timeFormat: 'h:mm p',
        interval: 60,
        minTime: '7',
        maxTime: '11:00pm',
        defaultTime: '9',
        startTime: '7:00',
        dropdown: true,
        scrollbar: true        
    });
	$('#checkCategory').on('change' , function(){
		let check = $('#checkCategory option:selected').val();
		$("#prices").empty();
		if(check === 'food'){
			let strings = `
				<h2 style="font-weight: bold;">대표 메뉴</h2>
				<hr></hr>
				<div class="row">
					<div class="card z-depth-3" style="width: 30%; margin-right: 20px;">
						<div class="card-body">
							<h3>대표 메뉴 1번</h3>
							<input name="menu1" class="form-control" type="text" value="" style="width:200px;height:40px; margin-right: 10px;" placeholder="메뉴명"/>
							<input name="cost1" class="form-control" type="text" value="" style="width:100px;height:40px;" placeholder="가격"/>
						</div>
					</div>
					<div class="card z-depth-3" style="width: 30%; margin-right: 20px;">
						<div class="card-body">
							<h3>대표 메뉴 2번</h3>
							<input name="menu2" class="form-control" type="text" value="" style="width:200px;height:40px; margin-right: 10px;" placeholder="메뉴명"/>
							<input name="cost2" class="form-control" type="text" value="" style="width:100px;height:40px;" placeholder="가격"/>
						</div>
					</div>
					<div class="card z-depth-3"  style="width: 30%; margin-right: 20px;" >
						<div class="card-body">
							<h3>대표 메뉴 3번</h3>
							<input name="menu3" class="form-control"  type="text" value="" style="width:200px;height:40px;  margin-right: 10px;" placeholder="메뉴명"/>
							<input name="cost3" class="form-control" type="text" value="" style="width:100px;height:40px;" placeholder="가격"/>
						</div>
					</div>
				</div>
			`;
			$("#prices").append(strings);
		} else if (check === 'hotel'){
			let strings = `
				<h2 style="font-weight: bold; margin-top: 10px;">숙박비</h2>
				  <hr></hr>
				<div class="card z-depth-3" style="width: 33%; margin-right: 20px;">
					<div class="card-body">
						<h3>1박 가격</h3>
					    <input id="price" class="form-control" name="cost1" type="text" value="" style="width:180px;height:40px;" placeholder="숙박비"/>
					</div>
				<div>
				`;
				$("#prices").append(strings);
		} else {
			let strings = `
				<h2 style="font-weight: bold; margin-top: 10px;">가격</h2>
			 	 <hr></hr>
				<div class="card z-depth-3" style="width: 33%; margin-right: 20px;">
					<div class="card-body">
						<h3>입장료</h3>
				    	<input id="price" class="form-control" name="cost1" type="text" value="" style="width:180px;height:40px;" placeholder="가격"/>
					</div>
				</div>
			    `;
				$("#prices").append(strings);
			
		}
		
	});
</script>

</body>

</html>