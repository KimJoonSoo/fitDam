<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>회원 정보보기</title>
<style>
/* 탈퇴시 비밀번호를 한번 더 입력받기 위한 폼의 스타일 */
input[type=password].ppp {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button:hover {
    opacity: 0.8;
}

.contain {
    padding: 50px;
}

span.u_password {
    float: right;
    padding-top: 100px;
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
</head>



<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<section>
<br/><br/><br/><br/><br/>
<form role="form" action="modifyPage" method="post">
    <table class="mypage">
    	<tr>
    		<th colspan="2" class="mypage">[${userVO.u_name}] 고객님의 소중한 정보</th>
    	</tr>
    	<tr>
            <td class="mypage"><label for="u_name">NAME</label></td>
            <td><input id="u_name" type="text" value="${userVO.u_name}" readonly="readonly" class="mypage"/></td>
        </tr>
        
		<tr>
            <td class="mypage"><label for="u_id">ID</label></td>
            <td><input id="u_id" type="text" value="${userVO.u_id}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="u_birthdate">BIRTHDATE</label></td>
            <td><input id="u_birthdate" type="text" value="${userVO.u_birthdate}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="u_gender">GENDER</label></td>
            <td><input id="u_gender" type="text" value="${userVO.u_gender}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="u_address">POST NUMBER</label></td>
            <td><input id="u_address" type="text" value="${userVO.u_addnum}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="u_address">ADDRESS</label></td>
            <td><input id="u_address" type="text" value="${userVO.u_address}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="u_phonenum">PHONE</label></td>
            <td><input id="u_phonenum" type="text" value="${userVO.u_phonenum}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="u_regdate">REGDATE</label></td>
            <td><input id="u_regdate" type="text" value="${userVO.u_regdate}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="g_code">GRADE</label></td>
            <td><input id="g_code" type="text" value="${userVO.g_code}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="u_point">POINT</label></td>
            <td><input id="u_point" type="text" value="${userVO.u_point}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
        	<td colspan="2" style="background-color: #F2F2F2; height: 50px;" align="center">
        		<button type="button" id="modifyInfo" class="mypage">M O D I F Y</button>&nbsp;&nbsp;&nbsp;
        		<button type="button" id="useerList" class="mypage">M A I N</button>&nbsp;&nbsp;&nbsp;
        		
        		<button class="mypage" onclick="document.getElementById('id01').style.display='block'">W I T H D R A W</button>
        		
        		<div id="id01" class="modal">
				  <div class="modal-content animate">
					<div class="contain" style="background-color: white">
						<label>Password</label>
				      	<input class="ppp" type="password" placeholder="탈퇴를 위해 비밀번호를 다시 입력해주세요." id="u_password" name="u_password" required>

				      	<button type="button" id="withdraw" style="background-color:#d65548; color: white;">회원탈퇴</button>&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="document.getElementById('id01').style.display='none'" style="background-color:#d65548; color: white;">취 소</button>
					</div>
				  </div>
				</div>
        	</td>
        </tr>
    </table>
</form>

<div>
	<table>
		<tr>
			<th>ORDER LIST</th>
		</tr>
		<tr>
			
		</tr>
	</table>
</div>

</section>
<%@include file="../include/footer.jsp"%>
</div>
</body>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) 
{
    if (event.target == modal) 
    {
        modal.style.display = "none";
    }
}
</script>
<script>
	$(document).ready(function()
	{
		$('#modifyInfo').on("click", function() 
		{
			location = "/user/userModify";
		});
		$('#useerList').on("click", function() 
		{
			location = "/";
		});
		
		var del = false;
		$('#withdraw').on("click", function() 
		{
			if($("#u_password").val() == "")
			{
				alert("탈퇴를 진행 하시려면 올바른 비밀번호를 입력하세요.");
				$("#u_password").focus();
				return false;	
			}
			
			if (confirm("정말 탈퇴 하시겠습니까??") == false)
			{
				// del = true;
				return false;
				
			}
				
			
			var query = {
					  	 	u_password : $("#u_password").val()
				     	};			
			
			$.ajax
			({
				type : "post",
				url : "/user/userwithdrawCheck",
				data: query,
				success: function(data)
				{		    		
					//alert(data);
					//return false;
		    		if(data == 1)
		    		{
		    			alert("정상적으로 탈퇴가 되었습니다.");
		    			location = "/";
		    	    }
		    		else
		    		{
		    	    	alert("비밀번호가 일치하지 않습니다.");
		    	    	$("#u_password").focus();
		    	    }
			   }	
			});
		});
	});
</script>
</html>