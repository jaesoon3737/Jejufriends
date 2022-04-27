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



<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://rlgh2587.cafe24.com/article/상품-qa/6/2/" />
<meta property="og:url" content="http://rlgh2587.cafe24.com/article/상품-qa/6/2/" />
<meta property="og:title" content="ascsac 상품 Q&amp;A - 기호제학" />
<meta property="og:description" content="상품 Q&amp;A입니다." />
<meta property="og:site_name" content="기호제학" />
<meta property="og:type" content="article" />
<script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=f475bababadb6ba10c84bf80abdec3f7"></script>
<
<link rel="stylesheet" type="text/css" href="/css/public1.css"/>

<link rel="stylesheet" type="text/css" href="/css/public2.css"/>

<link rel="stylesheet" type="text/css" href="/css/qnacontents.css"/>

<style type="text/css">
#front-linker {z-index: 9999;position: fixed;left: 0;top: 0;right: 0;min-width: 1280px;height: 61px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 0;}#front-linker .show-ctrl h2 { width:210px; z-index: 260;margin: 0;position: absolute;left: 0;top: 0;overflow: hidden;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -71px;}#front-linker .show-ctrl .close {border: 0;position: absolute;right: 0;top: 0;overflow: hidden;width: 58px;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -191px;}#front-linker .show-ctrl .admin {margin: 0;position: absolute;right: 58px;top: 0;width: 164px;height: 50px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -131px;}#front-linker .show-ctrl .use { width:242px; position: absolute;left: 50%;top: 18px;overflow: hidden;height: 15px;margin-left: -216px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -413px;}#front-linker .show-ctrl .manual { width:78px;right:222px; position: absolute; top: 0; overflow: hidden; height: 50px; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -174px -131px;}#front-linker .show-ctrl .choice { width:240px;right:300px;margin-left:30px; position: absolute;top: 13px;}#front-linker .show-ctrl .choice li { margin:0 0 0 32px; position: relative; float: left; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -309px;}#introduce .hide {position: absolute;right: 13px;top: 8px;overflow: hidden;width: 7px;height: 7px;text-indent: -9999px;border: 0;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -22px -361px;}#front-linker .hide-ctrl .open {overflow: hidden;float: right;width: 104px;height: 30px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -68px -191px;}#atl-menu a .bullet {position: absolute;right: 0;top: 3px;width: 4px;height: 7px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -344px;}#atl-admin button.close {position: absolute;right: 15px;top: 8px;overflow: hidden;width: 12px;height: 11px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -361px;}#atl-admin .btn a {display: inline-block;overflow: hidden;width: 42px;height: 22px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat;}
</style>
<title> QNA </title>
<meta name="path_role" content="BOARD_PRODUCT_LIST" />
<meta name="description" content="상품 Q&amp;A입니다." />
<meta name="keywords" content="상품 Q&amp;A" />
<meta name="design_html_path" content="/board/product/list.html" /></head>

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
                        <a href="blog.html" style="font-size: 18px;">Community</a>
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



	<div id="quick_search">
		<div class="quick_searchClose"><img src="/images/icon_close.png" class="rotate"/></div>
		<form id="searchBarForm" name="" action="/product/search.html" method="get" target="_self" enctype="multipart/form-data" >
<input id="banner_action" name="banner_action" value="" type="hidden"  /><div class="xans-element- xans-layout xans-layout-searchheader "><!--
			$product_page=/product/detail.html
			$category_page=/product/list.html
			-->
<fieldset>
<legend>검색</legend>
				<input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="" onmousedown="SEARCH_BANNER.clickSearchForm(this)" value="" type="text"  /><img src="/images/icon_search_btn.png" alt="검색" class="search_btn" onclick="SEARCH_BANNER.submitSearchBanner(this); return false;"/>
			 </fieldset>
</div>
</form>	</div><!-- //quick_search -->
</div><!-- //header -->
<hr class="layout"/><div id="wrap">
    <div id="container">
        <div id="contents">
            
    <div style="margin-top: 150px"></div>
	<div class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 "><div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 "><div class="path">
	            <span>현재 위치</span>
	            <ol>
			<li><a href="/">홈</a></li>
	                <li><a href="/board/index.html">게시판</a></li>
	                <li title="현재 위치"><strong>Q & A</strong></li>
	            </ol>
	</div>
	<div class="titleArea">
	            <h1 style="text-align:center;"><font color="333333">QNA</font></h1>
	            <p>QNA입니다.</p>
	        </div>
	<div class="xans-element- xans-layout xans-layout-boardinfo cboth event_tab"><ul>
	<li rel="Q&A" class="xans-record-"><a href="/jejufriends/qna/list.do" class="move">Q&A</a></li>
	<li rel="FAQ" class="xans-record-"><a href="/jejufriends/faq/list.do" class="move">FAQ </a></li>

		</ul>
</div>
<form id="BoardDelForm" name="" action="/exec/front/Board/del/6" method="post" target="_self" enctype="multipart/form-data" >
<input id="no" name="no" value="2" type="hidden"  />
<input id="bulletin_no" name="bulletin_no" value="1004" type="hidden"  />
<input id="board_no" name="board_no" value="6" type="hidden"  />
<input id="member_id" name="member_id" value="rlgh2587" type="hidden"  />
<input id="list_url" name="list_url" value="/board/product/list.html?board_no=6" type="hidden"  />
<input id="bdf_modify_url" name="bdf_modify_url" value="/board/product/modify.html?board_act=edit&amp;no=2&amp;board_no=6" type="hidden"  />
<input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/6" type="hidden"  />
<input id="bdf_action_type" name="bdf_action_type" value="" type="hidden"  /><div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4"><!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/product/list.html
        -->
<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>상품 게시판 상세</caption>
            <colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup>
<tbody id="conBox">
	<tr>
		<td class="board_subject" colspan="2">${qna.subject}</td>
	</tr>
	<tr>
		<td class="board_sub_text" colspan="4">
			<span class="">이메일${qna.email}</span>
			<span class="">작성일${qna.rdate}</span>
			<span class="">조회수${qna.hits}</span>
		</td>
	</tr>
	<tr>
		<td colspan="2">
	    	<div class="detail"><div class="fr-view fr-view-article"><p>${qna.content}</p></div></div>
	    </td>
    </tr>
</tbody>
</table>
</div>
<div class="ec-base-button ">
            <span class="gLeft">
            <!-- 리퀘스트 클래스 안에서 '현재 페이지 직전 url'을 확인하는 메소드-->
                <a href='<%=request.getHeader("REFERER")%>' class="btnNormalFix sizeS">목록</a>
            </span>
            <span id="btnBox" class="gRight">
                <a href="del.do?seq=${qna.seq}" class="btnNormalFix sizeS">삭제</a>
                <a href="update.do?seq=${qna.seq}" class="btnEmFix sizeS">수정</a>
                <a id="replyBtn" href="reply.do?seq=${qna.seq}" class="btnEmFix sizeS">답글달기</a>
            </span>
        </div>
</div>
</div>

			<sec:authentication property="principal.username" var = "emails"/>
			<sec:authentication property="principal.authorities" var="auth"/>
			
			<c:if test="${emails eq community.email or auth eq 'ROLE_ADMIN' or auth eq 'ROLE_SUPERADMIN'}">
				<script type="text/javascript">
					window.onload = function(){
						document.getElementById("conBox").innerHTML = "<tr><td>본인이 작성한 글만 확인이 가능합니다.</td></tr>";
						document.getElementById("btnBox").style.display = "none";
						return false;
					}
				</script>
			</c:if>
			<c:if test="${auth eq 'ROLE_ADMIN' or auth eq 'ROLE_SUPERADMIN'}">
				<script type="text/javascript">
					window.onload = function(){
						document.getElementById("replyBtn").style.display = "none";
						document.getElementById("adminBox").style.display = 'none';
					}
				</script>
			</c:if>
			




		</div><hr class="layout"/></div><!-- //container -->
	<hr class="layout"/><div id="quick"></div>
</div><!-- //wrap -->
<hr class="layout"/><div id="footer">
	<div class="xans-element- xans-layout xans-layout-footer cboth inner "><div class="bt_logo"><a href="/"><img src="/images/logo.png"/></a></div>
<div class="bt_info">
			<div class="bt_title">기호제학</div>
			대표자 : 성기호<br/>
			소재지 :   <br/>
			사업자등록번호 :  <br/>
			통신판매업신고번호 : <br/>
			개인정보보호책임자 : <a href="mailto:rlgh2587@naver.com">성기호(rlgh2587@naver.com)</a>
		</div>
<!-- //bt_info -->
<div class="bt_cscenter">
			<div class="bt_title">고객센터</div>
			010-4065-0757<br/>
			rlgh2587@naver.com		</div>
<!-- //bt_cscenter -->
<div class="bt_runtime">
<!-- 운영시간 및 계좌번호는 [상점관리 - 기본정보관리 - 내쇼핑몰정보 - CS운영시간] 에 작성하시면 자동출력됩니다. -->
					</div>
<!-- //bt_runtime -->
<div class="bt_communitu">
			<div class="bt_title">커뮤니티</div>
			<a href="/board/%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD/1/">공지사항</a>
			<a href="/board/%EC%83%81%ED%92%88-%EC%82%AC%EC%9A%A9%ED%9B%84%EA%B8%B0/4/">구매후기</a>
			<a href="/board/%EC%83%81%ED%92%88-qa/6/">질문답변</a>
			<a href="/board/event/8/?board_no=8&amp;category_no=1">이벤트</a>
		</div>
<!-- //bt_communitu -->
<div class="cboth pdt70">
			<ul class="cboth utilMenu">
<li><a href="/member/privacy.html"><strong>개인정보 처리방침</strong></a></li>
				<li>|</li>
				<li><a href="/member/agreement.html">이용약관</a></li>
				<li>|</li>
				<li><a href="/shopinfo/guide.html">이용안내</a></li>
				<li>|</li>
				<li><a href="/board/%EC%83%81%ED%92%88-qa/6/">제휴문의</a></li>
			</ul>
<!-- //utilMenu --><div class="cboth escrow">고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 PG 사의 구매안전서비스를 이용하실 수 있습니다. [ LG U+ 에스크로 ]</div>
			<div class="copyright">COPYRIGHT © <span>기호제학. </span> ALL RIGHTS RESERVED. HOSTING BY 카페24(주)</div>

			<div class="cboth bt_sns">
<!-- 하단 SNS 링크 수정하는곳 -->
				<a href="https://www.instagram.com/" target="_blank" class="move"><img src="/images/icon_insta.png"/></a>
				<a href="https://www.facebook.com/" target="_blank" class="move"><img src="/images/icon_fb.png"/></a>
				</div>
		</div>
</div>
<!-- //inner -->
</div><!-- //footer -->




<script type="text/javascript">var sAuthSSLDomain = "https://login2.cafe24ssl.com";</script><script type="text/javascript" src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.js"></script><script type="text/javascript" src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.plugin.js"></script>
<span itemscope="" itemtype="http://schema.org/Organization">
<link itemprop="url" href="https://rlgh2587.cafe24.com">
</span>
<script type="text/javascript" src="/ind-script/i18n.php?lang=ko_KR&domain=front&v=2203161305" charset="utf-8"></script>

<script src="/ind-script/optimizer.php?filename=zVjbcts2EH23-drvYN10On2NlSbt1Ko1tjN5XoJLEiaARXGxzXx9l5KSWk14A-2ZjkYSBeEcLHfPLhbMG9KYX_zk8sqBxkdybe7QU3QC83ufy4tfTXbvf8jH5kVpQbT5_d8RXXf8epP9kv24EIlPAZ0B5Y8DmSBqJa5liU4l3UKGIqtMMtSQIFMpKUISxUX2M7-SFud_A7n_-M06qhmfg7X5b6XkCfnNs0DvHJVRhC2VmP_1feRzXZQQMEieoHmWCTmK7f7ikwzN3ed3ECDT0izgUbJgFN7x9TTKWydNqGbQk4i9We_J6Q2Z4EgpdNO4nYr-rbWXTpb1DHtikGp6VuVo76kzT4oRZM4C2TMlDZ4VYMwcuw4UgrQmM3f2ExjOY8NJYR2G-avscQG1VRyXYS1tqZAKT7R0sG_EKwM4zRLkIf8o7bIFq2hE79B-Xq_iTI_Kfw7DiBEs1fzjIe-eUyj43CmCchFIxwD9uteFR_cwFJwBsCXVVVLNll6JFUQVehd4DS5cfkd1y8trUcs96P9R7EsuIMazR_1aJgQvTb2WRWOAsi-Hg2q8bciehPX9Plh_QguUt_3nTj6hGqtFIzSbfS5-HE3FAegNVujQCNxE1393OydFggVcPmpy3ZX0YTHYIzjRLMqKAFXVfbv7TIbOqlhLLnkPoCRHjPfHYwi_DmR8AX41ba8RU_pv6ZnBsnDx9VZoUFl89ftowJRqcWFZsAAXSskxfjV-LqrhxdykSADvNi1Nl-l_LRjMk0sCV57onUezoh9NA0Uh0oBQDnZ4U1CHQ9vkc2-8jaG5vb1KW6LvQbjxW9QDQ1D9OwnDvQumIQvwuBh4bJUUdBRDKvpLr5MInxDdOFiDUqlYciW65IU7z1tNUqTwCUdyZQsG6tOu8hELRfWi3evLXpv3Vp7b4R13Fl4cf51XfACCsNaSl6KZd15qglacwjJI9IvcDr4z4vCZjNOoizGRTcCve4mKsfozQXAJvsWwnsGO92yzOHZTdWKCZUOR-5o197Ll8xrU6ffxDi15mb7-J-mb8f51BoGguMIFDgWugN_s4XcUQG1W2XE9XnynBIUGK7lW1FfQrbDhg4MyXUrclRDXQCn2NHxseUxXNR_G5Y5stOkUfKxq8Zig6wJ7QrVK7FfyAZU0LZl1Kvtd9s8xuxfQ65HpDooX4fkjoE70kIXQOFJ4PqPXn3Lz4MOmAbBNqOOHffCc25g5j3Mdd6N9av0D&type=js&k=a71faa04c3be5be0c381a1170d54f95a260f28a4&t=1646197605" ></script><script src="/ind-script/optimizer.php?filename=rc_BDcIwDIXhAdIrc1ggIdiDCZLUatzGcVrHoG5PhcQCkNs7fXo_JGEEjM4UN4UtT-lyvd-gWsgUXWqcQUd0IypNBXShcobsd7EGwStFmBXwiaW55sMw6wl6iJ_xs3YAUZil_COwjJbx-2w1iot7Er66Nc6r4bYPoUq1OjCVbjL3ro--4STH2W4iW26kSeojUa1UpoN-Aw&type=js&k=58d15ef1d6c59f6e173a027f1ca309c34bdbe04a&t=1647412175&user=T" ></script>
<script type="text/javascript">
CAFE24.MOBILE_WEB = false; var mobileWeb = CAFE24.MOBILE_WEB;
var bUseElastic = false;
var sSearchBannerUseFlag = 'F';
EC$(function() {
try{
var ifame_width = parent.EC$('#blog_2').parent().width();
parent.EC$('#blog_2').contents().find('body').css( 'min-width', ifame_width);
parent.EC$('#blog_2').css('width', ifame_width);
if (parseInt(parent.EC$('#blog_2').css('height')) < (document.body.scrollHeight + 70)) {
parent.EC$('#blog_2').css('height', document.body.scrollHeight + 70);
}
}catch(e){};
});
var EC_SDE_SHOP_NUM = 1;
var is_multishop = false;
function getMultiShopUrl(sUrl)
{
if (is_multishop === false) {
return sUrl;
} else if (/^\/(admin\/php|disp\/admin)(\/shop\d+)\//.test(sUrl) === true) {
return sUrl;
} else {
return sUrl.replace(/\/(admin\/php|disp\/admin)(\/shop\d+)?\//, "/$1/shop" + EC_SDE_SHOP_NUM + "/");
}
}
EC$(function(){
FwValidator.bind("BoardDelForm", false);
});
var sFormId = 'BoardDelForm'
var sEleId = ["BoardDelForm::password"]
AuthSSL.Bind(sFormId, sEleId);
EC$(function(){
FwValidator.bind("commentForm", false);
});
EC$(function() {
EC$('#commentForm').css('display', 'none');
});
EC$(function(){
FwValidator.bind("commentSecretForm", false);
});
EC$(function() {
EC$('#commentSecretForm').css('display', 'none');
});
EC$(function(){
FwValidator.bind("commentWriteForm", false);
});
EC$(function() {
BOARD_COMMENT.setCmtData();
});
EC$(function(){
FwValidator.bind("form_6951148744", false);
});
var aLogData = {"log_server1":"eclog2-225.cafe24.com","log_server2":"elg-db-svcm-285.cafe24.com","mid":"rlgh2587","stype":"e","domain":"","shop_no":1,"lang":"ko_KR","ver":2,"hash":"53754bfee505f4b6eb6fe50c4c6f580c","ca":"cfa-js.cafe24.com\/cfa.js","etc":""};
var sMileageName = '적립금';
var sMileageUnit = '[:PRICE:]원';
var sDepositName = '예치금';
var sDepositUnit = '원';
CAFE24.SHOP_CURRENCY_INFO = {"1":{"aShopCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"aShopSubCurrencyInfo":null,"aBaseCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"fExchangeRate":1,"fExchangeSubRate":null,"aFrontCurrencyFormat":{"head":"","tail":"\uc6d0"},"aFrontSubCurrencyFormat":{"head":"","tail":""}}}; var SHOP_CURRENCY_INFO = CAFE24.SHOP_CURRENCY_INFO;
var EC_ASYNC_LIVELINKON_ID = '';
if (EC$('[async_section=before]').length > 0) {
EC$('[async_section=before]').addClass('displaynone');
}

</script>
</body>
</html>

