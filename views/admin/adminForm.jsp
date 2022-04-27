<%@ page language="java"  contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>JEJU FRIENDS</title>
<meta charset="utf-8"/>
<meta http-equiv="Content-Language" content="ko"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<!-- Favicon icon -->
<link rel="icon" type="/image/png" sizes="16x16" href="images/favicon.png"/>
<!-- Custom Stylesheet -->
<link href="/admin/css/style.css" rel="stylesheet"/>
<!-- // PG크로스브라우징필수내용 --><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&amp;display=swap&amp;subset=korean" rel="stylesheet"/><!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. --><link rel="canonical" href="http://rlgh2587.cafe24.com/myshop/index.html" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="icon" type="image/png" href="/images/icons/favicon.png"/>
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
<script src="/js/mypagememberinfo.js"></script>
<script src="/js/adminForm.js"></script>
</head>
<body>
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
                        <a href="/jejufriends" style="font-size: 18px;">Home</a>
                     </li>

                   <li class="label1" data-label1="hot">
                      <a  style="font-size: 18px;">Course</a>
                      <ul class="sub-menu">
                         <li><a href="/jejufriends/select_course/select.do">코스추천</a></li>
                         <li><a href="/jejufriends/make_course/make.do">나만의코스</a></li>
                      </ul>
                   </li>

                   <li >
                      <a  style="font-size: 18px;">Contents</a>
                      <ul class="sub-menu">
                         <li><a href="/jejufriends/food/list.do">소문난맛집</a></li>
                         <li><a href="/jejufriends/landmark/list.do">관광지</a></li>
                         <li><a href="/jejufriends/activity/list.do">로컬체험</a></li>
                         <li><a href="/jejufriends/hotel/list.do">숙소</a></li>
                      </ul>
                   </li>

                     <li>
                        <a style="font-size: 18px;">Community</a>
                     </li>


                     <li>
                        <a  style="font-size: 18px;">CS</a>
                        <ul class="sub-menu">
                           <li><a href="/jejufriends/qna/list.do">Q&A</a></li>
                           <li><a href="/jejufriends/faq/list.do">FAQ</a></li>
                        </ul>
                     </li>
		             <li>
                        <a style="font-size: 18px;">About</a>
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
<div style="margin-top: 150px;">
	  <div class="col-lg">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title" style="font-family: 'Nanum Gothic', sans-serif;">
                                    <h4>회원 목록</h4>
                                </div>
					                <div class="row">
					                   <div class="col-lg-4">
					                        <div class="card"> 
			                                   <div class="card-body">
											      <div class="basic-form">   
											     	  <h4>회원 검색</h4>                           
					                                   <form>
					                               	   <input type="hidden" name="cntPerPage" value="${paging.cntPerPage}"/>
					                                   <div class="form-group">
														 <select name="catgo">
														    <option value="e.idNumber"
													        <c:if test="${paging.catgo == idNumber}">selected</c:if>
													        >회원 번호</option>
													        <option value="e.email"
													        <c:if test="${paging.catgo == email}">selected</c:if>>
													        	아이디</option>
													        <option value="e.nickName"
													        <c:if test="${paging.catgo == nickname}">selected</c:if>
													        >닉네임</option>
													        <option value="e.name"
													        <c:if test="${paging.catgo == name}">selected</c:if>
													        >이름</option>
													        <option value="e.phoneNumber"
													        <c:if test="${paging.catgo == phoneNumber}">selected</c:if>
													        >전화번호</option>
													        <option value="e.checkSnsId"
													        <c:if test="${paging.catgo == checkSnsId}">selected</c:if>
													        >SNS회원</option>
													        <option value="e.enabled"
													        <c:if test="${paging.catgo == enabled}">selected</c:if>
													        >활성화</option>
													      </select>   
													      </div>
													    <div class="form-group">  
					                                     <input class="form-control input-rounded"  type="text" name="keyword" size="40" />
					                                    </div>
					                                      <button style="float: right;" type="submit" class="btn btn-dark mb-2">검색</button> 
					                                    </form>
					                                    </div>
					                                   </div>
		                                  		 </div>
		                                  	 </div> 
		                                  	 <div class="col-lg-4">
					                        <div class="card"> 
			                                   <div class="card-body">
											      <div class="basic-form">   
											     	  <h4>금지어 추가 지정</h4>   
											     	       <div><br></br></div>                        
					    								
													 	 <div class="form-group">  
					                                     <input class="form-control input-rounded"  type="text" name="tabooWordCheck" size="40"  id="tabooinsertinput"/>
					                                      </div>
					                                      <button style="float: right;"  id="tabooinsertBtn" class="btn btn-dark mb-2">추가</button> 
					         							  <button onclick="taboolistPopup();" class="btn btn-dark mb-2">리스트 확인</button> 
					                                    </div>
					                                   </div>
		                                  		 </div>
		                                  	 </div> 
		                                  <div class="col-lg-4" >
					                        <div class="card" style="height: 120px;"> 
			                                   <div class="card-body">
											      <div class="basic-form">   
											     	  <h4>금지어 닉네임 및 경고,정지 회원 관리</h4>
						                                   <div style="float: right;">
						                                  	 <button onclick="tabooContainsMemberlistPopup();" class="btn btn-dark mb-2" style="margin-top: 2px;">검색</button> 
														   </div>
					                                    </div>
					                                </div>
		                                  		 </div>
		                                  		 <div class="card" style="height: 80px; margin-top: -10px;">  
		                                  		 	<div class="card-body">
					                                <h4>일정 관리</h4>
					                                 <div style="margin-top:-30px; float: right;">
						                               <button onclick="adminCalenderPopup();" class="btn btn-dark mb-2"  >TodoList</button>          
						                              </div>  	
						                            </div>
												 </div>
												 <div class="card">
												 	<a href="/jejufriends/content/form" type="button" class="btn btn-primary">컨텐츠 등록</a>				
												 </div>
		                                  	 </div> 
		                                   
		                                   </div>  
		                                  
		                                   
                                  <div id="outter">
										<div style="float: right;">
											<select id="cntPerPage" name="sel" onchange="selChange()">
												<option value="5"
													<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
												<option value="10"
													<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
												<option value="15"
													<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
												<option value="20"
													<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
											</select>
										</div> 
									</div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
    
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 회원 번호 <a href="/jejufriends/admin/memberManagement?columnOrderBy=idNumber" title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 아이디 <a href="/jejufriends/admin/memberManagement?columnOrderBy=email"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 이름 <a href="/jejufriends/admin/memberManagement?columnOrderBy=name" title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 닉네임 <a href="/jejufriends/admin/memberManagement?columnOrderBy=nickName"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 전화번호 <a href="/jejufriends/admin/memberManagement?columnOrderBy=phoneNumber"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif; " > 성별 <a href="/jejufriends/admin/memberManagement?columnOrderBy=gender"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif; width: 110px;" > 회원분류 <a href="/jejufriends/admin/memberManagement?columnOrderBy=checkSnsId"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 등급 <a href="/jejufriends/admin/memberManagement?columnOrderBy=grade"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 활성화<a href="/jejufriends/admin/memberManagement?columnOrderBy=enabled"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 가입일<a href="/jejufriends/admin/memberManagement?columnOrderBy=REGISTRATIONDATE"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 마지막 접속일<a href="/jejufriends/admin/memberManagement?columnOrderBy=LASTDATE"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                                <th style="font-family: 'Nanum Gothic', sans-serif;" > 권한<a href="/jejufriends/admin/memberManagement?columnOrderBy=AUTHORITY"  title="정렬"><i class="fa fa-arrow-down"></i></a></th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        <c:if test="${empty memberList}">
											<tr align="center" noshade>
											   <td colspan="5">회원이 존재하지 않습니다.</td>
											</tr>
										</c:if>
										
										<c:forEach items="${memberList}" var="member">
											<tr align='center' noshade >
												<td><a type="button" class="memberinfoBtn" ><c:out value= "${member.idNumber}"/></a></td>
												<td><a type="button" class="memberinfoBtn" ><c:out value= "${member.email}"/></a></td>
												<td><a type="button" class="memberinfoBtn" ><c:out value= "${member.name}"/></a></td>
												<td><c:out value= "${member.nickName}"/></td>
												<td><c:out value= "${member.phoneNumber}"/></td>
												<td>
													<c:choose>
														<c:when test= "${member.gender == 'male'}">
															남자
														</c:when>
														<c:when test= "${member.gender == null}">
															카카오
														</c:when>
														<c:otherwise>
															여자
														</c:otherwise>
													</c:choose>
												</td>
												<td>
												<c:choose>
													<c:when test ="${member.checkSnsId == 0}">
														<span class="label gradient-1 rounded">	일반회원</span>
													</c:when>
													<c:otherwise>
														<span class="label gradient-4 rounded">카카오회원</span>
													</c:otherwise>
												</c:choose>
												</td>
												<td><c:out value= "${member.grade}"/></td>
												<td>
												<c:choose>
													<c:when test ="${member.enabled == 1}">
													<span class="badge badge-success px-2">정상</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-danger px-2">정지</span>
													</c:otherwise>
												</c:choose>
												</td>
												
												
												<td><c:out value= "${member.registRationDateString}"/></td>
												<td><c:out value= "${member.lastDateString}"/></td>
												<td><c:out value= "${member.authority}"/></td>
												
										    </tr> 
										</c:forEach>      
                             
                                        </tbody>
                                    </table>
                                      <div style="display: block; text-align: center;">		
										<c:if test="${paging.startPage != 1 }">
											<a href="/jejufriends/admin/memberManagement?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&catgo=${paging.sqlcatgo}&keyword=${paging.keyword}&columnOrderBy=${paging.columnOrderBy}" >&lt;</a>
										</c:if>
										<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
											<c:choose>
												<c:when test="${p == paging.nowPage }">
													<b>${p }</b>
												</c:when>
												<c:when test="${p != paging.nowPage }">
													<a href="/jejufriends/admin/memberManagement?nowPage=${p }&cntPerPage=${paging.cntPerPage}&catgo=${paging.sqlcatgo}&keyword=${paging.keyword}&columnOrderBy=${paging.columnOrderBy}">${p }</a>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${paging.endPage != paging.lastPage}">
											<a href="/jejufriends/admin/memberManagement?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&catgo=${paging.sqlcatgo}&keyword=${paging.keyword}&columnOrderBy=${paging.columnOrderBy}">&gt;</a>
										</c:if>
									</div>
	
                                </div>
                         
                            </div>
                        </div>
                        
                </div>
                </div>
  

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="/admin/plugins/common/common.min.js"></script>
    <script src="/admin/js/custom.min.js"></script>
    <script src="/admin/js/settings.js"></script>
    <script src="/admin/js/gleek.js"></script>
    <script src="/admin/js/styleSwitcher.js"></script>
    <script src="/js/taboolist.js" charset="utf-8"></script>
    <script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
	location.href="/jejufriends/admin/memberManagement?nowPage=${paging.nowPage}&cntPerPage="+sel+"&catgo=${paging.sqlcatgo}&keyword=${paging.keyword}";
	}
    </script>
    <jsp:include page="../footer.jsp" flush="true"/>
</body>

</html>