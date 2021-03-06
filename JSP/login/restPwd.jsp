<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <!-- loader-->
  <link href="/assets/css/pace.min.css" rel="stylesheet"/>
  <script src="/assets/js/pace.min.js"></script>
  <!-- Bootstrap core CSS-->
  <link href="/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="/assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="/assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Custom Style-->
  <link href="/assets/css/app-style.css" rel="stylesheet"/>
  
</head>
<body class="bg-theme bg-theme2">
<header class="topbar-nav">
 <nav class="navbar navbar-expand fixed-top">
  <ul class="navbar-nav mr-auto align-items-center">
    <li class="nav-item">
      <a class="nav-link toggle-menu" href="javascript:void();">
     </a>
    </li>
    <li class="nav-item">
    </li>
  </ul>
    
  <ul class="navbar-nav align-items-center right-nav-link">
    <li class="nav-item dropdown-lg">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect"  href="/jejufriends/login">
      <i class="icon-arrow-left-circle"></i></a>
    </li>
    <li class="nav-item dropdown-lg">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect"  href="/jejufriends">
      <i class="icon-home" ></i></a>
    </li>
    </ul>
</nav>
</header>
 <div class="height-100v d-flex align-items-center justify-content-center">
 <div style="margin-right: 70px;">
 <div class="text-center" >
  <a href="/jejufriends">   <img style = "height: 270px; width:600px;" src="/assets/images/logo.png" > </a>
 </div>
 </div>
	<div class="card card-authentication1 mb-0">
		<div class="card-body">
		 <div class="card-content p-2">
		  <div class="card-title text-uppercase pb-2">forget password</div>
		    <p class="pb-1">??????????????? ??????????????????????
		    			           ????????? ????????? ?????? ????????? ??????????????? ???????????????.</p>
		    <form  method="post" action="/jejufriends/forgetPassword" id="restPwdf">
			  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			  <div class="form-group">
				  <label for="email" class="">Email Address</label>
				   <div class="position-relative has-icon-right">
					  <input type="text"  name="email" id ="email" class="form-control input-shadow" value="${email}" placeholder="Email Address">
					  <div class="form-control-position">
						  <i class="icon-envelope-open"></i>
					  </div>
				<div style="margin-top: 10px; color: red;">
			  		<c:if test="${not empty errorAlertEmail}">
						<p>???????????? ?????? ???????????????. ???????????? ?????? ??????????????????.</p>
					</c:if>
				</div>
				   </div>
				   <button type="button" class="btn btn-light btn-block mt-2" id="mail-check-btn" >???????????? ??????</button>		   
			   </div>
			  <div class="form-group">
			  <label for="checkNumber" class="">Number</label>
			  <div class="position-relative has-icon-right">
				  <input type="text" id="checkNumber"  name="checkNumber"  class="form-control input-shadow" placeholder="??????????????? ???????????????" disabled="disabled" maxlength="6">
				  <div class="form-control-position">
					  <i class="icon-lock"></i>
				  </div>
			  </div>
			  <div style="margin-top: 10px; color: red;">
			  	<c:if test="${not empty errorAlertNumber}">
					<p>??????????????? ?????? ????????????. ?????? ??????????????????.</p>
				</c:if>
				</div>
		   </div>	 
		   <button type="submit" class="btn btn-light btn-block mt-3" id="mailcheck" disabled >??????</button>
		   </form>
		  </div>
		 </div>
		 <div class="card-footer text-center py-3">
		    <p class="text-warning mb-0">??????????????? ??????????????? ? <a href="/jejufriends/login">  ????????? </a></p>
		 </div>
	   </div>
	 </div>
     <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
  <script src="/assets/js/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
  <script src="/assets/js/popper.min.js"></script>
  <script src="/assets/js/bootstrap.min.js"></script>
  <script src="/assets/js/sidebar-menu.js"></script>
  <script src="/assets/js/app-script.js"></script>
  <script src="/js/restPwd.js"></script>
</body>
</html>