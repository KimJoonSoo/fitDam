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
		<c:if test="${usersession == null}">
			<ul class="rightmenu">
				<li class="top" id="loginA">| LOGIN |</li>
				<li class="top" id="joinA">| JOIN |</li>
			</ul>
		</c:if>
		<c:if test="${usersession != null}">
			<ul class="rightmenu">
				<li class="top">[${usersession.u_name}] 님의 핏을 환영합니다. |</li>
				<li class="top" id="logoutA">| LOGOUT |</li>
				<li class="top" id="myA">| MYPAGE |</li>
				<li class="top" id="goCART">| CART |</li>
			</ul>
		</c:if>
	</div>
	<br/>
	<br/>
	<div>
		<ul>
			<li class="title" onclick="javascript:location.href='http://localhost:8088/';">F I T D A M</li>
		</ul>
	</div>
	<div>
		<ul>
			<li class="subtitle" onclick="javascript:location.href='http://localhost:8088/';">The best choice, to fit your body</li>
		</ul>
	</div>
	<br/>
	

	<div class="search-container">
		<input type="hidden" name="searchType" value="nno">
		<input type="button" id="keywordInputA" value="Search All Items" class="searchitem" readonly="readonly">
		<button id="SBTN"><i class="fa fa-search"></i></button>
  	</div>

<br/>

<script>
$(document).ready(function() 
{
	$('#joinA').on("click", function() 
	{
		location = "/user/yakgwan/";
	});

	$('#loginA').on("click", function() 
	{
		location = "/user/userLogin/";
	});

	$('#logoutA').on("click", function() 
	{
		alert("정상적으로 로그아웃 되었습니다.");
		location = "/user/userLogout";					
	});
	
	$('#myA').on("click", function() 	// 자기 정보만 읽을수 있도록
	{
		location = "/user/userMypage";
	});
	
	$('#goCART').on("click", function() 	// 자기 정보만 읽을수 있도록
	{
		location = "/user/cartuList";
	});
	
	$('#goboard').on("click", function()
	{
		if(${usersession != null})
		{
			location = "/board/listPage";
		}
		else if(${usersession == null})
		{
			alert("회원만 이용 가능합니다.")
			location = "/user/userLogin";
		}
	});
	
	$('#goinstagram').on("click", function() 	// 자기 정보만 읽을수 있도록
	{
		 window.open('https://www.instagram.com/f.i.t.d.a.m/');
	});
	
	
	$('#SBTN').on("click",	function(event) 
	{
		location = "/user/uproductAList"
		/* 			+ '${pageMaker.makeQuery(1)}'
					+ "&searchType=nno"
					+ "&keyword=" 
					+ encodeURIComponent($('#keywordInputA').val()); */
	});
	$('#keywordInputA').on("click",	function(event) 
	{
		location = "/user/uproductAList"
	});
	
});
</script>	
 
</header>