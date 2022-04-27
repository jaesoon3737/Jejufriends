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




<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://rlgh2587.cafe24.com/article/자유게시판/5/13/" />
<meta property="og:url" content="http://rlgh2587.cafe24.com/article/자유게시판/5/13/" />
<meta property="og:title" content="ㅋㅋ 자유게시판 - 기호제학" />
<meta property="og:description" content="자유게시판입니다." />
<meta property="og:site_name" content="기호제학" />
<meta property="og:type" content="article" />
<script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=f475bababadb6ba10c84bf80abdec3f7"></script>


<link rel="stylesheet" type="text/css" href="/css/boardcontents.css"/>

<style type="text/css">
#front-linker {z-index: 9999;position: fixed;left: 0;top: 0;right: 0;min-width: 1280px;height: 61px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 0;}#front-linker .show-ctrl h2 { width:210px; z-index: 260;margin: 0;position: absolute;left: 0;top: 0;overflow: hidden;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -71px;}#front-linker .show-ctrl .close {border: 0;position: absolute;right: 0;top: 0;overflow: hidden;width: 58px;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -191px;}#front-linker .show-ctrl .admin {margin: 0;position: absolute;right: 58px;top: 0;width: 164px;height: 50px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -131px;}#front-linker .show-ctrl .use { width:242px; position: absolute;left: 50%;top: 18px;overflow: hidden;height: 15px;margin-left: -216px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -413px;}#front-linker .show-ctrl .manual { width:78px;right:222px; position: absolute; top: 0; overflow: hidden; height: 50px; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -174px -131px;}#front-linker .show-ctrl .choice { width:240px;right:300px;margin-left:30px; position: absolute;top: 13px;}#front-linker .show-ctrl .choice li { margin:0 0 0 32px; position: relative; float: left; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -309px;}#introduce .hide {position: absolute;right: 13px;top: 8px;overflow: hidden;width: 7px;height: 7px;text-indent: -9999px;border: 0;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -22px -361px;}#front-linker .hide-ctrl .open {overflow: hidden;float: right;width: 104px;height: 30px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -68px -191px;}#atl-menu a .bullet {position: absolute;right: 0;top: 3px;width: 4px;height: 7px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -344px;}#atl-admin button.close {position: absolute;right: 15px;top: 8px;overflow: hidden;width: 12px;height: 11px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -361px;}#atl-admin .btn a {display: inline-block;overflow: hidden;width: 42px;height: 22px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat;}
</style>
<title>ㅋㅋ 자유게시판 - 기호제학</title>
<meta name="path_role" content="BOARD_FREE_DETAIL" />
<meta name="author" content="기호제학" />
<meta name="description" content="자유게시판입니다." />
<meta name="keywords" content="자유게시판" />
<meta name="design_html_path" content="/board/free/read.html" /></head><body>

<div style="margin-top: 150px"></div>

<hr class="layout"/><div id="wrap">
    <div id="container">
        <div id="contents">
            
<div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 "><div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 "><div class="path">
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
</div>

<form id="BoardDelForm" name="" action="/exec/front/Board/del/5" method="post" target="_self" enctype="multipart/form-data" >
<input id="no" name="no" value="13" type="hidden"  />
<input id="bulletin_no" name="bulletin_no" value="1015" type="hidden"  />
<input id="board_no" name="board_no" value="5" type="hidden"  />
<input id="member_id" name="member_id" value="rlgh2587" type="hidden"  />
<input id="list_url" name="list_url" value="/board/free/list.html?board_no=5" type="hidden"  />
<input id="bdf_modify_url" name="bdf_modify_url" value="/board/free/modify.html?board_act=edit&amp;no=13&amp;board_no=5" type="hidden"  />
<input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/5" type="hidden"  />
<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"  /><div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002"><!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/free/list.html
        -->
<div class="ec-base-table typeWrite ">
            <table border="0" summary="">
<caption>게시판 상세</caption>
            <colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
			<c:if test="${empty community}">
				<script>
					location.href = "/jejufriends/community/community.do";
				</script>
			</c:if>
			<tbody>
				<tr>
					<td class="board_subject" colspan="2">${community.comsubject}</td>
				</tr>
				<tr>
					<td class="board_sub_text" colspan="2">
						<a>${community.nick}</a>
						<span id="mileage_icon"></span>

						<span class="displaynone">
							평점 <img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"/>
						</span>
						<span class="">작성일 ${community.comdate}</span>
						<span class="displaynone">
							추천  <a href="#none" class="btnNormal" onclick="BOARD_READ.article_vote('/exec/front/Board/vote/5?no=13&return_url=%2Farticle%2F%EC%9E%90%EC%9C%A0%EA%B2%8C%EC%8B%9C%ED%8C%90%2F5%2F13%2F&b38330290ba656de0=421b5f0c6479bf046b7b7ff82c6825a8&board_no=5');">추천하기</a>
						</span>
						<span class="">조회수 ${community.views}</span>
					</td>
                </tr>
				<tr>
					<td colspan="2">
						<c:if test="${not empty community.comphoto}">
							<img src="/photo/${community.comphoto}" style="width:800px;height:800px;"></img>
						</c:if>
                        <div class="detail"><div class="fr-view fr-view-article"><p>${community.comcontent}</p></div></div>
                    </td>
                </tr>
                <tr>
					<td>
                        <div class="detail"><div class="fr-view fr-view-article"><p>${community.comtag}</p></div></div>
                    </td>
                </tr>
			</tbody>
		</table>
</div>
<div class="ec-base-button ">
            <span class="gLeft">
                <a href="/jejufriends/community/community.do" class="btnNormalFix sizeS">목록</a>
            </span>
			
			<sec:authentication property="principal.username" var = "emails"/>
			<sec:authentication property="principal.authorities" var="auth"/>
			
			<c:if test="${emails eq community.email or auth eq 'ROLE_ADMIN' or auth eq 'ROLE_SUPERADMIN'}">
				<span class="gRight">
	                <a href="/jejufriends/community/removeCommunity.do?comnum=${community.comnum}" class="btnNormalFix sizeS ">삭제</a>
	                <a href="/jejufriends/community/updateform.do?comnum=${community.comnum}" class="btnEmFix sizeS ">수정</a>
            	</span>
			</c:if>
        </div>
</div>
</form></div>
</div>
</div>
	</div><!-- //container -->
	
</div><!-- //wrap -->

	<jsp:include page="../footer.jsp" flush="true"/>
</body>
</html>
