<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 로그인</title>
</head>
<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/><br/><br/><br/><br/>
<form id="loginform" name="loginform">
	<div>
	<table class="slogin">
		<tr class="slogin">
			<th colspan="2" class="stitle">A D M I N  &nbsp;&nbsp;  L O G I N</th>
		</tr>
		<tr class="slogin">
			<th class="slogin">ID</th>
			<td class="slogin"><input class="slogin" id="a_id" name="a_id" type="email" placeholder="example@email.com" maxlength="30"></td>
		</tr>
		<tr class="slogin">
			<th class="slogin">PASSWORD</th>
			<td class="slogin"><input class="slogin" id="a_password" name="a_password" type="password" placeholder="고객님의 소중한 비밀번호" maxlength="16"></td>
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
			<td class="sregister">FITDAM의 관리자이신가요? 관리자 등록을 하시고</td>
			<td class="sregister2" rowspan="2" id="registerBTN">REGIST ADMIN</td>
		</tr>
		<tr class="sregister">
			<td class="sregister">안전한 FITDAM의 관리 부탁드립니다.</td>
		</tr>
	</table>
	</div>		
</form>
</section>
<%@include file="../include/adminfooter.jsp"%>
</div>
</body>
<script>
$(document).ready(function()
{
	formObj = $("#loginform");
	console.log(formObj);	// systemout 처럼 로그 찍어주는 기능
	
	$("#loginbtn").click(function()
	{			
		formObj.attr("action", "/admin/adminLogin");
		formObj.attr("method", "post");
		formObj.submit();
	});
});
</script>

<script>
	var result = '${info}';
	
	if(result == "noExists")
	{
		alert("아이디 또는 비밀번호가 정확하지 않습니다.");	
	}
</script>

<script>
	$(document).ready(function() 
	{
		$('#registerBTN').on("click", function() 
		{
			location = "/admin/adminRegister";
		});
		$('#cancleBTN').on("click", function() 
		{
			location = "/admin/adminHome";
		});
		
		$('#forgotID').on("click", function() 
		{
			location = "/admin/forgotID/";
		});
		
		$('#forgotPW').on("click", function() 
		{
			location = "/admin/forgotPW/";
		});
	});
</script>
</html>