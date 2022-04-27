<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<title>회원 정보</title>
<link href="/admin/css/style.css" rel="stylesheet"/>
<link href="/css/adminMemberInfo.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gamja+Flower&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet"/>
</head>
<body style="background-image: url('/img/memberinfo.png')">
<div class="container">
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12" style="margin-bottom: 20px;">
<div class="card h-100  z-depth-3" style="margin-bottom: 20px;">
	<div class="card-body  z-depth-3" >
		<div class="account-settings">
			<div class="user-profile">
				<div class ="card z-depth-3">
					<div class="card-body text-center bg-primary rounded-top">
						<img src="/img/jeju2.png" style='width: 140px; height: 80px; margin-left: 2px; margin-right: 30px;' />
	           		</div>
	  			</div>
           		<div class ="card z-depth-3" style="margin-top: 10px; border-radius: 2px; height: 60px; text-align: center; ">
           			<div class="card-body" style="margin-top: -7px; ">
	           			<h4 style=" color: black; ">회원번호 :  ${member.idNumber}</h4>
           			</div>
				</div>
				<div class ="card z-depth-3" style="margin-top: 10px; border-radius: 2px; height: 80px; ">
           			<div class="card-body" style="margin-top: -10px;  ">
	           			<h5 style=" color: black; ">아이디 : ${member.email}</h5>
           			</div>
				</div>
				<button id="cautionCountBtnMemberInfoBtn" class="btn btn-block btn-warning" style="margin-top: 20px; margin-bottom: 20px;">경고 주기</button>
				<c:choose>
				<c:when test='${member.enabled == 1}'>
				<button id="suspendMemberInfoBtn" class="btn btn-block btn-danger" style="margin-top: 20px; margin-bottom: 20px;" >정지</button>
				</c:when>
				<c:otherwise>
				<button id="suspendMemberInfoBtn" class="btn btn-block btn-primary" style="margin-top: 20px; margin-bottom: 20px;">정지해제</button>
				</c:otherwise>
				</c:choose>
				<sec:authorize access="hasRole('ROLE_SUPERADMIN')">
					<c:choose>
					<c:when test="${member.authority == 'ROLE_USER'}">
						<div class="text-right">
							<button id="AdminAuthorityBtn" class="btn btn-block btn-dark" style="margin-top: 90px;">관리자 권한부여</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text-right">
							<button id="AdminAuthorityBtn" class="btn btn-block btn-light" style="margin-top: 90px;">관리자 권한해제</button>
						</div>
					</c:otherwise>
					</c:choose>
				</sec:authorize>
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12" style="margin-bottom: 20px;">
<div class="card h-100  z-depth-3" style="margin-bottom: 20px;">
	<div class="card-body">
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Hold Information</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group"> 
					<label for="idNumber" >회원 번호</label>
					<input type="text" class="form-control" id="idNumber" value="<c:out value='${member.idNumber}'/>" disabled/>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group"> 
					<label for="emailid" >아이디</label>
					<input type="text" class="form-control" id="emailid" value="<c:out value='${member.email}'/>" disabled/>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group"> 
					<label for="authority" >권한</label>
					<c:choose>
					<c:when test="${member.authority == 'ROLE_USER'}"> 
						<input type="text" class="form-control" id="authority" value="유저"  disabled/>
					</c:when>
					<c:when test="${member.authority == 'ROLE_ADMIN'}"> 
						<input type="text" class="form-control" id="authority" value="관리자"  disabled/>
					</c:when>
					<c:when test="${member.authority == 'ROLE_SUPERADMIN'}">
						<input type="text" class="form-control" id="authority" value="최고관리자"  disabled/>
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" id="authority" value="게스트"  disabled/>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="enabled">계정 상태</label>
					<c:choose>
					<c:when test="${member.enabled == 1}"> <input type="text" class="form-control" id="enabled" value="정상"  disabled/></c:when>
					<c:otherwise>
						<input type="text" class="form-control" id="enabled" value="정지"  disabled/>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="lastDate">마지막 접속일</label>
					<input type="text" class="form-control" id="lastDate" value="<c:out value='${member.lastDateString}'/>" disabled/>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="registRationDate">회원 가입일</label>
					<input type="text" class="form-control" id="registRationDate" value="<c:out value='${member.registRationDateString}'/>" disabled/>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="gender">성별</label>
					<c:choose>
					<c:when test="${member.gender == 'male'}"> 
						<input type="text" class="form-control" id="gender" value="남자" disabled/>
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" id="gender" value="여자" disabled/>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="checkSnsId">SNS 회원 유무</label>
					<input type="text" class="form-control" id="checkSnsId" 
					<c:choose>
						<c:when test='${member.checkSnsId==0}'>
							value="일반회원"
						</c:when>
						<c:when test='${member.checkSnsId==1}'>
							value="카카오회원"
						</c:when>
						<c:otherwise>
							value="미정"
						</c:otherwise>
					</c:choose>
					 disabled/>
				
				</div>
			</div>
		</div>
		<form:form method="post" action="/jejufriends/admin/memberInfoChange" modelAttribute ="adminMemberInfoChange">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			<input value="${member.email}" type="hidden" name="email"/>
			<div class="row gutters">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<h6 class="mt-3 mb-2 text-primary">Changeable Information</h6>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					<div class="form-group">
						<label for="phoneNumber">휴대폰 번호</label>
						<form:input type="text" class="form-control" path="phoneNumber" id="phoneNumber" name="phoneNumber" value="${member.phoneNumber}"/>
						<form:errors path="phoneNumber" cssClass="error "/>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					<div class="form-group">
						<label for="nickName">닉네임</label>
						<form:input type="text" class="form-control" id="nickName" name="nickName" path="nickName" value="${member.nickName}"/>
						<form:errors path="nickName" cssClass="error "/>
						 <c:if test="${not empty nickNameDuplication}">
							   <p>이미 존재하는 닉네임 입니다.</p>
						</c:if>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12" >
					<div class="form-group">
						<label for="name">이름</label>
						<form:input type="text" class="form-control" path="name" id="name" name="name" value="${member.name}"/>
						<form:errors path="name" cssClass="error "/>
					</div>
				</div>
			    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					<div class="form-group">
						<label for="grade">등급 ( BASIC , SILVER , GOLD , VIP )</label>
						<br></br>
						<select path="grade" name="grade"  id="grade" class="show-tick" style="height: 38px; width: 300px; margin-top: -14px; border-color: #3366ff; border-radius: 3px;" >
							<option value="BASIC"
								<c:if test="${member.grade == 'BASIC'}">selected</c:if>>BASIC</option>
							<option value="SILVER"
								<c:if test="${member.grade == 'SILVER'}">selected</c:if>>SILVER</option>
							<option value="GOLD"
								<c:if test="${member.grade == 'GOLD'}">selected</c:if>>GOLD</option>
							<option value="VIP"
								<c:if test="${member.grade == 'VIP'}">selected</c:if>>VIP</option>
						</select>
						<form:errors path="grade" cssClass="error "/>
					</div>
				</div>
			</div>
					<button type="button" class="btn btn-secondary">Cancel</button>
					<button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
		</form:form>
	</div>
</div>
</div>
</div>
</div>
    <script src="/admin/plugins/common/common.min.js"></script>
    <script src="/admin/js/custom.min.js"></script>
    <script src="/admin/js/settings.js"></script>
    <script src="/admin/js/gleek.js"></script>
    <script src="/admin/js/styleSwitcher.js"></script>
    <script src="/js/adminMemberInfo.js" charset="utf-8"></script>
</body>
</html>