<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel= "stylesheet" type="text/css" href="/css/header.css">
<header>
	<div>
		<ul class="leftmenu">
			<li class="top" id="goboard">| BOARD |</li>
			<li class="top">| QnA |</li>
			<li class="top">| REVIEW |</li>
			<li class="top" id="goinstagram">| INSTAGRAM |</li>
		</ul>
		<c:if test="${adminsession == null}">
			<ul class="rightmenu">
				<li class="top" id="loginA">| ADMIN LOGIN |</li>
				<li class="top" id="joinA">| ADMIN JOIN |</li>
			</ul>
		</c:if>
		<c:if test="${adminsession != null}">
			<ul class="rightmenu">
				<li class="top">관리자 [${adminsession.a_name}] 님이 접속중 |</li>
				<li class="top" id="logoutA">| LOGOUT |</li>
				<li class="top" id="myA">| ADMIN PAGE |</li>
			</ul>
		</c:if>
	</div>
	<br/>
	<br/>
	<div>
		<ul>
			<li class="title" onclick="javascript:location.href='http://localhost:8088/admin/adminHome';">F I T D A M</li>
		</ul>
		<ul>
			<li class="subtitle" onclick="javascript:location.href='http://localhost:8088/admin/adminHome';">The best choice, to fit your body</li>
		</ul>
	</div>
	<br/>
	<br/>
	<div>
		<ul>
			<li class="title" onclick="javascript:location.href='http://localhost:8088/admin/adminHome';">Admin Mode, Connecting</li>
			<li>본 사이트는 상업적 목적이 아님을 알려드립니다.</li>
			<li>악세서리 이미지 출처 : https://global.rakuten.com/</li>
		</ul>
	</div>
	<br/>

<script>
$(document).ready(function() 
{
	$('#joinA').on("click", function() 
	{
		location = "/admin/adminRegister/";
	});

	$('#loginA').on("click", function() 
	{
		location = "/admin/adminLogin/";
	});

	$('#logoutA').on("click", function() 
	{
		alert("정상적으로 로그아웃 되었습니다.");
		location = "/admin/adminLogout/";					
	});
	
	$('#myA').on("click", function() 	// 자기 정보만 읽을수 있도록
	{
		location = "/admin/adminMypage/";
	});
	
	$('#goinstagram').on("click", function() 	// 자기 정보만 읽을수 있도록
	{
		 window.open('https://www.instagram.com/f.i.t.d.a.m/');
	});
			
});
</script>	  
</header>