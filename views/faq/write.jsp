<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
	<head>

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



<script>
(function(i, s, o, g, r, a, m) {
    a = s.createElement(o);
    m = s.getElementsByTagName(o)[0];
    a.src = g;
    a.onload = function() {
        i[r].init('https://js-error-tracer-api.cafe24.com', {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJybGdoMjU4Ny5jYWZlMjQuY29tIiwiYXVkIjoianMtZXJyb3ItdHJhY2VyLWFwaS5jYWZlMjQuY29tIiwibWFsbF9pZCI6InJsZ2gyNTg3Iiwic2hvcF9ubyI6MSwicGF0aF9yb2xlIjoiQk9BUkRfUFJPRFVDVF9ERVRBSUwiLCJsYW5ndWFnZV9jb2RlIjoia29fS1IiLCJjb3VudHJ5X2NvZGUiOiJLUiIsIm9yaWdpbiI6Imh0dHA6XC9cL3NraW4tc2tpbjEucmxnaDI1ODcuY2FmZTI0LmNvbSIsImlzX2NvbnRhaW5lciI6ZmFsc2UsImhvc3RuYW1lIjoidWUxMjA0In0.7If8V_isyvg_298aep4GNmLzYMi7lBj_P0mL4_Zfnyg","collectWindowErrors":true,"preventDuplicateReport":true,"storageKeyPrefix":"EC_JET.BOARD_PRODUCT_DETAIL"});
    };
    m.parentNode.insertBefore(a, m);
}(window, document, 'script', '/ind-script/optimizer.php?filename=08_Iz03VNzQq0i8oyk8vSszVLy8v18_MS-EqTi7KLCjRz0oFY57czDyerGIA&type=js&k=f8c449ff82a3977059c3195db755507c2666c339&t=1643021158', 'EC_JET'));
</script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 --><meta http-equiv="Cache-Control" content="no-cache"/><meta http-equiv="Expires" content="0"/><meta http-equiv="Pragma" content="no-cache"/><!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. --><link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://rlgh2587.cafe24.com/article/상품-qa/6/2/" />
<meta property="og:url" content="http://rlgh2587.cafe24.com/article/상품-qa/6/2/" />
<meta property="og:title" content="ascsac 상품 Q&amp;A - 기호제학" />
<meta property="og:description" content="상품 Q&amp;A입니다." />
<meta property="og:site_name" content="기호제학" />
<meta property="og:type" content="article" />
<script type="text/javascript" src="/app/Eclog/js/cid.generate.js?vs=f475bababadb6ba10c84bf80abdec3f7"></script>
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
CAFE24.MOBILE_USE = false;
var EC_MOBILE = CAFE24.MOBILE;
var EC_MOBILE_DEVICE = CAFE24.MOBILE_DEVICE;
var EC_MOBILE_USE = CAFE24.MOBILE_USE;
CAFE24.SKIN_CODE = "skin1";
CAFE24.FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = {"common_member_id_crypt":"81eb24e34a239df4d5ab71d90e8484cc995077126b48ca532d8d75973f4d57dc"};
var EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA = CAFE24.getDeprecatedNamespace('EC_FRONT_EXTERNAL_SCRIPT_VARIABLE_DATA');
CAFE24.SDE_SHOP_NUM = 1;CAFE24.SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },getTimezone: function() { return "Asia/Seoul" },getDateFormat: function() { return "Y-m-d" },isMultiShop : function() { return false; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isPH : function() { return false; },getCountryAndLangMap : function() { return {
"KR": "ko_KR",
"US": "en_US",
"JP": "ja_JP",
"CN": "zh_CN",
"TW": "zh_TW",
"VN": "vi_VN",
"PH": "en_PH"
}},isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return true; },getModeName : function() {return true; },isMobileAdmin : function() {return false; },isExperienceMall : function() { return false; },getAdminID : function() {return 'rlgh2587'},getMallID : function() {return 'rlgh2587'},getCurrencyFormat : function(sPriceTxt, bIsNumberFormat) { 
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
return oBankInfo; }};            var EC_SDE_SHOP_NUM = CAFE24.SDE_SHOP_NUM;
var SHOP = CAFE24.getDeprecatedNamespace('SHOP');
var EC_COMMON_UTIL = CAFE24.getDeprecatedNamespace('EC_COMMON_UTIL');
var EC_SHOP_LIB_INFO = CAFE24.getDeprecatedNamespace('EC_SHOP_LIB_INFO');
var EC_CURRENCY_INFO = CAFE24.getDeprecatedNamespace('EC_CURRENCY_INFO');
CAFE24.ROOT_DOMAIN = "cafe24.com";
CAFE24.API_DOMAIN = "cafe24api.com";
CAFE24.TRANSLATE_LOG_STATUS = "F";
CAFE24.GLOBAL_INFO = (function() {
var oData = {"base_domain":"rlgh2587.cafe24.com","root_domain":"cafe24.com","api_domain":"cafe24api.com","is_global":false,"is_global_standard":false,"country_code":"KR","language_code":"ko_KR","admin_language_code":"ko_KR"};
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
CAFE24.FRONT_JS_CONFIG_MANAGE = {"sSmartBannerScriptUrl":"https:\/\/app4you.cafe24.com\/SmartBanner\/tunnel\/scriptTags?vs=1563164396689206","sMallId":"rlgh2587","sDefaultAppDomain":"https:\/\/app4you.cafe24.com","sWebLogOffFlag":"F","cdnUrl":"http:"};
var EC_FRONT_JS_CONFIG_MANAGE = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MANAGE');
CAFE24.FRONT_JS_CONFIG_MEMBER = {"sAuthUrl":"https:\/\/i-pin.cafe24.com\/certify\/1.0\/?action=auth"};
var EC_FRONT_JS_CONFIG_MEMBER = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_MEMBER');
CAFE24.FRONT_JS_ARTICLES = {"2":{"no":2,"ucc_url":""}};
var EC_FRONT_JS_ARTICLES = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_ARTICLES');
CAFE24.FRONT_JS_CONFIG_BOARD = {"iBoardNo":6,"sCommentWriterType":"N","sCommentUseId":"F"};
var EC_FRONT_JS_CONFIG_BOARD = CAFE24.getDeprecatedNamespace('EC_FRONT_JS_CONFIG_BOARD');
typeof window.CAFE24 === "undefined" && (window.CAFE24 = {});
CAFE24.BOARD = {"app_board_admin":{"accessDenied":"\uc798\ubabb\ub41c \uc811\uadfc\uc785\ub2c8\ub2e4.","statusUnstableTry":"\ub124\ud2b8\uc6cc\ud06c \uc0c1\ud0dc\uac00 \ubd88\uc548\uc815 \ud569\ub2c8\ub2e4. \uc7a0\uc2dc \ud6c4 \ub2e4\uc2dc \uc2dc\ub3c4\ud574\uc8fc\uc138\uc694","statusReleased":"\ucc98\ub9ac\uc911 \uc0c1\ud0dc\uac00 \ud574\uc81c\ub418\uc5c8\uc2b5\ub2c8\ub2e4.","changedToProcessing":"\ucc98\ub9ac\uc911\uc73c\ub85c \ubcc0\uacbd\ub418\uc5c8\uc2b5\ub2c8\ub2e4.","pleaseMarkThePost002":"\uc774\ub3d9\ud560 \uae00\uc744 \uc120\ud0dd\ud558\uc5ec \uc8fc\uc138\uc694.","cannotMovedSameBoard":"\ub3d9\uc77c\ud55c \uac8c\uc2dc\ud310\uc73c\ub85c \uac8c\uc2dc\ubb3c\uc744 \uc774\ub3d9 \ud560 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4.","pleaseMarkThePost":"\ubcf5\uc0ac\ud560 \uae00\uc744 \uc120\ud0dd\ud558\uc5ec \uc8fc\uc138\uc694.","areSure":"\ubcf5\uc0ac\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?","areSureWon":"%s\uc744 \uc9c0\uae09\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?","processingPleaseWait":"\ucc98\ub9ac\uc911\uc785\ub2c8\ub2e4. \uc7a0\uc2dc\ub9cc \uae30\ub2e4\ub824\uc8fc\uc138\uc694.","creditTransferMembers":"\uc801\ub9bd\uae08\ubc14\ub85c\uc8fc\uae30\ub294 \ud68c\uc6d0\uc5d0\uac8c\ub9cc \uac00\ub2a5\ud569\ub2c8\ub2e4.","pointsAddedSameProduct":"\uc774\ubbf8 \ub3d9\uc77c \uc0c1\ud488\uba85\uc73c\ub85c \uc9c0\uae09\ub41c \uc801\ub9bd\uae08\uc774 \uc788\uc2b5\ub2c8\ub2e4.\n\uadf8\ub798\ub3c4 \uc9c0\uae09\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?","pleaseSelectReply":"\ub313\uae00\uc744 \uc120\ud0dd\ud558\uc5ec \uc8fc\uc138\uc694."}};
CAFE24.CONFIG = {"is_use_admin_manage":"T"};
CAFE24.EDITOR = {"atl":{"used":"\uc0ac\uc6a9\ud568","adminPageLinkedParts":"\uc0ac\uc6a9\ud568\uc73c\ub85c \uc124\uc815\ud558\uba74, \uc6d0\ud558\ub294 \ubd80\ubd84\uc744 \ubc14\ub85c \uc218\uc815\ud560 \uc218 \uc788\ub3c4\ub85d \uad00\ub9ac\uc790 \ud398\uc774\uc9c0\ub97c \ub9c1\ud06c\ud558\uc5ec \uc90d\ub2c8\ub2e4. \uc6d0\ud558\ub294 \ubd80\ubd84\uc758 \uad00\ub9ac\uc790 \uc124\uc815\uacfc \ub514\uc790\uc778 \ud3b8\uc9d1\uc744 \ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4.","notUsed":"\uc0ac\uc6a9\uc548\ud568","youCanMoveEachPage":"\uc0ac\uc6a9\uc548\ud568\uc73c\ub85c \uc124\uc815\ud558\uba74, \uae30\uc874 \uc1fc\ud551\ubab0 \ud654\uba74\uc758 \uac01 \ud398\uc774\uc9c0\ub85c \uc774\ub3d9 \ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4.","goShoppingMallManager":"\uc1fc\ud551\ubab0 \uad00\ub9ac\uc790 \ubc14\ub85c\uac00\uae30","mallManagerFunction":"\uc1fc\ud551\ubab0 \uad00\ub9ac\uc790 \uae30\ub2a5\uc744 \uc0ac\uc6a9\ud558\uc2dc\uaca0\uc2b5\ub2c8\uae4c?","mallManagerManual":"\uc1fc\ud551\ubab0 \uad00\ub9ac\uc790 \ub9e4\ub274\uc5bc","storeManagerFunction":"\uc1fc\ud551\ubab0 \uad00\ub9ac\uc790 \uae30\ub2a5","accessingAdminPage":"\uc1fc\ud551\ubab0 \uad00\ub9ac\uc790 \uae30\ub2a5\uc774\ub780? \uad00\ub9ac\uc790 \ud398\uc774\uc9c0\uc5d0 \uc811\uc18d\ud558\uc9c0 \uc54a\uace0\ub3c4 \uc1fc\ud551\ubab0 \ud654\uba74\uc5d0<br><strong>\ub300\ud45c\uc6b4\uc601\uc790\ub85c \ub85c\uadf8\uc778 \uc2dc, \uc6d0\ud558\ub294 \ubd80\ubd84\uc744 \ubc14\ub85c \uc218\uc815\ud560 \uc218 \uc788\ub3c4\ub85d \uad00\ub9ac\uc790 \uc124\uc815 \ud398\uc774\uc9c0\ub97c<br>\ub9c1\ud06c \ub610\ub294 \ub514\uc790\uc778 \ud3b8\uc9d1\ucc3d\uc744 \ub9c1\ud06c \ud574\uc8fc\ub294 \uae30\ub2a5<\/strong>\uc744 \ub9d0\ud569\ub2c8\ub2e4.","youCanModifyManager":"\uad00\ub9ac\uc790 \uc124\uc815 \ud398\uc774\uc9c0 \ubc0f \ub514\uc790\uc778 \ud3b8\uc9d1\ucc3d \ub9c1\ud06c\ud558\uc5ec \ubc14\ub85c \uc218\uc815\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4.","youCanMovePages":"\uae30\uc874 \uc1fc\ud551\ubab0 \ud654\uba74\uc758 \ud398\uc774\uc9c0\ub97c \uc774\ub3d9\ud560 \uc218 \uc788\uc2b5\ub2c8\ub2e4.","closeTheLayer":"\ub808\uc774\uc5b4 \ub2eb\uae30","storeManagerFeatures":"\uc1fc\ud551\ubab0 \uad00\ub9ac\uc790 \uae30\ub2a5 \uc811\uae30","heat":"\uc5f4\uae30","bringEditDesign":"\uafb8\ubbf8\uae30 \ucc3d\uc744 \ub744\uc6cc\uc11c \ub514\uc790\uc778\uc744 \uc0c1\uc138 \ud3b8\uc9d1\ud569\ub2c8\ub2e4.","editDesign":"\ub514\uc790\uc778 \ud3b8\uc9d1","addDesign":"\ub514\uc790\uc778 \ucd94\uac00","close":"\ub2eb\uae30"},"atl_model":{"logo":"\ub85c\uace0","footerLogo":"\ud478\ud130\ub85c\uace0","favorites":"\uc990\uaca8\ucc3e\uae30","shortcuts":"\ubc14\ub85c\uac00\uae30","searchKeyword":"\uac80\uc0c9 \ud0a4\uc6cc\ub4dc","productSeenToday":"\uc624\ub298 \ubcf8 \uc0c1\ud488","classificationSetting":"\ubd84\ub958 \uc124\uc815","myShopping":"\ub9c8\uc774\uc1fc\ud551","plannedExhibition":"\uae30\ud68d\uc804","customerConsultation":"\uace0\uac1d\uc0c1\ub2f4 \uc548\ub0b4","fullBoard":"\uc804\uccb4\uac8c\uc2dc\ud310","groupBuying":"\uacf5\ub3d9\uad6c\ub9e4","bulletinBoardList":"\uac8c\uc2dc\ud310 \ubaa9\ub85d","bulletinPaging":"\uac8c\uc2dc\ud310 \ud398\uc774\uc9d5 \ucc98\ub9ac","bulletinBoardSearch":"\uac8c\uc2dc\ud310 \uac80\uc0c9","mainPageProductList":"\uba54\uc778\ud398\uc774\uc9c0 \uc0c1\ud488\ub9ac\uc2a4\ud2b8","productCategoryHeader":"\uc0c1\ud488 \uce74\ud14c\uace0\ub9ac \ud5e4\ub354","categoryProductDisplay":"\uce74\ud14c\uace0\ub9ac \uc0c1\ud488\uc9c4\uc5f4","productDetails001":"\uc0c1\ud488\uc0c1\uc138 \uc815\ubcf4","generalProductPaging":"\uc77c\ubc18\uc0c1\ud488 \ud398\uc774\uc9d5","searchProduct":"\uc0c1\ud488\uac80\uc0c9","exhibitionList":"\uae30\ud68d\uc804 \ub9ac\uc2a4\ud2b8","informationUse":"\uc774\uc6a9\uc548\ub0b4","aboutUs":"\ud68c\uc0ac\uc18c\uac1c","conditionsRegistration":"\uc774\uc6a9\uc57d\uad00 \ub4f1\ub85d","shoppingBasket":"\uc7a5\ubc14\uad6c\ub2c8","shoppingCartGuide":"\uc7a5\ubc14\uad6c\ub2c8 \uc774\uc6a9\uc548\ub0b4","createOrderForm":"\uc8fc\ubb38\uc11c \uc791\uc131","orderCompleted":"\uc8fc\ubb38 \uc644\ub8cc","viewOrderHistory":"\uc8fc\ubb38 \ub0b4\uc5ed \uc870\ud68c","myShopping001":"\ub9c8\uc774 \uc1fc\ud551","itemsOfInterest":"\uad00\uc2ec\uc0c1\ud488","reserves":"\uc801\ub9bd\uae08","coupon":"\ucfe0\ud3f0","couponList":"\ucfe0\ud3f0\ub9ac\uc2a4\ud2b8","boardSearch":"1:1\uac8c\uc2dc\ud310 \uac80\uc0c9","orderDetails":"\uc8fc\ubb38\uc0c1\uc138\ub0b4\uc5ed","addressManagement":"\ubc30\uc1a1\uc8fc\uc18c\ub85d \uad00\ub9ac","unearnedEarningHistory":"\ubbf8\uac00\uc6a9 \uc801\ub9bd\ub0b4\uc5ed\ubcf4\uae30","modulePaging":"\ubaa8\ub4c8 \ud398\uc774\uc9d5","smartBanner":"\uc2a4\ub9c8\ud2b8\ubc30\ub108","customModuleEdit":"\ucee4\uc2a4\ud140 \ubaa8\ub4c8 \ud3b8\uc9d1"},"module_layer":{"yourFavoriteInformation":"\uc990\uaca8\ucc3e\uae30 \uc815\ubcf4\ub97c \uc785\ub825\ud569\ub2c8\ub2e4.","favoritesSettings":"\uc990\uaca8\ucc3e\uae30 \uc124\uc815","shortcutInformation":"\ubc14\ub85c\uac00\uae30 \uc815\ubcf4\ub97c \uc785\ub825\ud569\ub2c8\ub2e4.","shortcutSettings":"\ubc14\ub85c\uac00\uae30 \uc124\uc815","classification":"\uae30\ud68d\uc804 \ubd84\ub958\ub97c \uad00\ub9ac\ud569\ub2c8\ub2e4.","classificationManagement":"\uae30\ud68d\uc804 \ubd84\ub958 \uad00\ub9ac","displayBeforePlanning":"\uae30\ud68d\uc804 \uc0c1\ud488 \uc9c4\uc5f4\uc744 \uad00\ub9ac\ud569\ub2c8\ub2e4.","exhibitionDisplay":"\uae30\ud68d\uc804 \uc0c1\ud488 \uc9c4\uc5f4\uad00\ub9ac","centerInformationGuide":"\uace0\uac1d\uc13c\ud130\uc815\ubcf4\uc548\ub0b4\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","informationSettings":"\uace0\uac1d\uc13c\ud130\uc815\ubcf4\uc548\ub0b4 \uc124\uc815","productSearchCriteria":"\uc0c1\ud488\uac80\uc0c9\uc870\uac74\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","productSearchSettings":"\uc0c1\ud488\uac80\uc0c9 \uc124\uc815","confirm":"\ud655\uc778","setRecentlyViewedItems":"\ucd5c\uadfc\ubcf8 \uc0c1\ud488\uc758 \uac1c\uc218\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","recentlyViewedItems":"\ucd5c\uadfc\ubcf8\uc0c1\ud488 \uac1c\uc218 \uc124\uc815","categorySettings":"\uce74\ud14c\uace0\ub9ac \uc124\uc815","registerNewCategory":"\uc0c1\ud488 \ubaa9\ub85d\uc5d0 \uc0c8\ub85c\uc6b4 \ubd84\ub958\ub97c \ub4f1\ub85d\ud569\ub2c8\ub2e4.","majorClassification":"\ub300\ubd84\ub958 \ub4f1\ub85d","setDisplayedMainMenu":"\uba54\uc778\uba54\ub274\uc5d0 \ub178\ucd9c\ub420 \ubd84\ub958\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","mainMenuSettings":"\uba54\uc778\uba54\ub274 \uc124\uc815","displayStatus":"\uba54\uc778\ubd84\ub958 \ud45c\uc2dc\uc0c1\ud0dc\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","displayStatus001":"\uba54\uc778\ubd84\ub958 \ud45c\uc2dc\uc0c1\ud0dc","changeMenuViewSettings":"\uba54\ub274\ubcf4\uae30 \uc124\uc815\uc744 \ubcc0\uacbd\ud569\ub2c8\ub2e4.","menuViewPopup":"\uba54\ub274\ubcf4\uae30 \uc124\uc815(\ud31d\uc5c5\uba54\ub274)","orderBulletinBoards":"\uac8c\uc2dc\ud310 \ud45c\uc2dc\uc21c\uc11c \ubcc0\uacbd","setDisplayMainMenu":"\uba54\uc778\uba54\ub274\uc5d0 \ub178\ucd9c\ub420 \ubd84\ub958\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","theOrderOfBoards":"\uac8c\uc2dc\ud310 \uc21c\uc11c\ubcc0\uacbd","moveSmartBanner":"\uc2a4\ub9c8\ud2b8\ubc30\ub108 \uc124\uc815\ud654\uba74\uc73c\ub85c \uc774\ub3d9\ud569\ub2c8\ub2e4.","smartBannerSetting":"\uc2a4\ub9c8\ud2b8\ubc30\ub108 \uc124\uc815"},"module_product":{"editItems":"\uc0c1\ud488 \uc218\uc815","youCanDisplayTheGoods":"\uc0c1\ud488\uc744 \uc9c4\uc5f4\ud558\uc2e4 \uc218 \uc788\uc2b5\ub2c8\ub2e4.","displayManagement":"\uba54\uc778\uc0c1\ud488 \uc9c4\uc5f4\uad00\ub9ac","displayProductList":"\uc0c1\ud488 \ubaa9\ub85d\uc5d0 \ud45c\uc2dc\ub418\ub294 \ud56d\ubaa9\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","displayItemManagement":"\ud45c\uc2dc\ud56d\ubaa9 \uad00\ub9ac","setAppearsProductList":"\uc0c1\ud488\ubaa9\ub85d\uc5d0 \ub098\uc624\ub294 \uc544\uc774\ucf58\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","itemIconSet":"\uc0c1\ud488 \uc544\uc774\ucf58 \uc124\uc815","registerYourProduct":"\uc0c1\ud488\uc744 \ub4f1\ub85d\ud569\ub2c8\ub2e4.","productRegistration":"\uc0c1\ud488 \ub4f1\ub85d","displayManagement001":"\uc0c1\ud488\uc9c4\uc5f4 \uad00\ub9ac","informationDisplay":"\uc0c1\ud488\uc815\ubcf4 \ud45c\uc2dc\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","displaySetting":"\uc0c1\ud488\uc815\ubcf4\ud45c\uc2dc \uc124\uc815","optionReviewFeature":"\uc635\uc158 \ubbf8\ub9ac\ubcf4\uae30 \uae30\ub2a5\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","optionReviewFunction":"\uc635\uc158 \ubbf8\ub9ac\ubcf4\uae30 \uae30\ub2a5","categoryPreferences001":"\uc0c1\ud488 \uce74\ud14c\uace0\ub9ac \uae30\ubcf8\uc124\uc815\uc744 \uc218\uc815\ud569\ub2c8\ub2e4.","categoryPreferences":"\uce74\ud14c\uace0\ub9ac \uae30\ubcf8\uc124\uc815","classificationDecorating":"\ubd84\ub958 \uafb8\ubbf8\uae30\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","categoryDecorating":"\ubd84\ub958 \uafb8\ubbf8\uae30","setTheClassification":"\ubd84\ub958\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","classificationSetting":"\ubd84\ub958 \uc124\uc815","registerTheProduct":"\uc77c\ubc18\uc0c1\ud488\uc5d0 \uc0c1\ud488\uc744 \ub4f1\ub85d\ud569\ub2c8\ub2e4.","generalGoodsManagement":"\uc77c\ubc18 \uc0c1\ud488\uc744 \uc9c4\uc5f4\uad00\ub9ac\ud569\ub2c8\ub2e4.","displayManagement002":"\uc9c4\uc5f4\uad00\ub9ac","changeTheDisplayOrder":"\uc9c4\uc5f4\uc21c\uc11c\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeDisplayOrder":"\uc9c4\uc5f4\uc21c\uc11c \ubcc0\uacbd","andManageNewProducts":"\uc2e0\uc0c1\ud488\uc744 \uc9c4\uc5f4\uad00\ub9ac\ud569\ub2c8\ub2e4.","displayManagement003":"\uc2e0\uc0c1\ud488 \uc9c4\uc5f4\uad00\ub9ac","recommendedProducts":"\ucd94\ucc9c\uc0c1\ud488\uc744 \uc9c4\uc5f4\uad00\ub9ac\ud569\ub2c8\ub2e4.","howYoursStoreOperates":"\uc0c1\uc810\uc6b4\uc601 \ubc29\uc2dd\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","convenienceFunctions":"\uae30\ud0c0 \ud3b8\uc758\uae30\ub2a5\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","convenienceFeatures":"\uae30\ud0c0 \ud3b8\uc758\uae30\ub2a5 \uc124\uc815","goodsIconsSet":"\uc0c1\ud488 \uc544\uc774\ucf58\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","editProductInformation001":"\ud574\ub2f9\uc0c1\ud488\uc758 \uc815\ubcf4\ub97c \uc218\uc815\ud569\ub2c8\ub2e4.","defineReserveSettings":"\uc801\ub9bd\uae08 \uc124\uc815\uc744 \uc815\uc758\ud569\ub2c8\ub2e4.","setUpReserve":"\uc801\ub9bd\uae08 \uc124\uc815","promotionThroughSns":"SNS\ub97c \ud1b5\ud55c \uc0c1\ud488\ud64d\ubcf4\ub97c \uc704\ud55c \uc124\uc815 \ud398\uc774\uc9c0\uc785\ub2c8\ub2e4.","promotionManagement":"SNS \uc0c1\ud488\ud64d\ubcf4 \uad00\ub9ac","createQrCodeProduct":"\uc0c1\ud488\uc758 QR\ucf54\ub4dc\ub97c \ub9cc\ub4ed\ub2c8\ub2e4.","createProductQrCode":"\uc0c1\ud488 QR\ucf54\ub4dc \ub9cc\ub4e4\uae30","managementSettings":"\uc0c1\ud488\uc6b4\uc601 \uad00\ub9ac \uc124\uc815","commonEventManagement001":"\uacf5\ud1b5\uc774\ubca4\ud2b8 \uad00\ub9ac\ub97c \ud569\ub2c8\ub2e4.","commonEventManagement":"\uacf5\ud1b5\uc774\ubca4\ud2b8 \uad00\ub9ac","setYourCouponDefaults":"\ucfe0\ud3f0\uc758 \uae30\ubcf8\uc124\uc815\uc744 \ud569\ub2c8\ub2e4.","offerPreference":"\ucfe0\ud3f0 \uae30\ubcf8\uc124\uc815","cartConfirmationWindow001":"\uc7a5\ubc14\uad6c\ub2c8 \ub2f4\uae30 \ud655\uc778\ucc3d\uc744 \uc124\uc815","cartConfirmationWindow":"\uc7a5\ubc14\uad6c\ub2c8 \ub2f4\uae30 \ud655\uc778\ucc3d \uc124\uc815","yourPaymentInstructions":"\uacb0\uc81c \uc548\ub0b4\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","paymentInstructions":"\uacb0\uc81c\uc548\ub0b4 \ubcc0\uacbd","shippingInstructions":"\ubc30\uc1a1\uc548\ub0b4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeShippingGuide":"\ubc30\uc1a1\uc548\ub0b4 \ubcc0\uacbd","changeTheExchangeGuide":"\uad50\ud658\uc548\ub0b4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeOfExchangeGuide":"\uad50\ud658\uc548\ub0b4 \ubcc0\uacbd","shippingReturnSettings":"\ubc30\uc1a1\/\ubc18\uc1a1 \uc124\uc815","changeProductDetails":"\uc0c1\ud488 \uc0c1\uc138\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","modifyProductDetails":"\uc0c1\ud488\uc0c1\uc138\uc815\ubcf4 \uc218\uc815","billingInformation":"\uc0c1\ud488 \uacb0\uc81c\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","paymentInformation":"\uc0c1\ud488\uacb0\uc81c\uc815\ubcf4 \uc218\uc815","yourShippingInformation":"\ubc30\uc1a1\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","editShippingInformation":"\ubc30\uc1a1\uc815\ubcf4 \uc218\uc815","changeTheExchange":"\uad50\ud658 \ubc0f \ubc18\ud488\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","andReturnInformation":"\uad50\ud658 \ubc0f \ubc18\ud488\uc815\ubcf4 \uc218\uc815","makeChangesServiceCall":"\uc11c\ube44\uc2a4 \ubb38\uc758 \ub0b4\uc6a9\uc744 \ubcc0\uacbd\ud569\ub2c8\ub2e4.","editServiceInquiry":"\uc11c\ube44\uc2a4 \ubb38\uc758 \uc218\uc815","testimonial":"\uc0c1\ud488 \uc0ac\uc6a9 \ud6c4\uae30 \uc124\uc815\uc744 \ubcc0\uacbd\ud569\ub2c8\ub2e4.","productReviewSettings":"\uc0c1\ud488 \uc0ac\uc6a9 \ud6c4\uae30 \uc124\uc815","productAmpSettings001":"\uc0c1\ud488 Q&A \uc124\uc815\uc744 \ubcc0\uacbd\ud569\ub2c8\ub2e4.","productAmpSettings":"\uc0c1\ud488 Q&A \uc124\uc815","changeRelatedProducts":"\uad00\ub828\uc0c1\ud488\uc744 \ubcc0\uacbd\ud569\ub2c8\ub2e4.","editRelatedProduct":"\uad00\ub828\uc0c1\ud488 \uc218\uc815","productSearchCriteria":"\uc0c1\ud488\uac80\uc0c9\uc870\uac74\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","productSearchSettings":"\uc0c1\ud488\uac80\uc0c9 \uc124\uc815"},"module_board":{"boardInformation":"\uac8c\uc2dc\ud310 \uc815\ubcf4\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","boardInformation001":"\uac8c\uc2dc\ud310 \uc815\ubcf4","bulletinBoardIconsSet":"\uac8c\uc2dc\ud310 \uc544\uc774\ucf58\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","bulletinBoardIconSet":"\uac8c\uc2dc\ud310 \uc544\uc774\ucf58 \uc124\uc815","upDesignConfiguration":"\ub514\uc790\uc778 \uad6c\uc131\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","designConfiguration":"\ub514\uc790\uc778 \uad6c\uc131"},"module_mall":{"membershipInformation":"\ud68c\uc6d0\uac00\uc785 \uc548\ub0b4\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeMembershipGuide":"\ud68c\uc6d0\uac00\uc785\uc548\ub0b4 \ubcc0\uacbd","yourOrderInstructions":"\uc8fc\ubb38 \uc548\ub0b4\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeOrderGuide":"\uc8fc\ubb38\uc548\ub0b4 \ubcc0\uacbd","yourPaymentInstructions":"\uacb0\uc81c \uc548\ub0b4\uc815\ubcf4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","paymentInstructions":"\uacb0\uc81c\uc548\ub0b4 \ubcc0\uacbd","shippingInstructions":"\ubc30\uc1a1\uc548\ub0b4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeShippingGuide":"\ubc30\uc1a1\uc548\ub0b4 \ubcc0\uacbd","changeTheExchangeGuide":"\uad50\ud658\uc548\ub0b4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeOfExchangeGuide":"\uad50\ud658\uc548\ub0b4 \ubcc0\uacbd","shippingReturnSettings":"\ubc30\uc1a1\/\ubc18\uc1a1 \uc124\uc815","refundInstructions":"\ud658\ubd88\uc548\ub0b4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeRefundGuide":"\ud658\ubd88\uc548\ub0b4 \ubcc0\uacbd","changeOtherGuides":"\uae30\ud0c0\uc548\ub0b4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","changeOtherGuide":"\uae30\ud0c0\uc548\ub0b4 \ubcc0\uacbd","shoppingMallUsageGuide":"\uc1fc\ud551\ubab0\uc774\uc6a9\uc548\ub0b4\ub97c \ubcc0\uacbd\ud569\ub2c8\ub2e4.","useShoppingMall":"\uc1fc\ud551\ubab0\uc774\uc6a9\uc548\ub0b4 \ub4f1\ub85d","yourShippingSettings":"\ubc30\uc1a1\uc124\uc815\uc744 \ubcc0\uacbd\ud569\ub2c8\ub2e4.","shippingSetting":"\ubc30\uc1a1\uc124\uc815","changeCompanyProfile":"\ud68c\uc0ac\uc18c\uac1c\ub97c \ub4f1\ub85d\/\ubcc0\uacbd\ud569\ub2c8\ub2e4.","companyRegistration":"\ud68c\uc0ac\uc18c\uac1c \ub4f1\ub85d","changeCompanyMap":"\ud68c\uc0ac\uc57d\ub3c4\ub97c \ub4f1\ub85d\/\ubcc0\uacbd\ud569\ub2c8\ub2e4.","profileRegistration":"\ud68c\uc0ac\uc57d\ub3c4 \ub4f1\ub85d","termsAndConditions":"\uc774\uc6a9\uc57d\uad00\uc744 \ub4f1\ub85d\ud569\ub2c8\ub2e4.","conditionsRegistration":"\uc774\uc6a9\uc57d\uad00 \ub4f1\ub85d","policyRegistration":"\uac1c\uc778\uc815\ubcf4\ucc98\ub9ac\ubc29\uce68 \ub4f1\ub85d"},"module_order":{"youCanSetTheShopping":"\uc7a5\ubc14\uad6c\ub2c8 \uc800\uc7a5 \uae30\uac04\uc124\uc815\uc744 \ud558\uc2e4 \uc218 \uc788\uc2b5\ub2c8\ub2e4.","cartStoragePeriod":"\uc7a5\ubc14\uad6c\ub2c8 \uc800\uc7a5 \uae30\uac04\uc124\uc815","setYourFormOfPayment":"\uacb0\uc81c\ubc29\uc2dd\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","setFormOfPayment":"\uacb0\uc81c\ubc29\uc2dd \uc124\uc815","setUpDepositAccount":"\ubb34\ud1b5\uc7a5\uc785\uae08 \uacc4\uc88c\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","depositAccount":"\ubb34\ud1b5\uc7a5\uc785\uae08 \uacc4\uc88c\uc124\uc815","additionalItemSetting":"\uc8fc\ubb38\ucd94\uac00\ud56d\ubaa9 \uc124\uc815","setTheDeliveryPeriod":"\ubc30\uc1a1\uae30\uac04\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","setDeliveryDate":"\ubc30\uc1a1\uae30\uac04 \uc124\uc815"},"module_myshop":{"upReserveInformation":"\uc801\ub9bd\uae08 \uc815\ubcf4\ub97c \uc124\uc815\ud569\ub2c8\ub2e4.","setUpReserve":"\uc801\ub9bd\uae08 \uc124\uc815","setMembershipLevel":"\ud68c\uc6d0\ub4f1\uae09\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","setMembershipLevel001":"\ud68c\uc6d0\ub4f1\uae09 \uc124\uc815","setYourCouponDefaults":"\ucfe0\ud3f0\uc758 \uae30\ubcf8\uc124\uc815\uc744 \ud569\ub2c8\ub2e4.","offerPreference":"\ucfe0\ud3f0 \uae30\ubcf8\uc124\uc815","createSerialCoupon001":"\uc2dc\ub9ac\uc5bc\ucfe0\ud3f0\uc744 \uc0dd\uc131\ud569\ub2c8\ub2e4.","createSerialCoupon":"\uc2dc\ub9ac\uc5bc\ucfe0\ud3f0 \ub9cc\ub4e4\uae30","andSearchSerialCoupons":"\uc2dc\ub9ac\uc5bc\ucfe0\ud3f0\uc744 \ubc1c\uae09 \ubc0f \uc870\ud68c\ud569\ub2c8\ub2e4.","couponIssueInquiry":"\uc2dc\ub9ac\uc5bc\ucfe0\ud3f0 \ubc1c\uae09\/\uc870\ud68c","setTheBulletinBoard":"\uac8c\uc2dc\ud310\uc744 \uc124\uc815\ud569\ub2c8\ub2e4.","bulletinBoardSettings":"\uac8c\uc2dc\ud310 \uc124\uc815","bulletinBoardDesign":"\uac8c\uc2dc\ud310 \ub514\uc790\uc778\uc744 \uad6c\uc131\ud569\ub2c8\ub2e4.","designConfiguration":"\ub514\uc790\uc778 \uad6c\uc131"}};
CAFE24.ROUTE = {"is_mobile":false,"is_need_route":false,"language_code":"ko_KR","path":{"origin":"\/article\/\uc0c1\ud488-qa\/6\/2\/","result":"\/article\/\uc0c1\ud488-qa\/6\/2\/","prefix":""},"shop_no":0,"skin_code":"default"};
</script>

<link rel="stylesheet" type="text/css" href="/css/public1.css"/>

<link rel="stylesheet" type="text/css" href="/css/public2.css"/>

<link rel="stylesheet" type="text/css" href="/css/qnacontents.css"/>

<style type="text/css">
#front-linker {z-index: 9999;position: fixed;left: 0;top: 0;right: 0;min-width: 1280px;height: 61px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 0;}#front-linker .show-ctrl h2 { width:210px; z-index: 260;margin: 0;position: absolute;left: 0;top: 0;overflow: hidden;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -71px;}#front-linker .show-ctrl .close {border: 0;position: absolute;right: 0;top: 0;overflow: hidden;width: 58px;height: 50px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -191px;}#front-linker .show-ctrl .admin {margin: 0;position: absolute;right: 58px;top: 0;width: 164px;height: 50px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -131px;}#front-linker .show-ctrl .use { width:242px; position: absolute;left: 50%;top: 18px;overflow: hidden;height: 15px;margin-left: -216px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -413px;}#front-linker .show-ctrl .manual { width:78px;right:222px; position: absolute; top: 0; overflow: hidden; height: 50px; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -174px -131px;}#front-linker .show-ctrl .choice { width:240px;right:300px;margin-left:30px; position: absolute;top: 13px;}#front-linker .show-ctrl .choice li { margin:0 0 0 32px; position: relative; float: left; background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -309px;}#introduce .hide {position: absolute;right: 13px;top: 8px;overflow: hidden;width: 7px;height: 7px;text-indent: -9999px;border: 0;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -22px -361px;}#front-linker .hide-ctrl .open {overflow: hidden;float: right;width: 104px;height: 30px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat -68px -191px;}#atl-menu a .bullet {position: absolute;right: 0;top: 3px;width: 4px;height: 7px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) repeat 0 -344px;}#atl-admin button.close {position: absolute;right: 15px;top: 8px;overflow: hidden;width: 12px;height: 11px;text-indent: -9999px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat 0 -361px;}#atl-admin .btn a {display: inline-block;overflow: hidden;width: 42px;height: 22px;background: url(//img.echosting.cafe24.com/smartAdmin/img/design/ko_KR/sfix_linker.png) no-repeat;}
</style>
<title> FAQ </title>
<meta name="path_role" content="BOARD_PRODUCT_LIST" />
<meta name="description" content="상품 Q&amp;A입니다." />
<meta name="keywords" content="상품 Q&amp;A" />
<meta name="design_html_path" content="/board/product/list.html" /></head><body>

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
	            <h1 style="text-align:center;"><font color="333333">FAQ</font></h1>
	            <p>FAQ입니다.</p>
	        </div>
	<div class="xans-element- xans-layout xans-layout-boardinfo cboth event_tab"><ul>
	<li rel="Q&A" class="xans-record-"><a href="/jejufriends/qna/list.do" class="move">Q&A</a></li>
	<li rel="FAQ" class="xans-record-"><a href="/jejufriends/faq/list.do" class="move">FAQ </a></li>

		</ul>
</div>
<form id="writeForm" name="writeForm" action="write.do" method="post"  >
<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
<div class="ec-base-table typeWrite" align="center">
<table border="1" summary="" style="width:1030px" align="center">

<%-- <caption>글쓰기</caption>
<colgroup>
<col style="width:130px;"/>
<col style="width:auto;"/>
</colgroup> --%>

<tbody>
	<tr>
		<td class="board_subject"  colspan="2" align="center"><span style="padding-right: 10px;">제목</span><input type="text" style="display: inline; width:994px; height=100px" name="subject" size="72"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
	    	<div class="detail"><div class="fr-view fr-view-article"><p><textarea type="text" name="content" rows="15" cols="70" style="display: inline;  width:1030px"></textarea></p></div></div>
	    </td>
    </tr>
</tbody>
</table>
</div>
<div class="ec-base-button ">
    <span class="gLeft">
        <a href="list.do" class="btnNormalFix sizeS">목록</a>
    </span>
    <span class="gRight">
        <input type="button" class="btnEmFix sizeS " value="저장" onclick="check()"/>
    </span>
</div>
</form>
<script type="text/javascript">
function check()
	   {
	       for(var i=0; i<document.writeForm.elements.length; i++)
		   {
		      if(document.writeForm.elements[i].value == "")
			  {
			     alert("모든 값을 입력 하셔야 합니다. ");
				 return false;
			  }
		   }
		   document.writeForm.submit();
       }
</script>
</div>
</div>
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

