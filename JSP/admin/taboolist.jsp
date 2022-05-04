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
    <title>금지어 리스트</title>
    <!-- Favicon icon -->
    <link rel="icon" type="/image/png" sizes="16x16" href="/admin//images/favicon.png"/>
    <!-- Custom Stylesheet -->
    <link href="/admin/css/style.css" rel="stylesheet"/>

</head>
<body>
	<div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">닉네임 금지 단어</h4>
                                <div class="table-responsive">
                                    <table id="tabooALL" class="table table-bordered verticle-middle">
                                        <thead>
                                            <tr>
                                                <th scope="col">금지 단어 번호</th>
                                                <th scope="col">금지 단어</th>
                                                <th scope="col">삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${tabooAll}" var="taboo" >
                                             <tr>
                                            	<td>${taboo.tabooWordNumber}</td>
                                                <td>${taboo.tabooWordCheck}</td>
                                            	<td><button  class="tabooBtn" data-toggle="tooltip" data-placement="top" title="삭제"><i class="fa fa-close color-danger"></i></button></td>
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
    <script src="/js/taboolistdelete.js"></script>
</body>
</html>