<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>JEJU FRIENDS</title>
<meta http-equiv="Content-Language" content="ko"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge"/><!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></link>
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
<hr class="layout"/>
	<div id="wrap" > 
			<div style="margin-top: 150px; margin-left: 120px;"></div>
		<div id="container" style="background-image: url('/img/memberinfo.png')">
			<div id="contents">
			<div class="container" style="margin-top: 40px;" >
				<div class="row">
					<div class="col-lg-4" >
            			<div class="profile-card-4 z-depth-3">
            				<div class="card" >
              					<div class="card-body text-center bg-primary rounded-top">
									<img src="/img/jeju2.png" style='width: 280px; height: 140px; margin-left: 30px; margin-right: 30px;' />
             					</div>
              					<div class="card-body">
               						<ul class="list-group shadow-none">
                 						<li class="list-group" style="margin-top: 20px;">
											<div class="list-details">
												<div class="list-icon">
													<i class="fa fa-phone-square"></i>
													<div style="margin-top: 12px;">
													<p style="color: gray; font-family: 'Nanum Gothic', sans-serif; font-size: 20px;" ><c:out value="${ChangePhoneNumber}"/></p>
													</div>
												</div>
											</div>
										</li>
                  						<li class="list-group" style="margin-top: 20px;">
	                 						<div class="list-details">
	                  							<div class="list-icon">
	                   						    	<i class="fa fa-2xs fa-envelope"></i>
	                    							<div style="margin-top: 10px;">
	                   							   		<p style="color: gray; font-family: 'Nanum Gothic', sans-serif; font-size: 20px;"><c:out value="${emailChangeStar}"/></p>
	                   							    </div>
	                  							</div>
	                     					</div>
                						</li>
                  						<li class="list-group" style="margin-top: 20px;">
	                  						<div class="list-details">
	                   							<div class="list-icon">
	                   						    	<i class="fa fa-2xs fa-user-o" ></i>
	                      							<div style="margin-top: 10px;">
	                   		 							<p style="color: gray; font-family: 'Nanum Gothic', sans-serif; font-size: 20px;"><c:out value="${member.nickName}"/></p>
	                   							    </div>
	                  							</div>              
	                 						</div>
                						</li>
                  						<li class="list-group" style="margin-top: 20px;">
	                  						<div class="list-icon">
	                  							</div>
	                  						<div class="list-details">
		             							<button  class="btn btn-link btn-lg btn-block" style="font-family: 'Nanum Gothic', sans-serif;  font-size: 20px;" id="userdelete" onclick="deletePopup();" >회원탈퇴</button>    
		          	   						</div>
		          	   						<div id="deleteInputPassword"></div>
                						</li>
               						</ul>
                                </div>
							</div>
						</div>
        			</div>
        
        			<div class="col-lg-8" >
        				<div class="card">
           				<div class="card z-depth-3">
            				<div class="card-body">
           						<ul class="nav nav-pills nav-pills-primary nav-justified">
	               				    <li class="nav-item">
					                    <a href="javascript:void();" data-target="#profile" data-toggle="pill" class="nav-link active show"><i class="icon-user"></i> <span class="hidden-xs" style="font-family: 'Do Hyeon', sans-serif;  font-size: 20px;">내 정보</span></a>
					                </li>
					                <li class="nav-item">
					                    <a href="javascript:void();" data-target="#messages" data-toggle="pill" class="nav-link"><i class="icon-envelope-open"></i> <span class="hidden-xs" style="font-family: 'Do Hyeon', sans-serif;  font-size: 20px;">정보 변경</span></a>
					                </li>
					              
            					</ul>
            				<div class="tab-content p-4">
                				<div class="tab-pane active show" id="profile">
                				<div style="margin-top: 20px; margin-bottom: 20px; width: 626px; margin-left: 32px;">
                   <h3 style="font-family: 'Do Hyeon', sans-serif;" ><span class="fa fa-user-o float-right"></span> 내정보	</h3>
                    				<hr></hr>
                    				</div>
                    	 <div class="container d-flex align-items-center justify-content-center flex-wrap">
                    		<div class="card" style="width: 600px;">
           						<div class="card z-depth-3" style="width: 600px; padding: 11px; ">
                    				<div class="row">
				                        <div class="col-md-6">
				                        	 <div style="margin-top: 20px;">
				                            	<p style="font-family: 'Nanum Gothic', sans-serif; font-size: 20px; font-weight: bold; color: black;" >아이디</p>
				                             </div>
				                             <div style="margin-top: 10px;">
						                   		 <p style="font-family: 'Nanum Gothic', sans-serif; font-size: 15px;"><c:out value="${emailChangeStar}"/></p>
						                     </div>
				                       	     <div style="margin-top: 20px;">
				                            	<p style="font-family: 'Nanum Gothic', sans-serif; font-size: 20px; font-weight: bold; color: black;" >이름</p>
				                             </div>
				                             <div style="margin-top: 10px;">
						                   		 <p style="font-family: 'Nanum Gothic', sans-serif; font-size: 15px;"><c:out value="${member.name}"/></p>
						                     </div>  
						                     <div style="margin-top: 20px;">
				                            	<p style="font-family: 'Nanum Gothic', sans-serif; font-size: 20px; font-weight: bold; color: black;" >닉네임</p>
				                             </div>
				                             <div style="margin-top: 10px;">
						                   		 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 15px;"><c:out value="${member.nickName}"/></p>
						                     </div>
					                    	 <div style="margin-top: 20px;">
				                          		 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; font-weight: bold; color: black;" >생일</p>
				                           	 </div>
				                             <div style="margin-top: 10px;">  
						                   		 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 15px;"><c:out value="${memberBirth}"/></p>
						                     </div>
					                        </div>
					                        <div class="col-md-6">
				                            <div style="margin-top: 20px;">
				                           		 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; font-weight: bold; color: black;" >등급</p>
				                           	</div>
				                            <div style="margin-top: 10px;">  
						                   		 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 15px;"><c:out value="${userRole}"/></p>
						                    </div>
						                    <div style="margin-top: 20px;">
						                  	 	 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; font-weight: bold; color: black;" >성별</p>
				                           	</div>
				                            <div style="margin-top: 10px;">  
						                   		 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 15px;"><c:out value="${member.gender}"/></p>
						                    </div>
						                    
						                    <div style="margin-top: 20px;">
						                    	<p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; font-weight: bold; color: black;" >전화번호</p>
				                           	</div>
				                            <div style="margin-top: 10px;">  
						                   		 <p style="font-family: 'Nanum Gothic', sans-serif;  font-size: 15px;"><c:out value="${ChangePhoneNumber}"/></p>
						                    </div>
				                        </div>
				                        </div>
				                        </div>
				                   </div> 
		                        <div class="col-md-12">
		                            <div style="margin-top: 20px; margin-bottom: 20px;">
		                            	<h3 style="font-family: 'Do Hyeon', sans-serif;" ><span class="fa fa-clock-o ion-clock float-right"></span> 최근 코스	</h3>
		                            	 <div><hr></hr></div>
		                            	 <div class="container d-flex align-items-center justify-content-center flex-wrap">
		           							<div class="card z-depth-3" style="width: 600px;">
										    <div class="card" style="width: 600px;">
		                            	        <div class="card-header" style="background-color: #3399ff;">
											  	<h4 style="color: white; font-weight: bold;">Active Jeju</h4>
											    </div>
			                            	    <div class="card-body" >
												    <div class="box">
												        <div class="body">
												            <div class="imgContainer z-depth-3 " style="width: 520px;"> <img src="https://images.pexels.com/photos/1532771/pexels-photo-1532771.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt=""> </div>
												            <div class="content d-flex flex-column align-items-center justify-content-center" style="width: 520px;">
												                <div>
												                    <h3 class="text-white fs-5" style="font-family: 'Nanum Gothic', sans-serif;">제주공항</h3>
												                    <p class="fs-6 text-white" style="font-family: 'Nanum Gothic', sans-serif;">제주공항 맛집 뭐가 있삼;;</p>
												                </div>
												            </div>
												        </div>
												    </div>
												</div>
										    </div>
										    </div> 
								    
											    
											</div>                
			                            </div> 
			                        </div>
			                    </div>     	
                				</div>     
                				<div class="tab-pane" id="messages">
                				<div class="card z-depth-3" style="margin: 10px; width: 680px;">
                				<div class="card-body">
                    			<div></div>               
                       				<div class="form-group row" style="margin-top: 10px; font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; color: black;">
                            			<label class="col-lg-3 col-form-label form-control-label">닉네임</label>
                            				<div class="col-lg-9">
                                				<input  class="form-control form-control-lg" type="text" name="nickName" id="nickName"  value="<c:out value='${member.nickName}'/>" />
                                				<p class="text-center mt-3" id='messagenick'></p>
                            				</div>
                       				</div>
                       				<div class="form-group row" style="margin-top: 10px; font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; color: black;" >
                            			<label class="col-lg-3 col-form-label form-control-label">휴대폰 번호</label>
                            			<div class="col-lg-9">
                                			<input type="tel" class="form-control form-control-lg"  name="phoneNumber" id="phoneNumber" value="<c:out value='${member.phoneNumber}'/>"/>
                            			</div>
                        			</div>
	                                <div class="form-group row">
		                                <div class="col-sm" style="font-family: 'Nanum Gothic', sans-serif;  font-size: 15px; color: black;">
		                                	<button class="btn btn-primary btn-block" id="changeInfo"> 정보 변경 </button>
	                                	</div>
                 			  		</div>
                 			  		</div>
                 			  	</div>
                 			  	<div class="card z-depth-3" style="margin: 10px; width: 680px;">
                				<div class="card-body">
				                  	  <div class="alert alert-danger alert-dismissible" role="alert">
				   			  	  	 	 <button type="button" class="close" data-dismiss="alert">×</button>
							    	     <div class="alert-icon">
								 			<i class="icon-info"></i>
							     	     </div>
							     	     <div class="alert-message">
							    			<span><strong>비밀번호 변경</strong> 특수문자 , 문자 , 숫자를 포함하여 설정하여주세요.</span>
							     	     </div>  
				                      </div>
				                   	  <div class="form-group row">       
				                      </div>
				                      <div class="form-group row" style="margin-top: 10px; font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; color: black;">
				                            <label class="col-lg-3 col-form-label form-control-label">현재 비밀번호</label>
				                            <div class="col-lg-9">
				                                <input type="password" class="form-control form-control-lg"  name="pwd" id="pwd"/>  
				                            </div>
				                      </div>
									  <div class="form-group row" style="margin-top: 10px; font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; color: black;">
				                            <label class="col-lg-3 col-form-label form-control-label">새 비밀번호</label>
				                            <div class="col-lg-9">
				                                 <input class="form-control form-control-lg"  type="password" name="newPwd"  id="newPwd"/>
				                                 <p class="text-center mt-3" id="messagespwd"></p>
				                            </div>
				                      </div>
				                      <div  class="form-group row" style="margin-top: 10px; font-family: 'Nanum Gothic', sans-serif;  font-size: 20px; color: black;">
				                            <label class="col-lg-3 col-form-label form-control-label">비밀번호 확인</label>
				                            <div class="col-lg-9">
				                                <input class="form-control form-control-lg"   type="password"  id="pwdCheck"/>
				                                <p class="text-center mt-3" id='checkPw'></p>
				                            </div>
				                      </div>
				                      <div class="form-group row" style="margin-top: 20px; font-family: 'Nanum Gothic', sans-serif;  font-size: 15px;">
				                           <div class="col-sm" style="font-family: 'Do Hyeon', sans-serif;  font-size: 15px;">
				                                <button  class="btn btn-primary btn-block" id="changePassword" disabled>비밀번호 변경</button>
				                           </div>
				                      </div>
				                      	</div>
                 			  	</div>
				                      
				                  </div>
			                  	</div>
			         		</div>
			         	</div>
			         </div>
		         </div>         	
			  </div>
	</div>
<footer>
<div id="footer" style="margin-top: 150px">
		<div class="xans-element- xans-layout xans-layout-footer cboth inner ">
	<div class="bt_logo"><img src="/img/jeju2.png" style="width: 190px; height: 100px;"/></a></div>
<div class="bt_info" style="margin-left: 50px;">
			<div class="bt_title">제주 프렌즈</div>
			대표자 : 제주 프렌즈<br/>
			소재지 : KOSMO<br/>
			사업자등록번호 : 제주 프렌즈 <br/>
			통신판매업신고번호 : 제주프렌즈<br/>
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
			<div class="copyright">COPYRIGHT © <span>제주 프렌즈 </span> ALL RIGHTS RESERVED. HOSTING BY 제주프렌즈(주)</div>

			<div class="cboth bt_sns">
<!-- 하단 SNS 링크 수정하는곳 -->
				</div>
		</div>
</div>
</div>
</footer>
</div>
</div>
</div>
</body>
</html>