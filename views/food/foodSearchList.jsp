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


<link rel="stylesheet" type="text/css" href="/css/gallery.css"  />
<link rel="stylesheet" type="text/css" href="/css/qna.css"/>


<style type="text/css">
#front-linker {z-index: 9999;position: fixed;left: 0;top: 0;right: 0;min-width: 1280px;height: 61px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 0;}#front-linker .show-ctrl h2 { width:210px; z-index: 260;margin: 0;position: absolute;left: 0;top: 0;overflow: hidden;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -71px;}#front-linker .show-ctrl .close {border: 0;position: absolute;right: 0;top: 0;overflow: hidden;width: 58px;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -191px;}#front-linker .show-ctrl .admin {margin: 0;position: absolute;right: 58px;top: 0;width: 164px;height: 50px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -131px;}#front-linker .show-ctrl .use { width:242px; position: absolute;left: 50%;top: 18px;overflow: hidden;height: 15px;margin-left: -216px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -413px;}#front-linker .show-ctrl .manual { width:78px;right:222px; position: absolute; top: 0; overflow: hidden; height: 50px; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -174px -131px;}#front-linker .show-ctrl .choice { width:240px;right:300px;margin-left:30px; position: absolute;top: 13px;}#front-linker .show-ctrl .choice li { margin:0 0 0 32px; position: relative; float: left; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -309px;}#introduce .hide {position: absolute;right: 13px;top: 8px;overflow: hidden;width: 7px;height: 7px;text-indent: -9999px;border: 0;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -22px -361px;}#front-linker .hide-ctrl .open {overflow: hidden;float: right;width: 104px;height: 30px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -68px -191px;}#atl-menu a .bullet {position: absolute;right: 0;top: 3px;width: 4px;height: 7px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -344px;}#atl-admin button.close {position: absolute;right: 15px;top: 8px;overflow: hidden;width: 12px;height: 11px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -361px;}#atl-admin .btn a {display: inline-block;overflow: hidden;width: 42px;height: 22px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat;}
</style>
<title> 갤러리 - 기호제학</title>
<meta name="path_role" content="BOARD_GALLERY_LIST" />
<meta name="author" content="기호제학" />
<meta name="description" content="갤러리입니다." />
<meta name="keywords" content="갤러리" />
<meta name="design_html_path" content="/board/gallery/list.html" /></head>
<body>

<!-- 메뉴버튼  -->
<div id="wrap">
<div id="container">
	<div style="margin-top: 150px"></div>
	<div class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
	<div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 "><div class="path">
	            <span>현재 위치</span>
	            <ol>
			<li><a href="/">홈</a></li>
	                <li>
	                	<a href="/board/index.html">게시판</a>
	                </li>
	                <li title="현재 위치">
	                	<strong>FAQ</strong>
	                </li>
	            </ol>
	</div>
	</div>
	<div class="titleArea">
	            <h1 style="text-align:center;"><font color="333333">맛집</font></h1>
	            <p>제주프렌즈의 맛집리스트</p>
	        </div>
	
	<div class="xans-element- xans-layout xans-layout-boardinfo cboth event_tab"><ul>
	<li rel="공지사항" class="xans-record-"><a href="/jejufriends/food/list.do?cp=1" class="move">맛집</a></li>
	<li rel="상품 Q&A" class="xans-record-"><a href="/jejufriends/landmark/list.do?cp=1" class="move">관광지 </a></li>
	<li rel="공지사항" class="xans-record-"><a href="/jejufriends/activity/list.do?cp=1" class="move">로컬체험</a></li>
	<li rel="상품 Q&A" class="xans-record-"><a href="/jejufriends/hotel/list.do?cp=1" class="move">숙소</a>
			</li>
		</ul>
	</div>



</div><!-- //header -->
<hr class="layout"/>

    
       <div id="contents">
            
<div class="xans-element- xans-board xans-board-listpackage-3001 xans-board-listpackage xans-board-3001 "><div class="xans-element- xans-board xans-board-title-3001 xans-board-title xans-board-3001 "><div class="path">
            <h2>현재 위치</h2>
            <ol>
<li><a href="/">홈</a></li>
                <li><a href="/board/index.html">게시판</a></li>
                <li title="현재 위치"><strong>갤러리</strong></li>
            </ol>
</div>
<div class="title">
            <h2><font color="#333333"></font> </h2>
            <p></p>
        </div>
<p class="imgArea"></p>
</div>
<div class="boardSort">
            </div>
<ul class="xans-element- xans-board xans-board-listheader-3001 xans-board-listheader xans-board-3001"><li class=""><a class="displaynone" href="/board/gallery/list.html?&board_no=8&category_no=1&cate_no=1&category_no=1"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_type_image.gif" alt="이미지형으로 보기"/></a></li>
<li class=""><a class="displaynone" href="/board/gallery/list2.html?&board_no=8&category_no=1&cate_no=1&category_no=1"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_type_list.gif" alt="리스트형으로 보기"/></a></li>
</ul>
<div class="xans-element- xans-board xans-board-list-3001 xans-board-list xans-board-3001"><!--
            $count = 12
            $login_page_url = /member/login.html
            $deny_access_url = /index.html
        -->
<ul>
          	<c:if test="${empty listResult}">
				<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
				   <td colspan="5">데이터가 하나도 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${listResult.list}" var="food">
			<li class="xans-record-">
			                <a href='content.do?fnum=${food.fnum }' class="imgLink"><img src="/photo/${food.fphoto }" onerror="this.src='http://img.echosting.cafe24.com/skin/base_ko_KR/board/@img_gallery.gif'" alt=""/></a>
			                <a href='content.do?fnum=${food.fnum }' class="imgLink">${food.fname } </a>
			                <span>
			                    <strong>맛집내용 : ${food.fintro} </strong>
			                    <em>영업시간 : ${food.fopcl}</em>
			                    <em>조회수 : ${food.views}</em>
			                </span>
			            </li>
			            </c:forEach> 
			        </ul>
				</div>

</div>


<div class="xans-element- xans-board xans-board-paging-8 xans-board-paging xans-board-8 ec-base-paginate"></a>
<button onclick="pageMove('back');" style="display: inline;"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지"/></button> <!-- 이전화살표 -->
		
<ol>
		<!-- 페이징 -->
		<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
  			<c:choose>
  			    <c:when test="${i==listResult.cp}">
               		<li class="xans-record-"><a href="list.do?cp=${i}" class="this">${i}</a></li> <!-- 원래는 다 회색이었는데 this라는 클래스때문에 검은색으로 바뀜 -->
               </c:when>
               <c:otherwise>
               		<li class="xans-record-"><a href=
               		"search.do?cp=${i}&search_key=${listResult.search_key}&surf=${listResult.surf}">${i}</a></li>
               </c:otherwise>
			</c:choose>
    	</c:forEach>
		<!-- 페이징 -->
		</ol>
		<button onclick="pageMove('next');" style="display: inline;"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지"/>
	
		</button> <!-- 다음화살표 -->
		</div>
<li class="xans-record-">
<a href="?board_no=8&category_no=1&cate_no=1&page=1&category_no=1" class="this"></a></li>
            </ol>
</div>





		<form id="boardSearchForm" name="boardSearchForm" action="search.do" method="get" target="_top" enctype="multipart/form-data" >
		<input type="hidden" name="cp" value="1"/>
			<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
				<fieldset class="boardSearch">
					<legend>게시물 검색</legend>
						<p class="category displaynone"></p>
						<div style="display: flex; justify-content: right; align-items: center;">
							<select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="" >
								<option value="fname">제목</option>
								<option value="fintro">내용</option>
							</select> 
							<input id="surf" name="surf" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text" style="margin-left: 10px;"/> 
							<button type="submit" href="#" class="btnEmFix" style="margin-left: 10px;">찾기</button>
						</div>
				</fieldset>
			</div>
		</form>

		</div><hr class="layout"/></div><!-- //container -->
	<hr class="layout"/><div id="quick"></div>
</div><!-- //wrap -->
<hr class="layout"/><div id="footer">
	<jsp:include page="../footer.jsp" flush="true"/>

		<script type="text/javascript">var sAuthSSLDomain = "https://login2.cafe24ssl.com";</script><script type="text/javascript" src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.js"></script><script type="text/javascript" src="https://login2.cafe24ssl.com/crypt/AuthSSLManager.plugin.js"></script>
		<span itemscope="" itemtype="http://schema.org/Organization">
		<link itemprop="url" href="https://rlgh2587.cafe24.com">
		</span>
		<script type="text/javascript" src="/ind-script/i18n.php?lang=ko_KR&domain=front&v=2203161305" charset="utf-8"></script>
		
		<script src="/ind-script/optimizer.php?filename=zVjbcts2EH23-drvYJ12Mn2NlUs7sWqN60yel-CShAlgUVxsM1_fpaS0VhLeQHumo5FEQTgHy92D3QXzhjTmF69cXjnQ-ECuzR16ik5gfudzefGbye78T_nYvCgtiDa_-zui645fv2Svs58XIvExoDOg_HEgE0StxLUs0amkW8hQZJVJhhoSZColRUiiuMh-5VfS4vxvIPeN36yjmvE5WJu_KyVPyG-eBHrnqIwibKnE_M8fI5_qooSAQfIEzbNMyFFs9xefZWhuv7yFAJmWZgGPkgWj8Javp1HeOmlCNYOeROzNek9Ob8gER0qhm8btVPRvrL10sqxn2BODVNOzKkd7T515UowgcxbInilp8KwAY-bYdaAQpDWZubMfwfA-NrwprMMwf5U9LqC2iuMyrKUtFVLhiZYO9o14ZQCnWYI85B-kXbZgFY3oHdrP61Wc6VH5z2EYMYKlmn867LunFAq-dIqgXATSMUC_7nXh0d0PBWcAbEl1lVSzpVdiBVGF3gVegwuXP1Dd8vRa1HIP-n8k-5ITiPHsUb-WCcFLU69l0Rig7NPhoBr_asiehPX9PlgfoQXK2_5zJx9RjeWiEZrNfi9-Gt2KA9AbrNChEbiJrv_udk6KBAs4fdTkuivpw2KwR3CiWbQrAlRV9331mQydVbGWnPLuQUmOGNfHYwj_Hcj4Avxq2l4jpvTf0zODZeHiy63QoLL44vfRgCnV4sSyYAFOlJJj_GL8nFTDs7lJkQCuNi1Np-n_LBjcJ5cErjzRO49mRT-aBopCpAGhHOzwpqCqTwV6X4UXNakQVP9OwnBzgWnIAvxyM4-9jIKOYkhFf21GEuETqhgHa1AqFUuuRJe8cOe5FiRFCh9xRMxbMFCftn0PWCiqF5WXr8Uw7608t8MlcRZeHH-dV3xCgbDWkueimXegaYJWfLiSQaJf5HbwnRGHz2ScRl2MiWwCft1LVJiQTHAJvsWwnsGON1WzOHZTeWKCZUORG48197LlVA51-n28RUtepq__WfpmvMGcQSAornCBQ4Er4Dd7-C0FUJtVdlyPJ98pQaHBSq4V9RV0K2z44KBMl9KbGIhzoBR7Gj5XPKSrmk_Lckc22nQKPve0eNyg6wJ7QrVK7FfyHpU0LZl1Kvtd9g8au2fQ65HpFopn4fkjoE70kIXQOFJ4PqMZn3Lz4NOgAbBNyOOHOnjObcyc562Ou9F-a_0D&type=js&k=f075cbd00e315bfe3a7712178154b46b9b5b876d&t=1645509281" ></script><script src="/ind-script/optimizer.php?filename=rc8xDsIwDIXhA6Qr57BAQnAPTtCmVuI0jtM6BvX2VEIsjKXbmz69H6IwAnpniovCkkO8XO83qDZk8i42zqAjuhGVQgGdqJwh96tYg6FX8pD0M7qkJ9ijbYAXZin_CCyjZfw-m4385J6Er93mb2OaDZe1G6pUqx1TOUzmo-t93zDIdvYwkS030ij1EalWKmGj3w&type=js&k=508668af452123b5f9ed8fc00617a8cbbbee9e35&t=1647412175&user=T" ></script>
		<script>
		<!-- 화살표 기능 구현 -->
		function pageMove(pm){
			//onclick이벤트를 줬다.(페이징 화살표 태그 안에)
			//totalpage
			var tpage = ${listResult.totalPageCount};//4
			//nowpage
			var npage = ${listResult.cp};//1
			//이전페이지
			var prepage = npage - 1;//0
			//다음페이지
			var propage = npage + 1;//2
			if(pm == 'back'){
				if(Number(npage) == 1){//사람 눈에 보이는 숫자를 기계도 숫자로 인식하게 함
					return false;//아무일도 일어나지 않게 해라.
				}else{
					location.href = 'list.do?cp='+prepage;//주소창에 해당 텍스트를 넣어서 엔터를 치는 기능이 곧 location.href
				}
				
			}else if(pm == 'next'){
				if(Number(npage) == Number(tpage)){
					return false;
				}else{
					location.href = 'list.do?cp='+propage;
				}
			}
		};
		<!-- 화살표 기능 구현 -->
		
		//input 태그 id가 subject
	    //*******if 괄호 안이 서브젝트면 이거 실행, else 면 content 넣어서 실행 하려면 어떡해야하나??*******
		$( "#surf" ).autocomplete({
	        source : function( request, response ) {
	             $.ajax({
	                    type: 'post',
	                    url: "autoData.json",
	                    dataType: "json",
	                    //request.term = $("#autocomplete").val()
	                    data: { surf : $("#surf").val()
	                    		, search_key : $("#search_key").val()},
	                    		//faq/autoData.json?subject=내&search_key=subject
	                    //select * from BOARD where writer like %?%;
	                    success: function(data) {//DB에 쿼리가 쳐지고 나서 결과값이  컨트롤러에서 list란 변수에 담김. 그리고 autoData.json으로 호출한 여기로 돌아옴. 결론, data가 list로 갱신.
	                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
	                        response(
	                            $.map(data, function(item) {// $.map(1,function(2))은 1파라미터 값을 2라는 이름의 맵으로 변환 
	                            	if($("#search_key").val() == "fname"){
										 return {
												label: item.fname
												//value: item.subject
										 }		                               
	                            		
	                            	}else{
										 return {
												label: item.fintro 
												//value: item.content
										 }		                               
	                            		
	                            	}
	                            })
	                        );
	                    }
	               });
	            },
	        //조회를 위한 최소글자수
	        minLength: 1,
	        select: function( event, ui ) {
	            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생   
            	//alert("선택된 아이템: " + ui.item.value);  
	        }
	    });
	
	}
		</script>
		
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


