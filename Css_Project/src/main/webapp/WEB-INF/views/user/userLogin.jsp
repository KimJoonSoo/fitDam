<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>회원 로그인</title>
</head>
<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<section>
<br/><br/><br/><br/><br/>
<form id="loginform" name="loginform">
	<div>
	<table class="slogin">
		<tr class="slogin">
			<th colspan="2" class="stitle">M E M B E R  &nbsp;&nbsp;  L O G I N</th>
		</tr>
		<tr class="slogin">
			<th class="slogin">ID</th>
			<td class="slogin"><input class="slogin" id="u_id" name="u_id" type="email" placeholder="example@email.com" maxlength="30" value="useforjava@gmail.com"></td>
		</tr>
		<tr class="slogin">
			<th class="slogin">PASSWORD</th>
			<td class="slogin"><input class="slogin" id="u_password" name="u_password" type="password" placeholder="고객님의 소중한 비밀번호" maxlength="16" value="11111111"></td>
		</tr>
	</table>
	</div>
	
	<br/>
	
	<div class="sbutton" id="loginbtn">
		L &nbsp;&nbsp;O &nbsp;&nbsp;G &nbsp;&nbsp;I &nbsp;&nbsp;N
	</div>
	
	<br/>

	<div class="sforgot">
		<a class="schange" id="forgotID" style="cursor: pointer; font-size: 15px;">| forgot ID |</a>
		<a class="schange" id="forgotPW" style="cursor: pointer; font-size: 15px;">| forgot Password | &nbsp;</a>
	</div>
	
	<br/>

	<div>
	<table class="sregister">
		<tr class="sregister">
			<td class="sregister">회원이 아니신가요? 회원가입을 하시면 1000포인트와</td>
			<td class="sregister2" rowspan="2" id="registerBTN">JOIN MEMBER</td>
		</tr>
		<tr class="sregister">
			<td class="sregister">다양하고 특별한 혜택들이 준비되어 있습니다.</td>
		</tr>
	</table>
	</div>		
</form>
</section>
<%@include file="../include/footer.jsp"%>
</div>
</body>
<script>
	$(document).ready(function()
	{
		formObj = $("#loginform");
		console.log(formObj);	// systemout 처럼 로그 찍어주는 기능
		
		$("#loginbtn").click(function()
		{			
			formObj.attr("action", "/user/userLogin/");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});
</script>
<script>
	var result = '${info}';
	
	if(result == "noVerify")
	{
		alert("인증되지 않은 사용자 입니다.");	
	}
	
	if(result == "noExists")
	{
		alert("아이디 또는 비밀번호가 정확하지 않습니다.");	
	}
	
	if(result == "regist")
	{
		alert("인증메일이 발송되었습니다.");
	}
</script>

<script>
$(document).ready(function() 
{
	$('#registerBTN').on("click", function() 
	{
		location = "/user/yakgwan";
	});
	
	$('#forgotID').on("click", function() 
	{
		location = "/user/forgotID/";
	});
	
	$('#forgotPW').on("click", function() 
	{
		location = "/user/forgotPW/";
	});
});
</script>
</html>