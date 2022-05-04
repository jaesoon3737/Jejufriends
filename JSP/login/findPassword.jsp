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
  <link href="/assets/css/pace.min.css" rel="stylesheet"/>
  <script src="/assets/js/pace.min.js"></script>
  <link href="/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="/assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <link href="/assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <link href="/assets/css/app-style.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
</head>
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
<body class="bg-theme bg-theme2">
	 <div class="height-100v d-flex align-items-center justify-content-center">
	   <div style="margin-right: 70px;">
	     <div class="text-center" >
	    <a href="/jejufriends"><img style = "height: 270px; width:600px;" src="/assets/images/logo.png" ></a>
	     </div>
	   </div>
	   <div class="card card-authentication1 mb-0">
			<div class="card-body">
			 <div class="card-content p-2">
			  <div class="card-title text-uppercase pb-2">Change Password</div>
			    <p class="pb-1">변경할 비밀번호를 입력하세요.</p>
			    <form:form  modelAttribute="forgetMember" method="post" action="/jejufriends/forgetPassword/update">
				  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				  <input name="email" path="email" type="hidden" value = "<c:out value='${email}'/>"/>
				   <div class="form-group">
				  	 <label for="pwd" class="sr-only">Password</label>
				 		  <div class="position-relative has-icon-right">
							  <form:input type="password"  path="pwd" id="pwd"  name="pwd"  class="form-control input-shadow" placeholder="10~20 자리 특수문자,소문자,숫자조합"  maxlength="20" minlength="10" />
							  <form:errors path="pwd" cssClass="error "/>
						      <div class="form-control-position">
							  	<i class="icon-lock"></i>
						      </div>
				   		  </div>
				  </div>
				  <div>
				  	<p class="text-center mt-3" id="messagespwd"></p>
				  </div>
				  <div class="form-group">
					 <label for="pwdCheck" class="sr-only">PasswordCheck</label>
					 <div class="position-relative has-icon-right">
						  <input type="password"  path="pwdCheck" id="pwdCheck" name="pwdCheck" class="form-control input-shadow" placeholder="Check Password "  maxlength="20" minlength="10">
						  <div class="form-control-position">
							  <i class="icon-check"></i>
						  </div>
				     </div>
				  </div>
				  <div>
		     	   	 <p class="text-center mt-3" id='checkPw'></p>
		     	  </div>
				  <button type="submit" class="btn btn-light btn-block mt-3" id="findPasswordButton"  disabled >확인</button>
			   </form:form>
			  </div>
			 </div>
			 <div class="card-footer text-center py-3">
			    <p class="text-warning mb-0">비밀번호를 찾으셨나요 ? <a href="/jejufriends/login">  로그인 </a></p>
			 </div>
		 </div>
	  </div>
	
	  <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>

		
	  <!-- Bootstrap core JavaScript-->
	  <script src="/assets/js/jquery.min.js"></script>
	  <script src="/assets/js/popper.min.js"></script>
	  <script src="/assets/js/bootstrap.min.js"></script>
		
	  <!-- sidebar-menu js -->
	  <script src="/assets/js/sidebar-menu.js"></script>
	  
	  <!-- Custom scripts -->
	  <script src="/assets/js/app-script.js"></script>
	  <script src="/js/findPassword.js"></script>

</body>
</html>