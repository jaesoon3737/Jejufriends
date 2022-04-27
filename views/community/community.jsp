<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
	<head>

	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
	<!--  네비게이션바 시작 -->
		<!--===============================================================================================-->   
			<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
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
					JEJU FRIENDS
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




<link rel="stylesheet" type="text/css" href="/css/qna.css"  />
<style type="text/css">
#front-linker {z-index: 9999;position: fixed;left: 0;top: 0;right: 0;min-width: 1280px;height: 61px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 0;}#front-linker .show-ctrl h2 { width:210px; z-index: 260;margin: 0;position: absolute;left: 0;top: 0;overflow: hidden;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -71px;}#front-linker .show-ctrl .close {border: 0;position: absolute;right: 0;top: 0;overflow: hidden;width: 58px;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -191px;}#front-linker .show-ctrl .admin {margin: 0;position: absolute;right: 58px;top: 0;width: 164px;height: 50px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -131px;}#front-linker .show-ctrl .use { width:242px; position: absolute;left: 50%;top: 18px;overflow: hidden;height: 15px;margin-left: -216px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -413px;}#front-linker .show-ctrl .manual { width:78px;right:222px; position: absolute; top: 0; overflow: hidden; height: 50px; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -174px -131px;}#front-linker .show-ctrl .choice { width:240px;right:300px;margin-left:30px; position: absolute;top: 13px;}#front-linker .show-ctrl .choice li { margin:0 0 0 32px; position: relative; float: left; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -309px;}#introduce .hide {position: absolute;right: 13px;top: 8px;overflow: hidden;width: 7px;height: 7px;text-indent: -9999px;border: 0;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -22px -361px;}#front-linker .hide-ctrl .open {overflow: hidden;float: right;width: 104px;height: 30px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -68px -191px;}#atl-menu a .bullet {position: absolute;right: 0;top: 3px;width: 4px;height: 7px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -344px;}#atl-admin button.close {position: absolute;right: 15px;top: 8px;overflow: hidden;width: 12px;height: 11px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -361px;}#atl-admin .btn a {display: inline-block;overflow: hidden;width: 42px;height: 22px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat;}
</style>
<title> 자유게시판 - 기호제학</title>
<meta name="path_role" content="BOARD_FREE_LIST" />
<meta name="author" content="기호제학" />
<meta name="description" content="자유게시판입니다." />
<meta name="keywords" content="자유게시판" />
<meta name="design_html_path" content="/board/free/list.html" />



</head>
<body>

<div style="margin-top: 150px"></div>

<hr class="layout"/><div id="wrap">
    <div id="container">
        <div id="contents">
            
		<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 "><div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 "><div class="path">
	        <span>현재 위치</span>
	        <ol>
				<li><a href="/">홈</a></li>
		        <li><a href="/board/index.html">게시판</a></li>
		        <li title="현재 위치"><strong>자유게시판</strong></li>
		    </ol>
		</div>
		<div class="titleArea">
	        <h2><font color="#555555">자유게시판</font> </h2>
	        <p>자유게시판입니다.</p>
	    </div>
			<p class="imgArea"></p>
		</div>
	
		<div class="boardSort">
	    	<span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
	    </div>
	    
	    
	    <script type="text/javascript" src="/js/community/com_paging.js"></script>
	    
		<div class="ec-base-table typeList gBorder">
	        <table border="1" summary="">
			<caption>게시판 목록</caption>
	      	
			<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
				<tr style="">
					<th style="width:10%;text-align:center;">번호</th>
					<th style="width:20%;text-align:center;">작성자</th>
		            <th style="width:30%;padding-left:10px;">제목</th>
		            <th style="width:10%;text-align:center;">작성일</th>
		            <th style="width:10%;text-align:center;">카테고리</th>
		            <th style="width:10%;text-align:center;">조회수</th>
		            <th style="width:10%;text-align:center;">좋아요</th>
		        </tr>
			</thead>
			<tbody id="community_list" class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002 center">
				
			</tbody>
			</table><p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
    	</div>
		<div class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ec-base-button typeBG  ">
			<span class="gRight">
	            <a href="/jejufriends/community/community_write.do" class="btnSubmitFix sizeS ">글쓰기</a>
	        </span>
		</div>
	</div>

		<div id="community_paging" class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
		
		</div>
	
			<input id="board_no" name="board_no" value="6" type="hidden"  />
			<input id="page" name="page" value="1" type="hidden"  />
			<input id="board_sort" name="board_sort" value="" type="hidden"  />
			<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
				<fieldset class="boardSearch">
					<legend>게시물 검색</legend>
						<p class="category displaynone"></p>
						<div style="display: flex; justify-content: right; align-items: center;">
							<select id="pageNum" fw-filter="" fw-label="" fw-msg="" >
								<option value="10" selected>페이지수</option>
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
							</select> 
							<select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="" >
								<option value="comnum" selected>글번호</option>
								<option value="nick">닉네임</option>
								<option value="comsubject">제목</option>
								<option value="comtag">태그</option>
								<option value="comcontent">글내용</option>
							</select> 
							<input id="community_search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text" style="margin-left: 10px;"/> 
							<a id="community_button" class="btnEmFix"  style="margin-left: 10px;cursor:pointer;color:rgb(255,255,255)">찾기</a>
						</div>
				</fieldset>
				
				<script type="text/javascript">
					let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
				    let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
				    let csrfToken = $('meta[name="_csrf"]').attr('content');
					$.ajax({
				        url: "/jejufriends/community/communityList.json",
				        type: "POST",
				        beforeSend: function(xhr) {
				            xhr.setRequestHeader(csrfHeader, csrfToken);
				        }, 
				        success: function(communityList) {
				            let pageNum = $('#pageNum option:selected').val();
				            communityPageSet(pageNum, 1, communityList);
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
