<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 정보 수정</title>
</head>
<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/><br/><br/><br/><br/>
<form name="formf" method="post" id="formf">
    <table class="mypage">
    	<tr align="center">
    		<th colspan="2"  class="mypage">A D M I N M O D I F Y &nbsp;<label style="font-size: 10px;">수정하고 싶은 정보를 작성해주세요.</label></th>
    	</tr>
    	
    	<tr align="left">
            <td class="mypage"><label for="a_name">NAME</label></td>
            <td style="padding-left: 20px;"><input id="a_name" name="a_name" type="text" value="${adminVO.a_name}" class="mypage"/></td>
        </tr>
        
        <tr align="left">
            <td class="mypage"><label for="a_id">ID</label></td> 	
            <td style="padding-left: 20px;">
            	<input id="a_id" name="a_id" type="text" value="${adminVO.a_id}" readonly="readonly" maxlength="30" class="mypage"/>
            </td>
        </tr>
       
        <tr align="left">
            <td class="mypage"><label for="a_level">MANAGE-GRADE</label></td>
            <td style="padding-left: 20px;"><input id="a_level" name="a_level" type="text" value="${adminVO.a_level}" readonly="readonly" class="mypage"/></td>
        </tr>
       
        <tr align="left">
            <td class="mypage"><label for="a_password">PASSWORD</label></td>
            <td style="padding-left: 20px;"><input id="a_password" name="a_password" type="password" value="${adminVO.a_password}" placeholder="공백 없는 영문,숫자 포함 8~16자" maxlength="16" class="mypage2"/></td>
        </tr>
        
        <tr align="left">
            <td class="mypage"><label for="a_repassword">PASSWORD RE</label></td>
            <td style="padding-left: 20px;">
            	<input id="a_repassword" name="a_repassword" type="password" value="${adminVO.a_password}" placeholder="비밀번호 확인을 위해 한번 더 입력하세요." maxlength="16" class="mypage2"/>&nbsp;
            	<font name="a_passcheck" size="2" color="BLUE"></font>
            </td>
        </tr>
        
		<tr align="left">
            <td class="mypage"><label for="a_phonenum">PHONE</label></td>
            <td style="padding-left: 20px;">
            	<c:set var="phone_array" value="${fn:split(adminVO.a_phonenum, '-')}"/>
            	<input id="a_phonenum1" name="a_phonenum1" type="text" maxlength="3" value="${phone_array[0]}" placeholder="010"  onKeyPress="return numkeyCheck(event)" numberonly="true" class="mypagep" style="width: 120px"/>&nbsp;-&nbsp;
            	<input id="a_phonenum2" name="a_phonenum2" type="text" maxlength="4" value="${phone_array[1]}" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)" numberonly="true" class="mypagep" style="width: 150px"/>&nbsp;-&nbsp;
            	<input id="a_phonenum3" name="a_phonenum3" type="text" maxlength="4" value="${phone_array[2]}" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)"  numberonly="true" class="mypagep" style="width: 150px"/>
            	<input type="hidden" name="a_phonenum" id="a_phonenum"/>
            </td>
        </tr>
        
		<tr align="left">
            <td class="mypage"><label for="a_regdate">REGDATE</label></td>
            <td style="padding-left: 20px;"><input id="a_regdate" name="a_regdate" type="text" value="${adminVO.a_regdate}" readonly="readonly" class="mypage"/></td>
        </tr>

		<tr align="left">
			<td colspan="2" style="background-color: #F2F2F2; height: 50px;" align="center">
				<input type="submit" id="modifyFit" value="Modify" class="mypages"/>
		    	&nbsp; &nbsp; &nbsp;
		    	<input type="button" id="goMypage" value="Cancle" class="mypages"/>
			</td>
		</tr>
    </table>
</form>

</section>
<%@include file="../include/adminfooter.jsp"%>
</div>
</body>

<!-- 수정할 때 합쳐진 데이터를 나누는 기능 -->
<script>

</script>
<!-- 수정할 때 합쳐진 데이터를 나누는 기능 -->

<!-- 숫자만 입력 가능한 기능 -->
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
<!-- 숫자만 입력 가능한 기능 -->

<!-- 수정 후 다시 데이터를 합치는 기능 -->
<script>
$(document).ready(function()
{
	$('#goMypage').on("click", function() 
	{
		location = "/admin/adminMypage";
	});
	
	$('#formf').on('submit', function()
	{
		var a_phonenum = $('#a_phonenum1').val() + "-" + $('#a_phonenum2').val() + "-" + $('#a_phonenum3').val();
		
		$('#a_phonenum').val(a_phonenum);
		
		
		if($.trim($("#a_name").val()) == "")
	    {
			alert("이름을 입력해주세요");
			$("#a_name").focus();
			return false;
	    }

		else if ($.trim($("#a_password").val()) == "")
		{
			alert("비밀번호를 입력해주세요");
			$("#a_password").focus();
			return false;
		}
		
		else if ($("#a_password").val().length < 8 || $("#a_password").val().length > 16)
	    {
			alert("비밀번호는 8~16자를 입력해주세요.");
			return false;
	    }
		
		else if ($.trim($("#a_repassword").val()) == "")
		{
			alert("비밀번호 확인을 해주세요");
			$("#a_repassword").focus();
			return false;
		}
		else if ($("#a_password").val() != $("#a_repassword").val())
		{
			alert("비밀번호가 일치하지 않습니다. 확인해주세요.");
			$("#a_password").focus();
			return false;
		}
		else if ($.trim($("#a_phonenum1").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#a_phonenum1").focus();
			return false;
		}
		else if ($("#a_phonenum1").val().length != 3)
	    {
			alert("첫 세자리 번호를 입력해주세요");
			return false;
	    }
		else if ($.trim($("#a_phonenum2").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#a_phonenum2").focus();
			return false;
		}
		else if (($("#a_phonenum2").val().length != 3) && ($("#a_phonenum2").val().length != 4))
	    {
			alert("가운데 세자리 또는 네자리 번호를 입력해주세요");
			return false;
	    }
		else if ($.trim($("#a_phonenum3").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#a_phonenum3").focus();
			return false;
		}
		else if ($("#a_phonenum3").val().length != 4)
	    {
			alert("마지막 네자리 번호를 입력해주세요");
			return false;
	    }
		
		return true;
	});
});
</script>

<!-- 비밀번호 , 비밀번호 확인 일치 기능 -->
<script>
$(function()
{
	$('#a_password').keyup(function()
	{
   		$('font[name=a_passcheck]').text('');
	}); //#user_pass.keyup

	$('#a_repassword').keyup(function()
	{
   		if($('#a_password').val()!=$('#a_repassword').val())
   		{
    		$('font[name=a_passcheck]').text('');
    		$('font[name=a_passcheck]').html("비밀번호가 일치하지 않습니다.");
   		}
   		else
   		{
    		$('font[name=a_passcheck]').text('');
    		$('font[name=a_passcheck]').html("비밀번호가 일치합니다.");
   		}
  	});
});
</script>
<!-- 비밀번호 , 비밀번호 확인 일치 기능 -->

</html>