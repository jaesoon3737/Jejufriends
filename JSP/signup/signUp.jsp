<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="UTF-8"%>
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
  <title>Jeju Friends SignUp</title>
  <!-- loader-->
  <link href="/assets/css/pace.min.css" rel="stylesheet"/>
  <script src="/assets/js/pace.min.js"></script>
  <!--favicon-->
  <link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon">
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
    <div class="height-200v d-flex align-items-center justify-content-center">
    <div style="margin-right: 70px;">
      <div class="text-center" >
      <a href="/jejufriends"><img style = "height: 270px; width:600px;" src="/assets/images/logo.png" ></a>
     </div>
    </div>
    <div class="card card-authentication1 mb-0">
		<div class="card-body">
		 <div class="card-content p-2">
  		   <div class="card-title text-uppercase pb-2">Let's make an Account. Jeju Friends</div>
			<form:form modelAttribute="member" name="fSign" id="fSign" action="/jejufriends/signup" method="post">
			      <div class="form-group">
				    <label for="email" class="">Email ID</label>
				      <div class="position-relative has-icon-right">
						  <form:input type="email" path="email" id="email" name="email" value="${member.email}" class="form-control input-shadow" placeholder="이메일을 입력하세요"/>
						  <form:errors path="email" cssClass="error "/>
					  	  <div class="form-control-position">
						  <i class="icon-envelope-open"></i>
					  </div>
				    </div>
				    </div>
				  <div class="form-group">
				 	  <p class="text-center mt-3" id="messages"></p>
				  </div>
				  <div class="form-group">
				  	  <label for="name" class="">Name</label>
				      <div class="position-relative has-icon-right">
						  <form:input type="text" path="name" id="name" name="name" value="${member.name}" class="form-control input-shadow" placeholder="성함을 입력하세요." minlength="1"/>
						  <form:errors path="name" cssClass="error"/>
					  	  <div class="form-control-position">
						 	 <i class="icon-user"></i>
						  </div>
				   	  </div>
				  </div>
				  <div class="form-group">
				  	<label for="nickName">NickName</label>
				    <div class="position-relative has-icon-right">
					  <form:input type="text"  path="nickName"  id="nickName" name="nickName" value="${member.nickName}"  class="form-control input-shadow" placeholder="닉네임을 입력하세요" minlength="3"/>
					  <form:errors path="nickName" cssClass="error "/>
					  <div class="form-control-position">
						  <i class="icon-speech"></i>
					  </div>
					  <div>
					  	<c:if test="${not empty errorAlert}">
					  		<div style="color: red;"><p>닉네임을 다시 설정해주세요</p></div>
					  	</c:if>
					  </div>
				     </div>
				   </div>
				   <div class="form-group">
				      <p class="text-center mt-3" id="messagenick"></p>
				   </div>
				   <div class="form-group">
				  	 <label for="pwd">Password</label>
				  	 <div class="position-relative has-icon-right">
						  <form:input type="password" path="pwd" id="pwd"  name="pwd" value="${member.pwd}"  class="form-control input-shadow" placeholder="비밀번호 (10~20 자리 특수문자,소문자,숫자조합)"  maxlength="20" minlength="10" />
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
				   	<label for="pwdCheck">PasswordCheck</label>
				   	<div class="position-relative has-icon-right">
					 	 <input type="password" id="pwdCheck" name="pwdCheck" class="form-control input-shadow" placeholder="비밀번호 확인 "  maxlength="20" >
						 <div class="form-control-position">
							  <i class="icon-check"></i>
					     </div>
				    </div>
					<div>
	     	   			<p class="text-center mt-3" id='checkPw'></p>
	     	 		</div>
				  </div>
				  <div class="form-group">
				   <label for="phoneNumber">PhoneNumber</label>
				    <div class="position-relative has-icon-right">
					   <form:input type="tel"  path="phoneNumber" id="phoneNumber" name="phoneNumber" value="${member.phoneNumber}"  class="form-control input-shadow" placeholder="전화번호를 입력하세요." />
					   <form:errors path="phoneNumber" cssClass="error"/>
					  <div class="form-control-position">
						  <i class="icon-phone"></i>
					  </div>
				    </div>
				   </div>
	               <div class="form-group">
				     <label for="birth" >Birth</label>
				        <div class="position">
	                      <form:input type="date"  path="birth" id="birth" name="birth" value="${member.birth}"  class="form-control input-shadow" placeholder="Birth 'YYMMDD' "  />
		     	  		    <form:errors path="birth" cssClass="error"/> 
		     	  		    <div class="form-control-position">
					  </div>
				    </div>
				   </div>
				  <div class="btn-group2" role="group" aria-label="Basic radio toggle button group">
				      <label for="birth" >Gender</label>
				     <div class="icheck-material-white">
	                   <input type="radio" id="user-checkbox" name="gender"  value='male' autocomplete="off" checked/>
	                   <label for="user-checkbox">male</label>
				     </div>
				       <div class="icheck-material-white">
					       <input type="radio" id="user-checkbox1" name="gender" value='female' autocomplete="off"  />
		                   <label for="user-checkbox1">female</label>
	                   </div>
				    </div>
				  <br>
					<div class="card-footer text-center py-3">
				 <button type="submit" id="signUpButton" class="btn btn-light btn-block waves-effect waves-light" disabled>SIGN UP</button>
					</div> 
			</form:form> 
		</div>
	 </div>
		 <div class="card-footer text-center py-3">
		 	<p class="text-warning mb-0">이미 회원이신가요 ? <a href="/jejufriends/login"> 로그인 </a></p>	   
		 </div>
	 </div>
     </div>	
	  <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
	  <script src="/assets/js/jquery.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
	  <script src="/assets/js/popper.min.js"></script>
	  <script src="/assets/js/bootstrap.min.js"></script>
	  <script src="/assets/js/sidebar-menu.js"></script>  
	  <script src="/assets/js/app-script.js"></script>
	  <script src="/js/signUp.js"></script>
</body>
</html>
