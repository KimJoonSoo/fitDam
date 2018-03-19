<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>Search ID</title>
</head>
<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/>
<br/>
<br/>
<br/>
<br/>
<form name="formf" method="post"  id="formf">
    <table class="ssearch">
    	<tr class="slogin">
    		<th class="stitle" colspan="3">S E A R C H &nbsp;&nbsp;&nbsp; I D &nbsp;[ A D M I N ]</th>
    	</tr>
    	<tr class="slogin">
    		<th class="ssearch">NAME</th>
    		<td class="ssearch"><input class="ssearch" id="a_name" name="a_name" type="text"/></td>
    		<td class="ssearch2" rowspan="2"><input class="ssubmitbtn" type="submit" id="searchID" name="searchID" value="SEARCH"/></td>
    	</tr>
    	<tr class="slogin">
    		<th class="ssearch">PHONE</th>
    		<td class="ssearch">
    			<input class="ssearch" id="a_phonenum1" name="a_phonenum1" type="text" maxlength="3" placeholder="010" onKeyPress="return numkeyCheck(event)" numberonly="true" style="width: 85px"/>-
            	<input class="ssearch" id="a_phonenum2" name="a_phonenum2" type="text" maxlength="4" placeholder="xxxx" onKeyPress="return numkeyCheck(event)" numberonly="true"  style="width: 115px"/>-
            	<input class="ssearch" id="a_phonenum3" name="a_phonenum3" type="text" maxlength="4" placeholder="xxxx" onKeyPress="return numkeyCheck(event)" numberonly="true"  style="width: 115px"/>
            	<input type="hidden" name="a_phonenum" id="a_phonenum"/>
            </td>
    	</tr>
    </table>
</form>
</section>
<%@include file="../include/adminfooter.jsp"%>
</div>
</body>

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
var sid = '${sid}';

if(result == "suc")
{
	alert("관리자님의 아이디는 [" + sid  + "] 입니다.");
	location = "/admin/adminLogin/";
}
else if(result == "fai")
{
	alert("찾는 아이디가 없습니다.");
}

$(document).ready(function()
{
	$('#formf').on('submit', function()
	{
		//event.preventdefault(); 기존의 효과를 안쓰게 하기 위함
		
		// 나눠진 데이터를 합치는 과정
		var a_phonenum = $('#a_phonenum1').val() + "-" + $('#a_phonenum2').val() + "-" + $('#a_phonenum3').val();
		
		$('#a_phonenum').val(a_phonenum);
			
		// 공백일 경우 유효성 검사
		
		if($.trim($("#a_name").val()) == "")
	    {
			alert("이름을 입력해주세요");
			$("#a_name").focus();
			return false;
	    }
		else if ($.trim($("#a_phonenum1").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#a_phonenum1").focus();
			return false;
		}
		else if ($.trim($("#a_phonenum2").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#a_phonenum2").focus();
			return false;
		}
		else if ($.trim($("#a_phonenum3").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#a_phonenum3").focus();
			return false;
		}
		
		$('#searchID').on("click", function() 
		{
			location = "/admin/adminsearchID/";
		});
		
		
		return true;
		
	});
	
	
});
</script>
</html>