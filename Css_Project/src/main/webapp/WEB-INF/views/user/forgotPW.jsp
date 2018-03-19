<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>Search Password</title>
</head>
<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<section>
<br/>
<br/>
<br/>
<br/>
<br/>
<form name="formf" method="post" id="formf">
    <table class="ssearch">
    	<tr class="slogin">
    		<th class="stitle" colspan="3">SEARCH &nbsp; PASSWORD &nbsp; [USER]</th>
    	</tr>
    	<tr class="slogin">
    		<th class="ssearch">ID</th>
    		<td class="ssearch"><input class="ssearch" id="u_id" name="u_id" type="email" placeholder="example@email.com"/></td>
    		<td rowspan="3" class="ssearch2"><input class="ssubmitbtn" type="submit" id="searchPW" value="SEARCH"/></td>
    	</tr>
    	<tr class="slogin">
    		<th class="ssearch">NAME</th>
    		<td class="ssearch"><input class="ssearch" id="u_name" name="u_name" type="text" width="300px"/></td>
    		<td class="ssearch"></td>
    	</tr>
    	<tr class="slogin">
    		<th class="slogin">PHONE</th>
    		<td class="login">
    			<input class="ssearch" id="u_phonenum1" name="u_phonenum1" type="text" maxlength="3" placeholder="010" onKeyPress="return numkeyCheck(event)" numberonly="true" style="width: 85px"/>-
            	<input class="ssearch" id="u_phonenum2" name="u_phonenum2" type="text" maxlength="4" placeholder="xxxx" onKeyPress="return numkeyCheck(event)" numberonly="true"  style="width: 115px"/>-
            	<input class="ssearch" id="u_phonenum3" name="u_phonenum3" type="text" maxlength="4" placeholder="xxxx" onKeyPress="return numkeyCheck(event)" numberonly="true"  style="width: 115px"/>
            	<input type="hidden" name="u_phonenum" id="u_phonenum"/>
            </td>
    	</tr>
    </table>
</form>
</section>
<%@include file="../include/footer.jsp"%>
</div>

<script>
function numkeyCheck(e) 
{ 
	var keyValue = event.keyCode; 
	
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
	{	
		return true; 
	}
	
	else return false; 
} 

$(document).on("keyup", "input:text[numberonly]", function() 
{
	$(this).val( $(this).val().replace(/[^0-9]/gi,""));	// 숫자 이외의 값을 입력하면 ""으로 변환하도록 함
});
</script>
<script>
var result = '${msg}';

if(result == "sendmail")
{
	alert("회원님의 메일로 임시 비밀번호가 발송되었습니다.");
	location = "/user/userLogin/";
}

else if(result == "nosend")
{
	alert("찾는 정보가 정확하지 않습니다.");
}

$(document).ready(function()
{
	$('#formf').on('submit', function()
	{
		//event.preventdefault(); 기존의 효과를 안쓰게 하기 위함
		
		// 나눠진 데이터를 합치는 과정
		var u_phonenum = $('#u_phonenum1').val() + "-" + $('#u_phonenum2').val() + "-" + $('#u_phonenum3').val();
		
		$('#u_phonenum').val(u_phonenum);
			
		// 공백일 경우 유효성 검사
		
		if($.trim($("#u_id").val()) == "")
	    {
			alert("아이디 입력해주세요");
			$("#u_id").focus();
			return false;
	    }
		else if($.trim($("#u_name").val()) == "")
	    {
			alert("이름을 입력해주세요");
			$("#u_name").focus();
			return false;
	    }
		else if ($.trim($("#u_phonenum1").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#u_phonenum1").focus();
			return false;
		}
		else if ($.trim($("#u_phonenum2").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#u_phonenum2").focus();
			return false;
		}
		else if ($.trim($("#u_phonenum3").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#u_phonenum3").focus();
			return false;
		}
		
		
		$('#searchPW').on("click", function() 
		{
			location = "/user/usersearchPW/";
		});

		return true;
	});
});
</script>
<script>
	
</script>
</body>
</html>