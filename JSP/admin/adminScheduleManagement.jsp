<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<link href="/admin/css/style.css" rel="stylesheet"/>
	<link href="/css/adminMemberInfo.css" rel="stylesheet"/>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gamja+Flower&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet"/>
</head>
<body  style="background-image: url('/img/memberinfo.png'); font-family: 'Nanum Gothic', sans-serif; ">
<sec:authentication property="principal.username" var = "emails"/>
<div class="reservation">
 <div>
 <div class="card  z-depth-3" style="margin: 30px; text-align: center; display: grid; " >
 	<div class="card-body  z-depth-3">
 	<h1>일정 관리</h1>
 	<hr>
 	<div style=" margin-top: 30px; margin-bottom: 40px;">
 	<div class="card-body text-center bg-primary rounded-top">
		<img src="/img/jeju2.png" style='width: 140px; height: 80px; margin-left: 2px; margin-right: 30px;' />
    </div>
 	<form action="/jejufriends/admin/schedule" method = 'post'>
	 	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	 	<input type="text" class="dateSelector" placeholder="날짜" name="tododate"/>
	 	<textarea class="form-control col-block" rows="6" style=" border: 1px solid #3399ff; border-bottom: 3px solid #3399ff; box-shadow: 0 1px 0 0 #3399ff;" placeholder="일정 내용" name="content"></textarea>
	 	<label class="btn btn-primary" for="btn-check-2" style="float: left; font-size: 16px; margin-top: 10px;">전체 일정
	 	<input name="publicCheck" id="btn-check-2" style="margin-left: 5px; height: 11px; cursor: pointer" type="checkbox" checked/>
 		</label>
 		<div style="float: right;">
 		<Button style="margin-top: 10px;"type="submit" class="btn btn block btn-primary">올리기</Button>
 		</div>
 	</form>
	</div>
<div style="text-align: center; padding: 30px;">
 <div class="card  z-depth-3" style="margin: 30px; text-align: center; display: grid; padding: 1px;" >
 	<div class="card-body  z-depth-3">
<h2>전체 공유 일정</h2>
<hr>
<table class="table table-hover" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">작성자</th>
      <th scope="col">시작일</th>
      <th scope="col">종료일</th>
      <th scope="col">내용</th>
      <th scope="col">일정 마감 시간</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${todolist}" var="todo">
   <c:if test="${todo.publicCheck == 'publicChecking'}">
  	<tr align='center' noshade >
  		<c:set var="em" value="${fn:indexOf(todo.estimatedTimeRemaining,'일')}"/>
		<c:set var="sub" value="${fn:substring(todo.estimatedTimeRemaining,0,em)}"/>
  		<td><c:out value= "${todo.todoListNum}"/></td>
		<td><c:out value= "${todo.email}"/></td>
		<td><c:out value= "${todo.startDate}"/></td>
		<td><c:out value= "${todo.endDate}"/></td>
		<td style="width: 300px;"><c:out value= "${todo.content}"/></td>
		<c:if test="${sub == 0 }">
		<td style="color: red;"><c:out value= "${todo.estimatedTimeRemaining}"/></td>
		</c:if>
		<c:if test="${sub != 0 }">
		<td><c:out value= "${todo.estimatedTimeRemaining}"/></td>
		</c:if>
		<c:if test="${todo.email eq emails}">
			<td><button class="tododeleteBtn btn btn-dark" >삭제</button></td>
		</c:if>
  	</tr>
  	</c:if>
  </c:forEach>
  </tbody>
</table>
</div>
</div>
 <div class="card  z-depth-3" style="margin: 30px; text-align: center; display: grid; " >
 	<div class="card-body  z-depth-3">
<h2>개인 일정</h2>
<hr>
<table class="table table-hover" style="text-align: center;">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">작성자</th>
      <th scope="col">시작일</th>
      <th scope="col">종료일</th>
      <th scope="col">내용</th>
      <th scope="col">일정 마감 시간</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${todolist}" var="todo">
  <sec:authorize access="isAuthenticated()">
   <c:if test="${todo.email eq emails}">
   <c:if test="${todo.publicCheck == 'privateChecking'}">
  	<tr align='center' noshade >
  	<c:set var="em" value="${fn:indexOf(todo.estimatedTimeRemaining,'일')}"/>
	<c:set var="sub" value="${fn:substring(todo.estimatedTimeRemaining,0,em)}"/>
  		<td><c:out value= "${todo.todoListNum}"/></td>
		<td><c:out value= "${todo.email}"/></td>
		<td><c:out value= "${todo.startDate}"/></td>
		<td><c:out value= "${todo.endDate}"/></td>
		<td style="width: 300px;"><c:out value= "${todo.content}"/></td>
		<c:if test="${sub == 0 }">
		<td style="color: red;"><c:out value= "${todo.estimatedTimeRemaining}"/></td>
		</c:if>
		<c:if test="${sub != 0 }">
		<td><c:out value= "${todo.estimatedTimeRemaining}"/></td>
		</c:if>
		<td><button class="tododeleteBtn btn btn-dark" >삭제</button></td>
  	</tr>
  	</c:if>
  </c:if>
  </sec:authorize>
  </c:forEach>
  </tbody>
</table>	
</div>
</div>
</div>
</div>
</div>
 </div>
</div>
	<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
	<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
	<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		let dateSelector = document.querySelector('.dateSelector');
	
		dateSelector.flatpickr({
			 minDate: "today",
			 enableTime: true,
			 mode: "range",
			 dateFormat: "Y-m-d H:i",
			 "locale" : "ko" ,
		});
		
		$(function(){
			$(".tododeleteBtn").on("click" , function() {
				   var str = ""
				   var checkBtn = $(this);
				   var tr = checkBtn.parent().parent();
				   var td = tr.children();
				   let deleteTodoListNumber  = td.eq(0).text();
				   $.ajax({
						type: 'get',
						data: {
							deleteTodoListNumber:deleteTodoListNumber
						},
						contentType: 'application/json;charset=UTF-8',
						url: "/jejufriends/admin/deleteTodoList" ,
						//dataType: 'application/json;charset=UTF-8',
						success: function(data) {
							if(data == '0'){
								tr.css("background-image" , "url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAHCAYAAAAxrNxjAAAAAXNSR0IArs4c6QAAABZJREFUKFNjZCASML6QZvhPjNphpRAAqBMMFNZDtCQAAAAASUVORK5CYII=')");
								tr.css("background-repeat" , "repeat-x");
								tr.css("background-position","60% 40%");
								alert("삭제 성공");
							} else {
								alert("실패");
							}
						
						},
						error:function(data){
							alert('error 재 로그인 후 진행해주세요.');
						}
						});
				});
			});
		
		

		
	</script>

</body>
</html>