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
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
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
<body class="bg-theme bg-theme11">
 <div class="height-100v d-flex align-items-center justify-content-center">

	<div class="card card-authentication1 mb-0">
		<div class="card-body">
		 <div class="card-content p-2">
		 
		  <div class="card-title text-uppercase pb-1" style="margin-left: 110px;">Jeju friends</div>
		  <img src="/assets/images/logo.png" alt="IMG-LOGO" style='width: 200px; height: 140px; margin-left: 70px; margin-bottom: 20px;'/>
	
		    <p class="pb-1" style="font-weight: bold;">정말로 회원탈퇴를 진행하시나요? <br>비밀번호 인증 후 확인을 눌러주세요.</p>
			  <div class="form-group">
				  <label for="pwd" >Password</label>
				   <div class="position-relative has-icon-right">
					  <input type="password"  name="pwd" id ="pwd" class="form-control input-shadow" value="${email}" placeholder="Password">
					  <div class="form-control-position">
						  <i class="icon-lock"></i>
					  </div>
				   </div>	   
			   </div>
			  <div class="form-group">
			  <label for="pwdCheck" >Check Password</label>
			  <div class="position-relative has-icon-right">
				  <input type="password" id="pwdCheck"  name="pwdCheck"  class="form-control input-shadow" placeholder="Check Password" >
				    <p class="text-center mt-3" id='checkPw'></p>
				  <div class="form-control-position">
					  <i class="icon-lock"></i>
				  </div>
			  </div>
		   </div>	 
		   <button class="btn btn-light btn-block mt-3" id="deleteuserbutton" disabled >확인</button>
		  </div>
		 </div>
	   </div>
	 </div>
     <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
  <script src="/assets/js/jquery.min.js"></script>
  <script src="/assets/js/popper.min.js"></script>
  <script src="/assets/js/bootstrap.min.js"></script>
  <script src="/assets/js/sidebar-menu.js"></script>
  <script src="/assets/js/app-script.js"></script>
  <script src="/js/withdraw.js"></script>

</body>
</html>