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
	<title>Jeju Friends</title>
	<link href="/assets/css/pace.min.css" rel="stylesheet"/>
	<script src="/assets/js/pace.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gamja+Flower&family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link rel="icon" href="/assets/images/favicon.ico" type="image/x-icon">
	<link href="/assets/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="/assets/css/animate.css" rel="stylesheet" type="text/css"/>
	<link href="/assets/css/icons.css" rel="stylesheet" type="text/css"/>
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
				<a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect"  href="/jejufriends">
				<i class="icon-home" ></i></a>
			</li>
		</ul>
	</nav>
</header>

<div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
<div class="loader-wrapper"><div class="lds-ring"><div></div><div></div><div></div><div></div></div></div>
<div class="text-center" >
 <a href="/jejufriends"> <img style = "height: 270px; width:550px;" src="/assets/images/logo.png"></a> 
</div>
<div class="card card-authentication1 mx-auto my-5">
<div class="card-body">
	<div class="card-content p-2">
		<div class="card-title text-uppercase text-center py-3" style="font-family: 'Nanum Gothic', sans-serif;">로그인</div>
			<form:form modelAttribute="loginMember" name="f" id="fLogin" method="post" action="/jejufriends/security/login" cssClass="form-horizontal">
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				<div class="form-group">
					<label for="email" class="sr-only" style="font-family: 'Nanum Gothic', sans-serif;">Email</label>
						<div class="position-relative has-icon-right">
							<form:input type="text" path="email" id="email" name="email" class="form-control input-shadow" placeholder="Email"  minlength="7"/>
							<form:errors path="email" cssClass="error"/>
						<div class="form-group">
							<h6 id="messages"></h6>
						</div>
							<div class="form-control-position">
							<i class="icon-user"></i>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="sr-only" style="font-family: 'Nanum Gothic', sans-serif;">Password</label>
					<div class="position-relative has-icon-right">
						<form:input type="password" path="pwd"  id="pwd" name = "pwd" class="form-control input-shadow" maxlength="20" minlength="10" placeholder="Password"/>
						<form:errors path="pwd" cssClass="error "/>
						<div class="form-control-position">
						<i class="icon-lock"></i>
						</div>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
						<font color="red">
							${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
							<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
						</font>
						</c:if>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-6">
						<div class="icheck-material-white">
							<input name="remember-me" type="checkbox" id="user-checkbox" checked />
							<label for="user-checkbox" style="font-family: 'Nanum Gothic', sans-serif;">로그인 유지하기</label>
						</div>
						</div>
						<div class="form-group col-6 text-right">
						<a href="/jejufriends/forgetPassword/restPwd" style="font-family: 'Nanum Gothic', sans-serif;">비밀 번호 찾기</a>
					</div>
				</div>
					<button type="submit" class="btn btn-light btn-block" id="loginButton" style="font-family: 'Nanum Gothic', sans-serif;">로그인</button>
				<div class="text-center mt-3" style="font-family: 'Nanum Gothic', sans-serif;" >WITH</div>
			</form:form>
			<div class="card-footer text-center py-3">
				<input type="image" src="/img/kakaoLogin.png"  onclick="kakaoLogin();" />
			</div>
		</div>
	</div>
</div>
<div class="card-footer text-center py-3">
  	<p class="text-warning mb-0">계정이 없으신가요 ? <a href="/jejufriends/signup"> 회원 가입</a></p>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
function kakaoLogin() {
	  $.ajax({
	      url: '/jejufriends/login/getKakaoAuthUrl',
	      type: 'get',
	      async: false,
	      dataType: 'text',
	      success: function (res) {
	          location.href = res;
	      }
	  });

	}

	$(document).ready(function() {

	    var kakaoInfo = '${kakaoInfo}';

	    if(kakaoInfo != ""){
	        var data = JSON.parse(kakaoInfo);

	        alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
	        alert(
	        "user : \n" + "email : "
	        + data['email']  
	        + "\n nickname : " 
	        + data['nickname']);
	    }
	});  
</script>
<script src="/js/login.js"></script>

<a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
<script src="/assets/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/sidebar-menu.js"></script>
<script src="/assets/js/app-script.js"></script>
</body>
</html>
