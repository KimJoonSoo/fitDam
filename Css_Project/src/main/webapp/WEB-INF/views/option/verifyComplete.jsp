<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>

<title>회원 등록</title>
</head>
<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<section>
<br/>
<br/>
<br/>
<form name="form" method="post">
    <table border="1" width="900px" align="center">
    	<tr>
    		<td height="100px" align="center" style="background-color: #f2f2f2;">
    			<p>가입하신 아이디의 인증이 완료되어 fitDam의 모든 정상적인 기능 이용이 가능합니다.</p>
    			<p>fitDam의 가족이 되어주셔서 감사합니다.</p>
    		</td>
    	</tr>
    	<tr>
    		<td align="center" height="30px"><input type="button" id="goLogin" value="로그인" style="background-color:#d65548;  color: white;"/></td>
    	</tr>
    </table>
</form>
</section>
<%@include file="../include/footer.jsp"%>
</div>
<script>
$(document).ready(function() 
{
	$('#goLogin').on("click", function() 
	{
		location = "userLogin/";
	});
});
</script>
</html>