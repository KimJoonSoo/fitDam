<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@include file="../views/include/info.jsp"%>
<title>핏을 담다, fitDam</title>



<script>
// 쿠키 설정 작업 (이름, 값, 만료시간)
function setCookie(name, value, expirehours) 
{ 
	// 오늘날짜
	var todayDate = new Date(); 
	// 시간설정 (현재시간 + 만료시간)
	todayDate.setHours( todayDate.getHours() + expirehours ); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
}

// 창을 닫기 위한 설정
function closeWin() 
{ 
	// if 배너닫기 체크박스가 체크 된 경우 쿠키값 설정 : 만료시간 1시간
	if(document.getElementById("closeBanner").checked)
	{
  		setCookie("fitDamcookie", "cookiePOWER" , 1); 
	}
 	
	document.getElementById("fitbanner").style.display = "none";
}
</script>



</head>

<body>
<div>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<%@include file="/WEB-INF/views/include/nav.jsp"%>
<section>

<!-- 닫기 단추 클릭시 사라지는 기능 구현 -->
<div class="fitbanner" id="fitbanner">
	<div class="fitbannerTOP">
		<table style="width: 295px;">
			<tr>
				<td colspan="3"><img src="/images/banner.jpg" style="width:286px; height: 250px;"></td>
			</tr>
			<tr>
				<td class="bannertd">notice1</td>
				<td class="bannertd">notice2</td>
				<td class="bannertd">notice3</td>
			</tr>
			<tr>
				<td class="bannertd">notice4</td>
				<td class="bannertd">notice5</td>
				<td class="bannertd">notice6</td>
			</tr>
			<tr>
				<td colspan="3" style="height: 25px; background-color: #FFFFFF">
					<input type="checkbox" id="closeBanner" name="closeBanner">
					하루동안 열지 않기  
					<input type="button" id="BtnX" name="BtnX" value="X" onclick="javascript:closeWin();" style="width: 20px; height: 20px; border-radius: 4px; background-color: #002266; color: #FFFFFF;">
				</td>
			</tr>
		</table>	
	</div>
</div>   

<script>
cookiedata = document.cookie;

if (cookiedata.indexOf("fitDamcookie=cookiePOWER") < 0)
{ 
	document.getElementById('fitbanner').style.display = "inline";
} 
else 
{
	document.getElementById('fitbanner').style.display = "none";
}
</script>















</section>
<%@include file="../views/include/footer.jsp"%>
</div>
</body>

</html>