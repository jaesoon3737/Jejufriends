<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.List, jejufriends.course.domain.Course"%>
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
</head>

<body>
<header>
    <div class="wrap-menu-desktop" style="margin-top: -50px;">
            <nav class="limiter-menu-desktop container">
               
               <!-- Logo desktop -->      
               <a href="#" class="logo">
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
                        <a href="contact.html" style="font-size: 18px;">CS</a>
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
</header>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://rlgh2587.cafe24.com/board/자유게시판/5/" />
<meta property="og:url" content="http://rlgh2587.cafe24.com/board/자유게시판/5/" />
<meta property="og:title" content=" 자유게시판 - 기호제학" />
<meta property="og:description" content="자유게시판입니다." />
<meta property="og:site_name" content="기호제학" />
<meta property="og:type" content="article" />

<link rel="stylesheet" type="text/css" href="/css/selectcourse.css" charset="utf-8"/>
<script type="text/javascript" src="/js/selectcourse/check.js"></script>

<style type="text/css">
</style>
<title> 자유게시판 - 기호제학</title>
<meta name="path_role" content="BOARD_FREE_LIST" />
<meta name="author" content="기호제학" />
<meta name="description" content="자유게시판입니다." />
<meta name="keywords" content="자유게시판" />
<meta name="design_html_path" content="/board/free/list.html" />
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>


<script type="text/javascript" src="/js/selectcourse/paging.js"></script>
<script type="text/javascript" src="/js/selectcourse/set_course_img.js"></script>


<hr class="layout"/>
<div id="wrap" style="-webkit-user-drag: none;-webkit-tap-highlight-color:unset;border:none;">
    <div id="container">
        <div id="contents">
            
			<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 " style="text-align: center; margin-top: 150px;">
				<!-- oncontextmenu="return false" ondragstart="return false" onselectstart="return false" == 드래그 방지 -->
				<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 " oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
					<!-- 지도 이미지 시작 -->
	            	<img id="jejudo_map_img" usemap="#jejumap" src="/img/jejudo_full.png" style="border:none; width:1200px; height: 700px;-webkit-user-drag: none;-webkit-tap-highlight-color:unset;">
	            	<map name="jejumap">
		                <area class="course_division" shape="rect" coords="460,281,770,382" alt="1" title="center" style="cursor:pointer;">
		                <area class="course_division" shape="rect" coords="252,247,396,502" alt="2" title="west" style="cursor:pointer;">
		                <area class="course_division" shape="rect" coords="435,157,766,223" alt="3" title="north" style="cursor:pointer;">
		                <area class="course_division" shape="rect" coords="815,135,960,464" alt="4" title="east" style="cursor:pointer;">
		                <area class="course_division" shape="rect" coords="453,412,806,517" alt="5" title="south" style="cursor:pointer;">
	            	</map>
			        <!-- 지도이미지 끝 --> 
					<div class="title">
			            <h2><font color="#555555">코스추천</font></h2>
			            <h2 style="margin-left: 5px;">　</h2>
			        </div>
			        
<p class="imgArea"></p>
</div>
<div class="boardSort">
                <span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
    </div>
	<div class="boardList">
        <table border="1" summary="">
	<caption>상품 게시판 목록</caption>
        <colgroup class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
        <col style="width:70px;"/>
		<col style="width:134px;"/>
		<col style="width:135px;" class="displaynone"/>
		<col style="width:auto;"/>
		<col style="width:84px;"/>
		<col style="width:80px;" class=""/>
		<col style="width:55px;" class=""/>
		<col style="width:55px;" class="displaynone"/>
		<col style="width:80px;" class="displaynone"/>
	</colgroup>
	<thead class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
		<tr style=" ">
			<th scope="col" style="text-align:center;">번호</th>
            <th scope="col" class="thumb" style="text-align:center;width:15%;">코스이름</th>
            <th scope="col" style="text-align:center;">코스설명</th>
            <th scope="col" style="text-align:center;width:15%;">작성자</th>
            <th scope="col" class="" style="text-align:center;">작성일</th>
            <th scope="col" class="" style="text-align:center;width:7%;">조회</th>
            <th scope="col" class="" style="text-align:center;width:7%;">선택받은횟수</th>
		</tr>
	</thead>
		 <tbody id="course_list" class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002">
		 	<!--
                $product_name_cut = 30
                $login_page_url = /member/login.html
                $deny_access_url = /index.html
            -->
            
          <!--   
            <c:if test="${empty courseList}">
            	<tr style="background-color:#FFFFFF; color:#555555;" class="">
            		<td colspan="7" class="subject" style="text-align: center;">검색 결과가 없습니다</td>
            	</tr>
            </c:if>
            
            <c:set var="i" value="0"/>
            <c:forEach items="${courseList}" var="course">
            	<c:if test="${i < 10}">
		            <tr style="background-color:#FFFFFF; color:#555555;" class="">
					<td ><input class="boardChk" value="16" type="checkbox"  style="float: left; margin-left: 10px; margin-right: -15px;"/>${course.cnum}</td>
		                <td class="subject" style="text-align: center;">
		                	<a href="/board/product/read.html?no=16&board_no=5" style="color:#555555;">${course.cname}</a> 
		                    <img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_attach2.gif"  alt="파일첨부" class="ec-common-rwd-image"/>
		               		<span></span>
			            </td>
		                <td class="displaynone"></td>
		                <td class="subject">
		                    <span class="displaynone">
		                        <a href="#none" onclick="BOARD.viewTarget('16','5',this);">
		                        <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_unfold.gif" alt="내용 보기"/></a>
		                    </span>
		                     <a href="/board/product/read.html?no=16&board_no=5" style="color:#555555;">${course.cintro}</a> 
		                </td>
		                <td>${course.nick}</td>
		                <td class="txtLess ">${course.cdate}</td>
		                <td class="txtLess ">${course.love}</td>
		                <td class="txtLess ">${course.choosed}</td>
		                <td class="displaynone"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_point0.gif" alt="0점"/></td>
		            </tr>
	            </c:if>
	            <c:set var="i" value="${i + 1}"/>
	        </c:forEach>
	        --> 
		</tbody>
	</table>
</div>
<div class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 boardListEmpty displaynone "><p></p>
</div>
<div class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002">
	<a href="/jejufriends/make_course/make.do" class="btnEmFix sizeS">내 코스만들기</a>
</div>
</div>
	
	<div id="paging" class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
		
	</div>
	
	<script type="text/javascript">
		let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
	    let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
	    let csrfToken = $('meta[name="_csrf"]').attr('content');
		$.ajax({
	        url: "/jejufriends/select_course/selectDivision.json",
	        type: "POST",
	        data: {division: 0},
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success: function(courseList) {
	            let pageNum = $('#pageNum option:selected').val();
	            pageSet(pageNum, 1, courseList);
	        }
	    });
	</script>

		<input id="board_no" name="board_no" value="6" type="hidden"/>
		<input id="page" name="page" value="1" type="hidden"  />
		<input id="board_sort" name="board_sort" value="" type="hidden"/>
		<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
			<fieldset class="boardSearch">
				<legend>게시물 검색</legend>
					<p class="category displaynone"></p>
					<div style="display: flex; justify-content: right; align-items: center;">
						<select id="pageNum" name="search_key" fw-filter="" fw-label="" fw-msg="" >
							<option value="10" selected>페이지수</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
						</select>
						<select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="" >
							<option value="cname" selected>코스이름</option>
							<option value="cintro">코스설명</option>
							<option value="nick">닉네임</option>
							<option value="ctag">태그</option>
							<option value="cnum">글번호</option>
						</select>
						<input id="select_search" name="" class="inputTypeText" placeholder="" value="" type="text" style="margin-left: 10px;"/> 
						<a id="select_button" class="btnEmFix" style="margin-left: 10px;cursor: pointer;color:rgb(255,255,255)">찾기</a>
					</div>
			</fieldset>
		</div>

		</div>
		</div><!-- //container -->

</div><!-- //wrap -->

<link rel="stylesheet" type="text/css" href="/css/makecourse.css"  />
		
		<jsp:include page="../footer.jsp" flush="true"/>

</body>
</html>
