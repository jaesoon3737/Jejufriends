<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/faq/kakaoTalk.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
	<% //스크립틀릿은 java
		/* session에 저장된 이메일을 가지고와서 글쓰기 버튼 보여줄건지 체크 */
		String userEmail = (String)session.getAttribute("email");
		/* String userEmail = (String)session.getAttribute(SessionLoginConst.LOGIN_MEMBER_EMAIL);
		String userNickName = (String)session.getAttribute(SessionLoginConst.LOGIN_MEMBER_NICKNAME); */
		
	%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 -->
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<meta http-equiv="Expires" content="0"/>
		<meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. -->
		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
	
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
					JEJU FRIENDS
				</div>
			</div>
	
     		<div class="wrap-menu-desktop">
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
		<!-- 주석을 풀면 자동완성 기능인 autocomplete를 찾을수 없음  -->
			 <!-- <script src="/vendor/jquery/jquery-3.2.1.min.js"></script> -->
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
		<meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/>
		<meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://ecudemo126609.cafe24.com/board/상품-qa/6/" />
		<link rel="alternate" href="http://m.ecudemo126609.cafe24.com/board/상품-qa/6/" />
		<meta property="og:url" content="http://ecudemo126609.cafe24.com/board/상품-qa/6/" />
		<meta property="og:title" content="상품 Q&amp;A - 쇼핑몰 이름" />
		<meta property="og:description" content="상품 Q&amp;A입니다." />
		<meta property="og:site_name" content="쇼핑몰 이름" />
		<meta property="og:type" content="article" />
		<!-- <script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=64ad5b9a963f4fb3ff2ab35465471511"></script> -->
		<script type="text/javascript">
			window.CAFE24 = window.CAFE24 || {};
			CAFE24.MANIFEST_CACHE_REVISION = '2203161305';
			CAFE24.getDeprecatedNamespace = function(sDeprecatedNamespace, sSupersededNamespace) {
			var sNamespace = sSupersededNamespace 
			? sSupersededNamespace 
			: sDeprecatedNamespace.replace(/^EC_/, '');
			return CAFE24[sNamespace];
			}
			CAFE24.FRONT_LANGUAGE_CODE = "ko_KR";
			CAFE24.MOBILE = false;
			CAFE24.MOBILE_DEVICE = false;
			CAFE24.MOBILE_USE = true;
			var EC_MOBILE = CAFE24.MOBILE;
			var EC_MOBILE_DEVICE = CAFE24.MOBILE_DEVICE;
			var EC_MOBILE_USE = CAFE24.MOBILE_USE;
			CAFE24.SKIN_CODE = "base";
			CAFE24.FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = {"common_member_id_crypt":""};
			var EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = CAFE24.getDeprecatedNamespace('EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA');
			CAFE24.SDE_SHOP_NUM = 1;CAFE24.SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },getTimezone: function() { return "Asia/Seoul" },getDateFormat: function() { return "Y-m-d" },isMultiShop : function() { return false; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isPH : function() { return false; },getCountryAndLangMap : function() { return {
			"KR": "ko_KR",
			"US": "en_US",
			"JP": "ja_JP",
			"CN": "zh_CN",
			"TW": "zh_TW",
			"VN": "vi_VN",
			"PH": "en_PH"
			}},isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return false; },getModeName : function() {return false; },isMobileAdmin : function() {return false; },isExperienceMall : function() { return false; },getAdminID : function() {return ''},getMallID : function() {return 'ecudemo126609'},getCurrencyFormat : function(sPriceTxt, bIsNumberFormat) { 
			sPriceTxt = String(sPriceTxt);
			var aCurrencySymbol = ["","\uc6d0",false];
			if (typeof CAFE24.SHOP_PRICE !== 'undefined' && isNaN(sPriceTxt.replace(/[,]/gi, '')) === false && bIsNumberFormat === true) {
			// bIsNumberFormat 사용하려면 Ui(':libUipackCurrency')->plugin('Currency') 화폐 라이브러리 추가 필요
			sPriceTxt = CAFE24.SHOP_PRICE.toShopPrice(sPriceTxt.replace(/[,]/gi, ''), true, CAFE24.SDE_SHOP_NUM);
			}
			try {
			var sPlusMinusSign = (sPriceTxt.toString()).substr(0, 1);
			if (sPlusMinusSign === '-' || sPlusMinusSign === '+') {
			sPriceTxt = (sPriceTxt.toString()).substr(1);
			return sPlusMinusSign + aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
			} else {
			return aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
			}
			} catch (e) {
			return aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
			}
			}};CAFE24.CURRENCY_INFO = {getOriginReferenceCurrency : function() {return 'USD'},getCurrencyList : function(sCurrencyCode) { var aCurrencyList = {"JPY":{"currency_symbol":"&yen;","decimal_place":0,"round_method_type":"F"},"VND":{"currency_symbol":"&#8363;","decimal_place":0,"round_method_type":"F"},"PHP":{"currency_symbol":"&#8369;","decimal_place":2,"round_method_type":"R"},"USD":{"currency_symbol":"$","decimal_place":2,"round_method_type":"R"},"CNY":{"currency_symbol":"&yen;","decimal_place":2,"round_method_type":"R"},"TWD":{"currency_symbol":"NT$","decimal_place":0,"round_method_type":"F"},"EUR":{"currency_symbol":"\u20ac","decimal_place":2,"round_method_type":"R"},"BRL":{"currency_symbol":"R$","decimal_place":2,"round_method_type":"R"},"AUD":{"currency_symbol":"A$","decimal_place":2,"round_method_type":"R"},"BHD":{"currency_symbol":".&#1583;.&#1576;","decimal_place":3,"round_method_type":"R"},"BDT":{"currency_symbol":"&#2547;","decimal_place":2,"round_method_type":"R"},"GBP":{"currency_symbol":"&pound;","decimal_place":2,"round_method_type":"R"},"CAD":{"currency_symbol":"C$","decimal_place":2,"round_method_type":"R"},"CZK":{"currency_symbol":"K&#269;","decimal_place":2,"round_method_type":"R"},"DKK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"HKD":{"currency_symbol":"HK$","decimal_place":2,"round_method_type":"R"},"HUF":{"currency_symbol":"Ft","decimal_place":2,"round_method_type":"R"},"INR":{"currency_symbol":"&#8377;","decimal_place":2,"round_method_type":"R"},"IDR":{"currency_symbol":"Rp","decimal_place":2,"round_method_type":"R"},"ILS":{"currency_symbol":"&#8362;","decimal_place":2,"round_method_type":"R"},"JOD":{"currency_symbol":" &#1583;&#1610;&#1606;&#1575;&#1585;","decimal_place":3,"round_method_type":"R"},"KWD":{"currency_symbol":"&#1583;&#1610;&#1606;&#1575;&#1585;","decimal_place":3,"round_method_type":"R"},"MYR":{"currency_symbol":"RM","decimal_place":2,"round_method_type":"R"},"MXN":{"currency_symbol":"Mex$","decimal_place":2,"round_method_type":"R"},"NZD":{"currency_symbol":"NZ$","decimal_place":2,"round_method_type":"R"},"NOK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"PKR":{"currency_symbol":"&#8360;","decimal_place":2,"round_method_type":"R"},"PLN":{"currency_symbol":"z\u0142","decimal_place":2,"round_method_type":"R"},"RUB":{"currency_symbol":"\u0440\u0443\u0431","decimal_place":2,"round_method_type":"R"},"SAR":{"currency_symbol":"&#65020;","decimal_place":2,"round_method_type":"R"},"SGD":{"currency_symbol":"S$","decimal_place":2,"round_method_type":"R"},"ZAR":{"currency_symbol":"R","decimal_place":2,"round_method_type":"R"},"SEK":{"currency_symbol":"kr","decimal_place":2,"round_method_type":"R"},"CHF":{"currency_symbol":"Fr","decimal_place":2,"round_method_type":"R"},"THB":{"currency_symbol":"&#3647;","decimal_place":2,"round_method_type":"R"},"TRY":{"currency_symbol":"TL","decimal_place":2,"round_method_type":"R"},"AED":{"currency_symbol":"&#1601;&#1604;&#1587;","decimal_place":2,"round_method_type":"R"}}; return aCurrencyList[sCurrencyCode] },isUseReferenceCurrency : function() {return false }};CAFE24.COMMON_UTIL = {convertSslForString : function(sString) { return sString.replace(/http:/gi, '');},convertSslForHtml : function(sHtml) { return sHtml.replace(/((?:src|href)\s*=\s*['"])http:(\/\/(?:[a-z0-9\-_\.]+)\/)/ig, '$1$2');},getProtocol : function() { return 'http'; },moveSsl : function() { if (CAFE24.COMMON_UTIL.getProtocol() === 'http') { var oLocation = jQuery(window.location); var sUrl = 'https://' + oLocation.attr('host') + oLocation.attr('pathname') + oLocation.attr('search'); window.location.replace(sUrl); } },setEcCookie : function(sKey, sValue, iExpire) {var exdate = new Date();exdate.setDate(exdate.getDate() + iExpire);var setValue = escape(sValue) + "; domain=." + CAFE24.GLOBAL_INFO.getBaseDomain() + "; path=/;expires=" + exdate.toUTCString();document.cookie = sKey + "=" + setValue;}};CAFE24.SHOP_LIB_INFO = {getBankInfo : function() { 
			var oBankInfo = "";
			$.ajax({
			type: "GET",
			url: "/exec/front/Shop/Bankinfo",
			dataType: "json",
			async: false,
			success: function(oResponse) {
			oBankInfo = oResponse;
			}
			});
			return oBankInfo; }};            
			var EC_SDE_SHOP_NUM = CAFE24.SDE_SHOP_NUM;
			var SHOP = CAFE24.getDeprecatedNamespace('SHOP');
			var EC_COMMON_UTIL = CAFE24.getDeprecatedNamespace('EC_COMMON_UTIL');
			var EC_SHOP_LIB_INFO = CAFE24.getDeprecatedNamespace('EC_SHOP_LIB_INFO');
			var EC_CURRENCY_INFO = CAFE24.getDeprecatedNamespace('EC_CURRENCY_INFO');
			CAFE24.ROOT_DOMAIN = "cafe24.com";
			CAFE24.API_DOMAIN = "cafe24api.com";
			CAFE24.TRANSLATE_LOG_STATUS = "F";
			CAFE24.GLOBAL_INFO = (function() {
			var oData = {"base_domain":"ecudemo126609.cafe24.com","root_domain":"cafe24.com","api_domain":"cafe24api.com","is_global":false,"is_global_standard":false,"country_code":"KR","language_code":"ko_KR","admin_language_code":"ko_KR"};
			return {
			getBaseDomain: function() {
			return oData['base_domain'];
			},
			getRootDomain: function() {
			return oData['root_domain'];
			},
			getApiDomain: function() {
			return oData['api_domain'];
			},
			isGlobal: function() {
			return oData['is_global'];
			},
			isGlobalStandard: function() {
			return oData['is_global_standard'];
			},
			getCountryCode: function() {
			return oData['country_code'];
			},
			getLanguageCode: function() {
			return oData['language_code'];
			},
			getAdminLanguageCode: function() {
			return oData['admin_language_code'];
			}
			};
			})();
			var EC_ROOT_DOMAIN = CAFE24.ROOT_DOMAIN;
			var EC_API_DOMAIN = CAFE24.API_DOMAIN;
			var EC_TRANSLATE_LOG_STATUS = CAFE24.TRANSLATE_LOG_STATUS;
			var EC_GLOBAL_INFO = CAFE24.getDeprecatedNamespace('EC_GLOBAL_INFO');
			CAFE24.AVAILABLE_LANGUAGE = ["ko_KR","zh_CN","en_US","zh_TW","es_ES","pt_PT","vi_VN","ja_JP","en_PH"];
			CAFE24.AVAILABLE_LANGUAGE_CODES = {"ko_KR":"KOR","zh_CN":"CHN","en_US":"ENG","zh_TW":"TWN","es_ES":"ESP","pt_PT":"PRT","vi_VN":"VNM","ja_JP":"JPN","en_PH":"PHL"};
			var EC_AVAILABLE_LANGUAGE = CAFE24.AVAILABLE_LANGUAGE;
			var EC_AVAILABLE_LANGUAGE_CODES = CAFE24.AVAILABLE_LANGUAGE_CODES;
			CAFE24.GLOBAL_PRODUCT_LANGUAGE_CODES = {  
			sClearanceCategoryCode: '',
			sManualLink: '//serviceguide.cafe24shop.com/ko_KR/PR.PD.GA.html',
			sHsCodePopupLink: 'https://www.wcotradetools.org/en/harmonized-system',
			aCustomRegex: '"PHL" : "^[0-9]{8}[A-Z]?$"',
			sCountryCodeData: 'kor',
			sEnglishExampleURlForGlobal: '',
			aReverseAddressCountryCode: ["VNM","PHL"],
			aSizeGuideCountryAlign: '["US","UK","EU","KR","JP","CN"]',
			aIsSupportTran: ["ja_JP","zh_CN","zh_TW","en_US","vi_VN","en_PH","pt_PT","es_ES"]
			};
			var EC_GLOBAL_PRODUCT_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_PRODUCT_LANGUAGE_CODES');
			CAFE24.GLOBAL_ORDER_LANGUAGE_CODES = {
			aModifyOrderLanguage: {"KR":"ko_KR","JP":"ja_JP","CN":"zh_CN","TW":"zh_TW","VN":"vi_VN","PH":"en_PH"},
			aUseIdCardKeyCountry: ["CN","TW"],
			aLanguageWithCountryCode: {"zh_CN":["CN","CHN","HK","HNK"],"ja_JP":["JP","JPN"],"zh_TW":["TW","TWN"],"ko_KR":["KR","KOR"],"vi_VN":["VN","VNM"],"en_PH":["PH","PHL"]},
			aCheckDisplayRequiredIcon: ["ja_JP","zh_CN","zh_TW","en_US","vi_VN","en_PH"],
			aSetReceiverName: {"zh_CN":{"sCountry":"CN","bUseLastName":true},"zh_TW":{"sCountry":"TW","bUseLastName":false},"ja_JP":{"sCountry":"JP","bUseLastName":true}},
			aSetDeferPaymethodLanguage: {"ja_JP":"\uc77c\ubcf8","zh_CN":"\uc911\uad6d"},
			aUseDeferPaymethod: ["ja_JP","zh_CN"],
			aCheckShippingCompanyAndPaymethod: ["ja_JP","zh_CN"],
			aSetDeferPaymethodLanguageForShipping: {"ja_JP":"\u65e5\u672c","zh_CN":"\uc911\uad6d"},
			aCheckStoreByPaymethod: ["ja_JP","zh_CN"],
			aCheckIsEmailRequiredForJs: ["en_US","zh_CN","zh_TW","ja_JP","vi_VN","en_PH"],
			aSetIdCardKeyCountryLanguage: {"CN":"\uc911\uad6d\uc758","TW":"\ub300\ub9cc\uc758"},
			aReverseGlobalAddress: ["en_PH","vi_VN","PHL","VNM","VN","PH"],
			aNoCheckZipCode: ["KOR","JPN"],
			aNotPostCodeAPICountryList: ["en_US","es_ES","pt_PT","en_PH"],
			aEnableSearchExchangeAddr: ["KR","JP","CN","VN","TW","PH"],
			aDuplicatedBaseAddr: ["TW","JP"],
			aReverseAddressCountryCode: ["VN","PH"],
			aCheckZipCode: ["PHL","en_PH","PH"]
			};
			var EC_GLOBAL_ORDER_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_ORDER_LANGUAGE_CODES');
			CAFE24.GLOBAL_MEMBER_LANGUAGE_CODES = {  
			sAdminWebEditorLanguageCode: 'ko' ,
			oNotAvailDecimalPointLanguages: ["ko_KR","ja_JP","zh_TW","vi_VN"],
			oAddressCountryCode: {"KOR":"ko_KR","JPN":"ja_JP","CHN":"zh_CN","TWN":"zh_TW","VNM":"vi_VN","PHL":"en_PH"},
			};
			var EC_GLOBAL_MEMBER_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_MEMBER_LANGUAGE_CODES');
			CAFE24.GLOBAL_BOARD_LANGUAGE_CODES = {  
			bUseLegacyBoard: true
			};
			var EC_GLOBAL_BOARD_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_BOARD_LANGUAGE_CODES');
			CAFE24.GLOBAL_MALL_LANGUAGE_CODES = {
			oDesign: {
			oDesignAddReplaceInfo: {"group_id":"SKIN.ADD.ADMIN.DESIGNDETAIL","replacement":{"KR":"KOREAN","US":"ENGLISH","JP":"JAPANESE","CN":"SIMPLIFIED.CHINESE","TW":"TRADITIONAL.CHINESE","ES":"SPANISH","PT":"PORTUGUESE","PH":"ENGLISH"}},
			oDesignDetailLanguageCountryMap: {"KR":"ko_KR","JP":"ja_JP","CN":"zh_CN","TW":"zh_TW","US":"en_US","ES":"es_ES","PT":"pt_PT","PH":"en_PH"},
			oSmartDesignSwitchTipLink: {"edibot":{"img":"\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/img_editor_dnd.png","link":"\/\/ecsupport.cafe24.com\/board\/free\/list.html?board_act=list&board_no=12&category_no=9&cate_no=9"},"smart":{"img":"\/\/img.echosting.cafe24.com\/smartAdmin\/img\/design\/ko_KR\/img_editor_smart.png","link":"\/\/sdsupport.cafe24.com"}},
			oSmartDesignDecoShopList: ["ko_KR","ja_JP","zh_CN","en_US","zh_TW","es_ES","pt_PT"],
			oSmartDesignDecoMultilingual: {"list":{"ko_KR":"KOREAN","en_US":"ENGLISH","ja_JP":"JAPANESE","zh_CN":"SIMPLIFIED.CHINESE","zh_TW":"TRADITIONAL.CHINESE","es_ES":"SPANISH","pt_PT":"PORTUGUESE","vi_VN":"VIETNAMESE"},"group_id":"EDITOR.LAYER.EDITING.DECO"},
			aSmartDesignModuleShopList: ["ko_KR","ja_JP","zh_CN","en_US","zh_TW","es_ES","pt_PT"]
			},
			oStore: {
			oMultiShopCurrencyInfo: {"en_US":{"currency":"USD"},"zh_CN":{"currency":"USD","sub_currency":"CNY"},"ja_JP":{"currency":"JPY"},"zh_TW":{"currency":"TWD"},"es_ES":{"currency":"EUR"},"pt_PT":{"currency":"EUR"},"ko_KR":{"currency":"KRW"},"vi_VN":{"currency":"VND"},"en_PH":{"currency":"PHP"}},
			oBrowserRedirectLanguage: {"ko":{"primary":"ko_KR","secondary":"en_US"},"en":{"detail":{"en-ph":{"primary":"en_PH","secondary":"en_US"},"en-us":{"primary":"en_US","secondary":"es_ES"},"default":{"primary":"en_US","secondary":"es_ES"}}},"ja":{"primary":"ja_JP","secondary":"en_US"},"zh":{"detail":{"zh-cn":{"primary":"zh_CN","secondary":"en_US"},"zh-tw":{"primary":"zh_TW","secondary":"zh_CN"},"default":{"primary":"en_US","secondary":"ko_KR"}}},"es":{"primary":"es_ES","secondary":"en_US"},"pt":{"primary":"pt_PT","secondary":"en_US"},"vi":{"primary":"vi_VN","secondary":"en_US"},"default":{"primary":"en_US","secondary":"ko_KR"}},
			aChangeableLanguages: ["en_US","vi_VN","ja_JP","ko_KR","zh_TW","th_TH"],
			aNoZipCodeLanguage: ["ko_KR","ja_JP"]
			},
			oMobile: {
			sSmartWebAppFaqUrl: "https://ecsupport.cafe24.com/board/free/read.html?no=1832&board_no=5&category_no=13&cate_no=13&category_no=13&category_no=13",
			sAmpFaqUrl: "https://ecsupport.cafe24.com/board/free/read.html?no=1864&board_no=5&category_no=13&cate_no=13&category_no=13&category_no=13",
			},
			oPromotion: {
			bQrCodeAvailable: true,
			bSnsMarketingAvailable: true
			},
			oShippingReverseAddressLanguage: ["vi_VN","en_PH"] ,
			oGlobalStandardSwitchHelpCodeLink: {"SH.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/SH.DS.html"},"PR.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/PR.DS.html"},"OR.SM.BO":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/OR.SM.BO.html"},"CU.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/CU.DS.html"},"DE.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/DE.DS.html"},"MB.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/MB.DS.html"},"PM.DS":{"link":"\/\/serviceguide.cafe24shop.com\/en_PH\/PM.DS.html"}},
			getAdminMainLocaleLanguage: function(sSkinLocaleCode) {
			var oLocaleData = [];
			var locale = "";
			var shopLangName = ""; 
			if (sSkinLocaleCode == "US") {
			locale = "en_US";
			shopLangName = "ENGLISH";
			} else if (sSkinLocaleCode == "JP") {
			locale = "ja_JP";
			shopLangName = "JAPANESE";
			} else if (sSkinLocaleCode == "CN") {
			locale = "zh_CN";
			shopLangName = "SIMPLIFIED.CHINESE";
			} else if (sSkinLocaleCode == "TW") {
			locale = "zh_TW";
			shopLangName = "TRADITIONAL.CHINESE";
			} else if (sSkinLocaleCode == "ES") {
			locale = "es_ES";
			shopLangName = "SPANISH";
			} else if (sSkinLocaleCode == "PT") {
			locale = "pt_PT";
			shopLangName = "PORTUGUESE";
			} else if (sSkinLocaleCode == "VN") {
			locale = "vi_VN";
			shopLangName = "VIETNAMESE";
			} else if(sSkinLocaleCode == "PH") {
			locale = "en_PH";
			shopLangName = "ENGLISH.PH";
			}
			oLocaleData["locale"] = locale;
			oLocaleData["shopLangName"] = shopLangName;
			return oLocaleData;
			}
			};
			var EC_GLOBAL_MALL_LANGUAGE_CODES = CAFE24.getDeprecatedNamespace('EC_GLOBAL_MALL_LANGUAGE_CODES');
			CAFE24.GLOBAL_DATETIME_INFO = {
			oConstants: {"STANDARD_DATE_REGEX":"\/([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))\/","IN_ZONE":"inZone","OUT_ZONE":"outZone","IN_FORMAT":"inFormat","OUT_FORMAT":"outFormat","IN_DATE_FORMAT":"inDateFormat","IN_TIME_FORMAT":"inTimeFormat","OUT_DATE_FORMAT":"outDateFormat","OUT_TIME_FORMAT":"outTimeFormat","IN_FORMAT_DATE_ONLY":1,"IN_FORMAT_TIME_ONLY":2,"IN_FORMAT_ALL":3,"OUT_FORMAT_DATE_ONLY":1,"OUT_FORMAT_TIME_ONLY":2,"OUT_FORMAT_ALL":3,"DATE_ONLY":"YYYY-MM-DD","TIME_ONLY":"HH:mm:ss","FULL_TIME":"YYYY-MM-DD HH:mm:ss","ISO_8601":"YYYY-MM-DD[T]HH:mm:ssZ","YEAR_ONLY":"YYYY","MONTH_ONLY":"MM","DAY_ONLY":"DD","WEEK_ONLY":"e","TIME_H_I_ONLY":"HH:mm","TIME_HOUR_ONLY":"HH","TIME_MINUTE_ONLY":"mm","POSTGRE_FULL_TIME":"YYYY-MM-DD HH24:MI:SS","POSTGRE_TIME_ONLY":" HH24:MI:SS","MICRO_SECOND_ONLY":"u","SEOUL":"Asia\/Seoul","TOKYO":"Asia\/Tokyo","SHANGHAI":"Asia\/Shanghai","TAIPEI":"Asia\/Taipei","HANOI":"Asia\/Bangkok","LOS_ANGELES":"America\/Los_Angeles","LISBON":"Europe\/Lisbon","MADRID":"Europe\/Madrid","SINGAPORE":"Asia\/Singapore","UTC":"Etc\/UTC","MAX_DATETIME":"9999-12-31 23:59:59"},
			oOptions: {"inZone":"Asia\/Seoul","inFormat":"YYYY-MM-DD HH:mm:ss","inDateFormat":"YYYY-MM-DD","inTimeFormat":"HH:mm:ss","outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"},
			oPolicies: {"shop":{"outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"}},
			sOverrideTimezone: '',
			sMomentNamespace: 'EC_GLOBAL_MOMENT'
			};
			CAFE24.FRONT_JS_CONFIG_MANAGE = {"sSmartBannerScriptUrl":"https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206","sMallId":"ecudemo126609","sDefaultAppDomain":"https:\/\/app4you.cafe24.com","sWebLogOffFlag":"F","cdnUrl":"http:"};
			var EC_FRONT_JS_CONFIG_MANAGE = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MANAGE');
			CAFE24.FRONT_JS_CONFIG_MEMBER = {"sAuthUrl":"https:\/\/i-pin.cafe24.com\/certify\/1.0\/?action=auth"};
			var EC_FRONT_JS_CONFIG_MEMBER = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MEMBER');
			typeof window.CAFE24 === "undefined" && (window.CAFE24 = {});
			CAFE24.ROUTE = {"is_mobile":false,"is_need_route":false,"language_code":"ko_KR","path":{"origin":"\/board\/\uc0c1\ud488-qa\/6\/","result":"\/board\/\uc0c1\ud488-qa\/6\/","prefix":""},"shop_no":0,"skin_code":"default"};
		</script>
		<link rel="stylesheet" type="text/css" href="/css/public1.css"/>
		
		<link rel="stylesheet" type="text/css" href="/css/public2.css"/>
		
		<link rel="stylesheet" type="text/css" href="/css/qna.css"/>
		
		<title> FAQ </title>
		<meta name="path_role" content="BOARD_PRODUCT_LIST" />
		<meta name="description" content="상품 Q&amp;A입니다." />
		<meta name="keywords" content="상품 Q&amp;A" />
		<meta name="design_html_path" content="/board/product/list.html" />
	</head>
	<body>

		
		<hr class="layout"/>
		<div id="wrap">
		    <div id="container">
		        <div id="contents">
		    		<div style="margin-top: 150px"></div>
					<div class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
						<div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
							<div class="path">
					            <span>현재 위치</span>
					            <ol>
									<li>
										<a href="/">홈</a>
									</li>
					                <li>
					                	<a href="/board/index.html">게시판</a>
					                </li>
					                <li title="현재 위치">
					                	<strong>FAQ</strong>
					                </li>
					            </ol>
							</div> <!-- path -->
							<div class="titleArea">
					            <h1 style="text-align:center;">
					           		<font color="333333">FAQ</font>
					            </h1>
					            <p>FAQ입니다.</p>
					        </div>
							<div class="xans-element- xans-layout xans-layout-boardinfo cboth event_tab">
								<ul>
									<li rel="Q&A" class="xans-record-">
										<a href="/jejufriends/qna/list.do?cp=1" class="move">Q&A</a>
									</li>
									<li rel="FAQ" class="xans-record-">
										<a href="/jejufriends/faq/list.do?cp=1" class="move">FAQ </a>
									</li>
								</ul>
							</div>
							<div class="boardSort">
								<span class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
							</div>
							<div class="ec-base-table typeList gBorder">
							<!-- 리스트 -->
		        				<table border="1" summary="">
									<caption>상품 게시판 목록</caption>
		        					<colgroup class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 center">
		        						<col style="width:10%;"/>
										<col style="width:60%;"/>
										<col style="width:25%;"/>
										<col style="width:15%;"/>
									</colgroup>
									<thead class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 center ">
										<tr>
											<th scope="col">번호</th>
							                <th scope="col">&nbsp;&nbsp;제목</th>
							                <th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</th>
							                <th scope="col">조회</th>
						                </tr>
						            </thead>
									<tbody class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4 center">
						            	<c:if test="${empty listResult}">
											<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
											   <td colspan="5">데이터가 하나도 없음</td>
											</tr>
										</c:if>
										<c:forEach items="${listResult.list}" var="faq"> <!-- FaqListResult안에 list(컬렉션)를 faq라는 변수로 이름 바꿔주는 기능 -->
						            	<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
											<td class="subject left txtBreak">${faq.rnum}</td>
							                <td class="subject left txtBreak">
				                     			<a href="content.do?seq=${faq.seq}" style="color:#555555;">${faq.subject}</a> <span class="txtEm"></span>
			                				</td>
							                <td class="subject left txtBreak"><span class="txtNum">${faq.rdate}</span></td>
							                <td class="subject left txtBreak"><span class="txtNum">${faq.hits}</span></td>
						            	</tr>
						            	</c:forEach>      
									</tbody>
								</table>
								<!-- 리스트 -->
								<p class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message displaynone "></p>
		    				</div>
							<div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4 ec-base-button typeBG ">
							<span class="gRight">
								<a id="adminBox" href="write.do" class="btnSubmitFix sizeS">글쓰기</a>
								<!-- <a href="javascript:chatChannel()" class="btnSubmitFix sizeS">카카오톡</a> -->
								<a href="javascript:chatChannel()">
									<img src="/img/kakao.png" alt="" style="width:40px; height:40px;"/>
								</a>
								
								<!-- <a href="https://pf.kakao.com/_FxgJNb/chat" class="btnSubmitFix sizeS"><img src="/img/kakao.png" alt="" style="width:44.547px; height:18px;"></a> -->
							</span>
						</div>
					</div>
		
		<div class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4 ec-base-paginate">
		<button onclick="pageMove('back');" style="display: inline;"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif" alt="이전 페이지"/></button> <!-- 이전화살표 -->
		<ol>
		<!-- 페이징 -->
		<c:forEach begin="1" end="${listResult.totalPageCount}" var="i">
  			<c:choose>
  			    <c:when test="${i==listResult.cp}">
               		<li class="xans-record-"><a href="list.do?cp=${i}" class="this">${i}</a></li> <!-- 원래는 다 회색이었는데 this라는 클래스때문에 검은색으로 바뀜 -->
               </c:when>
               <c:otherwise>
               		<li class="xans-record-"><a href="list.do?cp=${i}">${i}</a></li>
               </c:otherwise>
			</c:choose>
    	</c:forEach>
		<!-- 페이징 -->
		</ol>
		<button onclick="pageMove('next');" style="display: inline;"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif" alt="다음 페이지"/></button> <!-- 다음화살표 -->
		</div>
		
		<script type="text/javascript">
		window.onload = function(e){
			  let csrfParameter = $('meta[name="_csrf_parameter"]').attr('content');
	 		  let csrfHeader = $('meta[name="_csrf_header"]').attr('content');
	  		  let csrfToken = $('meta[name="_csrf"]').attr('content');
			var userEmail = '<%=userEmail%>'; <%-- 여기는 js라서 스크립틀릿 안에 있는 java변수 넣을 때 <%=%>를 쓴다. --%>
			if(userEmail != ('admin@gmail.com'&&'admin2@gmail.com')){
				document.getElementById("adminBox").style.display = 'none';//id가 adminbox인 태그를 안보이게 함(글쓰기)
			}
			
			//document.getElementById("btn_write").style.display = "none";
	    	$.ui.autocomplete.prototype._renderItem = function (ul, item) {
			    item.label = item.label.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + $.ui.autocomplete.escapeRegex(this.term) + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
			    return $("<li></li>")
			            .data("item.autocomplete", item)
			            .append("<a>" + item.label + "</a>")
			            .appendTo(ul);
			};
			
			
					
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
                    	    beforeSend: function(xhr) {
        	                    xhr.setRequestHeader(csrfHeader, csrfToken);
        	                }  ,
		                    		
		                    success: function(data) {//DB에 쿼리가 쳐지고 나서 결과값이  컨트롤러에서 list란 변수에 담김. 그리고 autoData.json으로 호출한 여기로 돌아옴. 결론, data가 list로 갱신.
		                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
		                        response(
		                            $.map(data, function(item) {// $.map(1,function(2))은 1파라미터 값을 2라는 이름의 맵으로 변환 
		                            	if($("#search_key").val() == "subject"){
											 return {
													label: item.subject
													//value: item.subject
											 }		                               
		                            		
		                            	}else{
											 return {
													label: item.content 
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
			}
			<!-- 화살표 기능 구현 -->
			
		</script>
		<form id="boardSearchForm" name="boardSearchForm" action="search.do" method="get" target="_top" enctype="multipart/form-data" >
		<input type="hidden" name="cp" value="1"/>
			<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
				<fieldset class="boardSearch">
					<legend>게시물 검색</legend>
						<p class="category displaynone"></p>
						<div style="display: flex; justify-content: right; align-items: center;">
							<select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="" >
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select> 
							<input id="surf" name="surf" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="" type="text" style="margin-left: 10px;"/> 
							<button type="submit" href="#" class="btnEmFix" style="margin-left: 10px;">찾기</button>
						</div>
				</fieldset>
			</div>
		</form>
		<!-- 관리자 전용 메뉴 -->
		
		<!-- // 관리자 전용 메뉴 -->
				</div><hr class="layout"/></div><!-- //container -->
			<hr class="layout"/><div id="quick"></div>
		</div><!-- //wrap -->
		<hr class="layout"/><div id="footer">
			<!-- <div class="xans-element- xans-layout xans-layout-footer cboth inner "><div class="bt_logo"><a href="/"><img src="/images/logo.png"/></a></div> -->
			<div class="xans-element- xans-layout xans-layout-footer cboth inner "><div class="bt_logo"><a href="/"></a></div>
		<div class="bt_info">
					<div class="bt_title">디센터</div>
					대표자 : 조혜진<br/>
					소재지 :   <br/>
					사업자등록번호 : 114-81-20586 <br/>
					통신판매업신고번호 : <br/>
					개인정보보호책임자 : <a href="mailto:">()</a>
				</div>
		<!-- //bt_info -->
		<div class="bt_cscenter">
					<div class="bt_title">고객센터</div>
					<br/>
							</div>
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
					<div class="copyright">COPYRIGHT © <span>쇼핑몰 이름. </span> ALL RIGHTS RESERVED. HOSTING BY 카페24(주)</div>
		
					<div class="cboth bt_sns">
		<!-- 하단 SNS 링크 수정하는곳 -->
						<!-- <a href="https://www.instagram.com/" target="_blank" class="move"><img src="/images/icon_insta.png"/></a> -->
						<!-- <a href="https://www.facebook.com/" target="_blank" class="move"><img src="/images/icon_fb.png"/></a> -->
						</div>
				</div>
		</div>
		<!-- //inner -->
		</div><!-- //footer -->
		
		<!-- 결제를 위한 필수 영역 -->
		<div id="progressPaybar" style="display:none;">
		    <div id="progressPaybarBackground" class="layerProgress"></div>
		    <div id="progressPaybarView">
		        <div class="box">
		            <p class="graph">
		                <span><img src="//img.echosting.cafe24.com/skin/base_ko_KR/layout/txt_progress.gif" alt="현재 결제가 진행중입니다."/></span>
		                <span><img src="//img.echosting.cafe24.com/skin/base/layout/img_loading.gif" alt=""/></span>
		            </p>
		            <p class="txt">
		                본 결제 창은 결제완료 후 자동으로 닫히며,결제 진행 중에 본 결제 창을 닫으시면<br/>
		                주문이 되지 않으니 결제 완료 될 때 까지 닫지 마시기 바랍니다.
		            </p>
		        </div>
		    </div>
		</div>
		<!-- //결제를 위한 필수 영역 -->
		
		
		
		<!-- <span itemscope="" itemtype="http://schema.org/Organization"> -->
		<link itemprop="url" href="https://ecudemo126609.cafe24.com">
		</span>
		<!-- <script type="text/javascript" src="/ind-script/i18n.php?lang=ko_KR&domain=front&v=2203161305" charset="utf-8"></script> -->
		
		<!-- <script src="/ind-script/optimizer.php?filename=zVjbbts4EH1P9LrfoaZbLPY1cdB20QQxsin6PKJG1kQUh8tLEvXrO5Ldi9vKlqgEWBiQZZrncDRzZoZUXnOL-dlrl1cOWnxk1-QOPUenML_3OZ39bbJ7_0d-aF4kC6rJ7_-L6Lrd15_ZX9mrmUh8CugMaL8byBRzQ7iUJTqd9AgZqqwyyVDDik2lSYUkirPsjXySFpd_A7uf_GYdbwS_F90SAgaSCa3MMiFHdT3cfKJQ332-hABZS2YGj6ZCUHgn98dR3joyoZpAzyr2Zr1l167YBMdaozuOW-voz629cFRuJtgTA-njsyrHg6dOPGtBsDkJbE80GTwpwJgpdm0pFLctm6mzn8BINhqRtnUYpq8y4AK2Vktcfg8Ca_NrLkhjfvsDfmvfAa-M4Fouowz5R7LzFqyiUb1D-3lllLRpR0U8leGAESLV_OM2e36k0PC50wzlLFAbA_Tr3hQe3cNYcEbAlnVXkZ4svRIriDr0LvAtuHDxG9XNL5LFhgbQ_6Nkl1JAjBeP-qVMCJ7MZilLiwHKvhyOqvHfmu1eWN8OwfoADXDe9Nc1PaE-VIsO0KyGXPx4MBVHoLdYoUOjcBVd_92tHan5FngEp-pZwg5QVd2vDeSo962OG5Kq9QCaxOnsvkbh20AmN-AX0_ZhNqX_lV4YrGgPX26FGrXFF3-OGkypZ9eGGQtIrSOJ8YvxS10Mz-YmzQqkYTR8vNJ-t2A0Ty4YXLmndxnNin40DRSVSgNq8n2v7LvhgW4JBjb73fIRC82bWSn9tYbkXqrEqR2vJJPwavfrtJKNHYSlljwXzbR9YB1aLXtSCoR-ltvBd0Ztr8m4FtsCXTL8xpXolAnJBBfgGwzLGezhXjSJY73b66WyrDhKsV_yLNeSebBJf45LtOwpff1P5OurvggsIVAcF7jAocIF8NsBfscB9GqRHYOy0wWFBitaKuor6BbY8M5BmS6l8xhYaiCpgUb2co_pqpZDBq3ZRptO0V1Rg7sEXRbYPapFYr-iB5TjejN29p6qsvfUv2XpnkGvO6Y7KJ6F5x857id6yEKoHWs8nbABOubm0UP0CNgm1PFtHzyVbcyU11SO4_AO5As&type=js&k=2f77be9618db291555c5b2f4aea6e33f2a64af8e&t=1645509281" ></script><script src="/ind-script/optimizer.php?filename=tdDLEcIwDATQApwrdQg4ZIY6qMAfTaJgWU5swaR7DAcaiLntRW92BbMwAnqjBbfSggZkuVzH8XyDrC6SN3PlCCWgCVhoSuBsQYh2F62fTB6WdvnEVE21bljKCXqp33BIbIgXZklHFZag8ddwVfIP8yR8dd27rIrbPrgsWfPAlLrq_I9PeFtxkla6q8oaK5VZ8n2mnClNjX8D&type=js&k=bb0955cd7c693bf2097b22ad9d78f8571b92f770&t=1562306353&user=T" ></script> -->
		<script type="text/javascript">
		CAFE24.MOBILE_WEB = false; var mobileWeb = CAFE24.MOBILE_WEB;
		var bUseElastic = false;
		var sSearchBannerUseFlag = 'F';
		var bIsUseSpread = false;
		var sIsSecret = false;
		var iBoardNo = "6";
		var aLogData = {"log_server1":"eclog2-181.cafe24.com","log_server2":"eclog2-181.cafe24.com","mid":"ecudemo126609","stype":"e","domain":"","shop_no":1,"lang":"ko_KR","ver":2,"hash":"881c347f38a24c6057e78b782f762ed3","ca":"cfa-js.cafe24.com\/cfa.js","etc":""};
		var sMileageName = '적립금';
		var sMileageUnit = '[:PRICE:]원';
		var sDepositName = '예치금';
		var sDepositUnit = '원';
		CAFE24.SHOP_CURRENCY_INFO = {"1":{"aShopCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"aShopSubCurrencyInfo":null,"aBaseCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"fExchangeRate":1,"fExchangeSubRate":null,"aFrontCurrencyFormat":{"head":"","tail":"\uc6d0"},"aFrontSubCurrencyFormat":{"head":"","tail":""}}}; var SHOP_CURRENCY_INFO = CAFE24.SHOP_CURRENCY_INFO;
		var EC_ASYNC_LIVELINKON_ID = '';
		/* 
		if (EC$('[async_section=before]').length > 0) {
		EC$('[async_section=before]').addClass('displaynone');
		}
	 */
		</script>
	</body>
</html>

      