<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>회원목록</title>
    <!-- Favicon icon -->
    <link rel="icon" type="/image/png" sizes="16x16" href="/admin//images/favicon.png"/>
    <!-- Custom Stylesheet -->
    <link href="/admin/css/style.css" rel="stylesheet"/>

</head>
<body>
	<div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title">관리 대상 회원목록</h2>
                                <div style = "float: right; margin-bottom: 10px;">
                                    <p> ※ 부적절한 닉네임을 사용하는 사람들을 기본적인 </p>
                                 	<p>	 아이디로 일괄 변경처리 및 경고 1회 처리</p> 
                                 		 <hr></hr>
                                 <button  class="btn btn-secondary" id="tabooContainsMemberDefaultNickNameChangeBtn" onclick=" if(confirm ('변경처리를 진행하시나요?')) location='/jejufriends/admin/tabooContainsMemberDefaultNickNameChange';" style="font-weight: bold;">대상회원 닉네임 변경</button>
                                </div>
                                <div class="table-responsive">
                                    <table id="tabooALL" class="table table-bordered verticle-middle">
                                        <thead>
                                            <tr>
                                                <th scope="col">아이디 번호</th>
                                                <th scope="col">아이디</th>
                                                <th scope="col">닉네임</th>
                                                <th scope="col">경고 횟수   (3회 이상 시 정지)</th>
                                                <th scope="col">정지유무</th>
                                                <th scope="col">경고주기</th>
                                                <th scope="col">계정정지처리</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${memberList}" var="tabooContainsMember" >
                                             <tr>
                                            	<td><c:out value="${tabooContainsMember.idNumber}"/></td>
                                                <td><c:out value="${tabooContainsMember.email}"/></td>
                                                <td><c:out value="${tabooContainsMember.nickName}"/></td>
                                                <td><c:out value="${tabooContainsMember.cautionCount}"/></td>
                                                <td>
                                                <c:choose>
													<c:when test ="${tabooContainsMember.enabled == 1}">
													<span class="badge badge-success px-2">활성</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-danger px-2">정지</span>
													</c:otherwise>
												</c:choose>
                                                </td>
                                                <td><button  class="memberCautionBtn  btn btn-warning" style="font-weight: bold;" >경고 주기</button></td>
                                            	<td>
                                            	<c:choose>
													<c:when test ="${tabooContainsMember.enabled == 1}">
													    <button  class="memberSuspendBtn  btn btn-danger" style="font-weight: bold;">정지</button>
													</c:when>
													<c:otherwise>
														<button  class="memberSuspendBtn  btn btn-primary" style="font-weight: bold;">정지해제</button>
													</c:otherwise>
												</c:choose>
                                            	</td>
                                           		</tr>
                                            </c:forEach>
                                          
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
    <script src="/admin/plugins/common/common.min.js"></script>
    <script src="/admin/js/custom.min.js"></script>
    <script src="/admin/js/settings.js"></script>
    <script src="/admin/js/gleek.js"></script>
    <script src="/admin/js/styleSwitcher.js"></script>
    <script src="/js/memberSuspend.js"></script>
</body>
</html>