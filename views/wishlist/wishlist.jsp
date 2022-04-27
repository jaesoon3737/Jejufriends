<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
	<head>

	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
	<sec:authentication property="principal.username" var = "emails"/>

	<!--  네비게이션바 시작 -->
	<!--===============================================================================================-->   
		<link rel="icon" type="image/png" href="/images/icons/favicon.png"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/fonts/iconic/css/material-design-iconic-font.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/fonts/linearicons-v1.0.0/icon-font.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">
	<!--===============================================================================================-->   
		<link rel="stylesheet" type="text/css" href="/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
	<!--===============================================================================================-->   
		<link rel="stylesheet" type="text/css" href="/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/slick/slick.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/MagnificPopup/magnific-popup.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="/css/util.css">
		<link rel="stylesheet" type="text/css" href="/css/main.css">
	<!--===============================================================================================-->
		
		<div class="top-bar" >
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">
			</div>
			</div>
	
     		<div class="wrap-menu-desktop">
           		<nav class="limiter-menu-desktop container">
             
	            <!-- Logo desktop -->      
	            	<a href="/jejufriends" class="logo">
	                	<img src="/img/jeju2.png" alt="IMG-LOGO" style='width: 100px; height: 50px; margin-left: 50px;; margin-right: -20px;'>
	              	</a>
	
	            <!-- Menu desktop -->
	            	<div class="menu-desktop" style='margin-top: 10px;'>
	                 	<ul class="main-menu">
		                    <li>
		                       <a href="/jejufriends" style="font-size: 18px;">Home</a>
		                    </li>
	
		                    <li class="label1" data-label1="hot">
		                       <a href="" style="font-size: 18px;">Course</a>
		                       <ul class="sub-menu">
									<li><a href="/jejufriends/select_course/select.do">코스추천</a></li>
                                    <li><a href="/jejufriends/make_course/make.do">나만의코스</a></li>
		                       </ul>
		                    </li>
	
		                    <li >
		                       <a href="" style="font-size: 18px;">Contents</a>
		                       <ul class="sub-menu">
		                          <li><a href="/jejufriends/food/list.do">소문난맛집</a></li>
		                          <li><a href="/jejufriends/landmark/list.do">관광지</a></li>
		                          <li><a href="/jejufriends/activity/list.do">로컬체험</a></li>
		                          <li><a href="/jejufriends/hotel/list.do">숙소</a></li>
		                       </ul>
		                    </li>
	
		                    <li>
		                       <a href="/jejufriends/community/community.do" style="font-size: 18px;">Community</a>
		                    </li>
	
	
		                    <li>
		                       <a href="" style="font-size: 18px;">CS</a>
		                       <ul class="sub-menu">
									<li><a href="/jejufriends/faq/list.do?cp=1">FAQ</a></li>
                                	<li><a href="/jejufriends/qna/list.do?cp=1">QNA</a></li>
		                       </ul>
		                    </li>
	                    
		                    <li>
		                       <a href="" style="font-size: 18px;">About</a>
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
	                      <p style="font-size: 18px; font-weight: bold;">Login</p>
	                  </a>
	                  </sec:authorize>
					<!--  장바구니 아이콘
	                  <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
	                     <i class="zmdi zmdi-shopping-cart"></i>
	                  </div>
					-->
	                  <a href="/jejufriends/member/mypage" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
	                     <i class="zmdi zmdi-account"></i>
	                  </a>
	               </div>
	           		</nav>
	        	</div>   
	     	</div>
  
		<!--===============================================================================================-->	
			<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
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
		<!--===============================================================================================-->
			<script src="/js/main.js"></script>
		
		<!--  네비게이션바 끝 -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://rlgh2587.cafe24.com/myshop/wish_list.html" />
<meta property="og:url" content="http://rlgh2587.cafe24.com/myshop/wish_list.html" />
<meta property="og:title" content="기호제학" />
<meta property="og:description" content="기호제학 쇼핑몰 | Outerwear·Tops·Dresses·Bottoms·Accessories" />
<meta property="og:site_name" content="기호제학" />
<meta property="og:type" content="website" />
<script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=5d737b82fad17b0c1f38a5d17a53bc13"></script>

<link rel="stylesheet" type="text/css" href="/css/wishlist.css"/>
<style type="text/css">
#front-linker {z-index: 9999;position: fixed;left: 0;top: 0;right: 0;min-width: 1280px;height: 61px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 0;}#front-linker .show-ctrl h2 { width:210px; z-index: 260;margin: 0;position: absolute;left: 0;top: 0;overflow: hidden;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -71px;}#front-linker .show-ctrl .close {border: 0;position: absolute;right: 0;top: 0;overflow: hidden;width: 58px;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -191px;}#front-linker .show-ctrl .admin {margin: 0;position: absolute;right: 58px;top: 0;width: 164px;height: 50px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -131px;}#front-linker .show-ctrl .use { width:242px; position: absolute;left: 50%;top: 18px;overflow: hidden;height: 15px;margin-left: -216px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -413px;}#front-linker .show-ctrl .manual { width:78px;right:222px; position: absolute; top: 0; overflow: hidden; height: 50px; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -174px -131px;}#front-linker .show-ctrl .choice { width:240px;right:300px;margin-left:30px; position: absolute;top: 13px;}#front-linker .show-ctrl .choice li { margin:0 0 0 32px; position: relative; float: left; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -309px;}#introduce .hide {position: absolute;right: 13px;top: 8px;overflow: hidden;width: 7px;height: 7px;text-indent: -9999px;border: 0;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -22px -361px;}#front-linker .hide-ctrl .open {overflow: hidden;float: right;width: 104px;height: 30px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -68px -191px;}#atl-menu a .bullet {position: absolute;right: 0;top: 3px;width: 4px;height: 7px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -344px;}#atl-admin button.close {position: absolute;right: 15px;top: 8px;overflow: hidden;width: 12px;height: 11px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -361px;}#atl-admin .btn a {display: inline-block;overflow: hidden;width: 42px;height: 22px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat;}
</style>
<title>기호제학</title>
<meta name="path_role" content="MYSHOP_WISHLIST" />
<meta name="author" content="기호제학" />
<meta name="description" content="기호제학 쇼핑몰 | Outerwear·Tops·Dresses·Bottoms·Accessories" />
<meta name="keywords" content="기호제학" /></head>

<body>

<script type="text/javascript" src="/js/wishlist/wishlist_paging.js"></script>
<script type="text/javascript" src="/js/wishlist/wishlist_remove.js"></script>

<hr class="layout"/><div id="wrap">
    <div id="container">
        <div id="contents">
            
<div style="margin-top: 150px"></div>
<div class="xans-element- xans-custom xans-custom-moduleedit-101 xans-custom-moduleedit xans-custom-101 titleArea "><h2>찜 목록</h2>
</div>

<div class="xans-element- xans-myshop xans-myshop-wishlist ec-base-table typeList xans-record-"><!--
        $login_page = /member/login.html
        $count = 10
    -->
<table border="1" summary="" class="">
<caption>관심상품 목록</caption>
        <colgroup>
<col style="width:27px;"/>
<col style="width:92px"/>
<col style="width:auto"/>
<col style="width:105px"/>
<col style="width:100px"/>
<col style="width:100px"/>
<col style="width:85px"/>
<col style="width:105px"/>
<col style="width:110px"/>
</colgroup>
		<thead>
			<tr>
                <th scope="col" style="width:35%;padding-left:15px;">코스이름</th>
                <th scope="col" style="width:45%;">코스설명</th>
                <th scope="col" style="width:20%;text-align:center;">선택</th>
            </tr>
		</thead>
        <tbody id="wishlist_list" class="xans-element- xans-myshop xans-myshop-wishlistitem center">
			
		</tbody>
	</table>
<p class="message displaynone">관심상품 내역이 없습니다.</p>
</div>

	<div id="paging" class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
		
	</div>
	
	<div class="xans-element- xans-myshop xans-myshop-wishlistbutton ec-base-button xans-record-">
	       
		<span class="gRight" style="float:left;">
	        <a id="delete_all" class="btnEmFix sizeM" style="cursor:pointer;color:rgb(255,255,255);">관심상품 비우기</a>
	    </span>
	    <div style="float:right; align-items: center;">
			<select id="pageNum" name="search_key" fw-filter="" fw-label="" fw-msg="" >
				<option value="10" selected>페이지수</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select>
		</div>
	</div>

	
	
	<script type="text/javascript">
		let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
	    let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
	    let csrfToken = $('meta[name="_csrf"]').attr('content');
	    const email = '${emails}';
		$.ajax({
	        url: "/jejufriends/wishlist/wishlistList.json",
	        type: "POST",
	        data: {email:email},
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success: function(wishlistList) {
	            let pageNum = $('#pageNum option:selected').val();
	            wishListPageSet(pageNum, 1, wishlistList);
	        }
	    });
	</script>
		
		
		</div>
		
	</div><!-- //container -->
	
</div><!-- //wrap -->


		<jsp:include page="../footer.jsp" flush="true"/>	




	
		
		<!-- 180430 플로팅버튼추가 -->
		<script type="text/javascript" src="https://cdn.jejujini.kr/resources/KR/js/libs/css_common.js?r=13"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.jejujini.kr/resources/KR/css/common.css?r=13" />
		<link rel="stylesheet" type="text/css" href="https://cdn.jejujini.kr/resources/KR/css/new_common.css?r=13" />
		<div class="floating"><!-- 180827 sub class 삭제  -> 다시 추가 -->
		<!-- 180831 탑버튼 추가 -->
			<button type="button" class="topBtn" onclick="$('body').scrollTop(0); return false;">탑버튼</button><!-- MSG : 탑버튼 -->
		
		</div>
		
	</body>

</html>

















