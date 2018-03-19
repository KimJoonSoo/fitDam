<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel= "stylesheet" type="text/css" href="/css/footer.css">
<style>
/* Full-width input fields */
input[type=password].ppp {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.contain {
    padding: 50px;
}

/* The Modal (background) */
.modal 
{
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 300px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}


/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) 
{
    span.psw 
    {
       display: block;
       float: none;
    }
}
</style>

<footer>
<table class="sfoot">
	<tr align="center">
		<td rowspan="6" colspan="2" id="adminA" onclick="document.getElementById('id01').style.display='block';" class="sfoot">fitDam</td>
   		<div id="id01" class="modal">
 			<div class="modal-content animate">
				<div class="contain" style="background-color: white">
					<label>Code&nbsp;</label>
    				<input class="ppp" type="password" placeholder="관리자페이지 이동을 위해 코드를 입력하세요." id="a_code" name="a_code" style="border-radius: 30px;" required>&nbsp;&nbsp;
					<button type="button" onclick="document.getElementById('id01').style.display='none'" id="goAdmin" style="background-color:#d65548; color: white;">이 동</button>
				</div>
  			</div>
		</div>
   		<td colspan="2" class="sfoot" ><p>고 객 센 터 : 0 1 0 - 9 1 5 8 - 5 4 1 5</p></td>
   		<td colspan="2" class="sfoot" ><p>무 통 장 계 좌</p></td>
   		<td rowspan="5" class="sfoot">공지사항</td>
   	</tr>
   	<tr align="center">
   		<td rowspan="2" class="sfoot"><p>운영시간</p></td>
   		<td class="sfoot2">09:00 ~ 18:00</td>
   		<td class="sfoot">예금주</td>
   		<td class="sfoot2">fitDam</td>
   	</tr>
   	<tr align="center">
   		<td class="sfoot2">(주말 및 공휴일 휴무)</td>
   		<td class="sfoot">농협</td>
   		<td class="sfoot2">0000-0000-0000</td>
   	</tr>
   	<tr align="center">
   		<td class="sfoot">점심시간</td>
   		<td class="sfoot2">13:00 ~ 14:00</td>
   		<td rowspan="2" colspan="2" class="sfoot2">
   			<select onchange="window.open(this.options[this.selectedIndex].value,'_blank')">
   				<option selected value="#">인터넷뱅킹바로가기</option>
              	<option value="https://banking.nonghyup.com/nhbank.html">농협</option>
   			</select>
   		</td>
   	</tr>
   	<tr>
   		<td class="sfoot">주소</td>
   		<td class="sfoot2">경기도 안양시 동안구 호계3동</td>
   	</tr>
   	<tr>
   		<td colspan="5" class="sfoot2" style="height: 80px;">
   			<p>상호 : (주)fitDam | 대표 : 김준수 | 사업자등록번호 : 1988-0627 | 소재지 : 경기도 안양시 동안구 호계3동 | TEL : 핏담(010-9158-5415) |</p>
   			<p>정보책임자 : 김준수 | E-mail : chuppachoops@naver.com | Copyright(c) by (주)fitDam. All rights reserved.</p>
   		</td>
   	</tr>
</table>
	
	
<script>
	$(document).ready(function() 
	{
		$('#goAdmin').on("click", function() 
		{
			//alert($("#a_code").val());
			if($("#a_code").val() == "1111")
			{
				location = "/admin/adminLogin/";
			}
			else
			{
				alert("관리자 페이지는 관리자만 사용 가능합니다.");
			}
		});
	});
</script> 
</footer>