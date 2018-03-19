<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>

<title>관리자 등록</title>
</head>
<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>

<section>
<br/>
<br/>
<form name="formf" method="post" id="formf">
    <table class="sssregister">
    	<tr align="center">
    		<th colspan="2" class="sssregister">A D M I N R E G I S T E R &nbsp;<label style="font-size: 10px;">등록에 필요한 정보를 작성해주세요.</label></th>
    	</tr>
    	
    	<tr>
            <td class="sssregister"><label for="a_name">NAME</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left"><input id="a_name" name="a_name" type="text" class="sssregister" style="width: 400px"/></td>
        </tr>
        
        <tr>
            <td class="sssregister"><label for="a_id">ID</label><label style="color:red">*</label></td> 	
            <td style="padding-left: 15px;" align="left"><!-- 사용자는 이메일 형식을 쓰지만 관리자는 메일형식이 아닌 일반형식의 아이디를 쓰도록 한다 -->
            	<input id="a_id" name="a_id" type="text" placeholder="사용 할 아이디를 입력해 주세요." maxlength="20" class="sssregister" style="width: 400px"/>&nbsp;&nbsp;
            	<input type="button" id="a_id_check" name="a_id_check" value="중복확인" class="sssregbutton"/>
            	<input type="hidden" name="idCheck" id="idCheck" value="N" />
            </td>
        </tr>
       
        <tr>
            <td class="sssregister"><label for="a_password">PASSWORD</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left"><input id="a_password" name="a_password" type="password" placeholder="공백 없는 영문,숫자 포함 8~16자" maxlength="16" class="sssregister" style="width: 400px"/></td>
        </tr>
        
        <tr>
            <td class="sssregister"><label for="a_repassword">PASSWORD RE</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left">
            	<input id="a_repassword" name="a_repassword" type="password" placeholder="비밀번호 확인을 위해 한번 더 입력하세요." maxlength="16" class="sssregister" style="width: 400px"/>&nbsp;
            	<font name="a_passcheck" size="2" color="GREEN"></font>
            </td>
        </tr>

		<tr>
            <td class="sssregister"><label for="a_phonenum">PHONE</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left">
            	<input id="a_phonenum1" name="a_phonenum1" type="text" maxlength="3" placeholder="010"  onKeyPress="return numkeyCheck(event)" numberonly="true" class="sssregister" style="width: 100px"/>-
            	<input id="a_phonenum2" name="a_phonenum2" type="text" maxlength="4" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)" numberonly="true" class="sssregister" style="width: 125px"/>-
            	<input id="a_phonenum3" name="a_phonenum3" type="text" maxlength="4" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)"  numberonly="true" class="sssregister" style="width: 125px"/>
            	<input type="hidden" name="a_phonenum" id="a_phonenum"/>
            </td>
        </tr>
        
        <tr>
            <td class="sssregister"><label for="a_email">E-MAIL</label><label style="color:red">*</label></td> 	
            <td style="padding-left: 15px;" align="left">
            	<input id="a_email" name="a_email" type="email" placeholder="example@email.com (인증메일 수신가능한 아이디)" maxlength="30" class="sssregister" style="width: 400px"/>
            </td>
        </tr>

		<tr>
			<td colspan='2' align="center" height="60px" style="background-color: #F2F2F2;">
				<input type="submit" id="registFit" value="Regist ADMIN" class="sssregbutton"/>
		    	&nbsp; &nbsp; &nbsp;
		    	<input type="reset" id="goHome" value="Cancle" class="sssregbutton"/>
			</td>
		</tr>
    </table>
</form>
</section>
<%@include file="../include/adminfooter.jsp"%>
</div>

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

<!-- 등록 버튼 누를 시 여러개의 데이터를 하나로 모으는 기능 포함 폼 유효성 검사-->
<script>
$(document).ready(function()
{
	$('#goHome').on("click", function() 
	{
		location = "/admin/adminLogin";
	});
	
	
	// 아이디 중복검사	
	$('#a_id_check').on('click', function()
    {     
    	// 아이디 항목이 빈칸일경우
    	if($('#a_id').val() == "")
    	{
    		alert("아이디를 입력하세요.");
    		$('#a_id').focus();
    		return false;
    	}
    	else if(!($("#a_id").val() >= '0' && $("#a_id").val() <= '9') && !($("#a_id").val() >= 'a' && $("#a_id").val() <= 'z')&&!($("#a_id").val() >= 'A' && $("#a_id").val() <= 'Z'))
    	{
    		alert("아이디는 영대소문자,숫자만 가능해요");
    		$('#a_id').focus();
    		return false;
    	}
    	 
    	$.ajax({
            type: 'POST',
            url: '/admin/adminidCheck',
            data: 
            {
                "a_id" : $('#a_id').val()
            },
            
            success: function(data)
            {
                if($.trim(data) == "true")
                {
                    alert("사용 가능한 아이디 입니다");
                    $('#idCheck').val("Y");
                }
                
                else if($.trim(data) == "false")
                {
                    alert("이미 사용중인 아이디 입니다");
                }
            }
        });
    }); 
	
	
	
	// 비밀번호 확인
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

	
	
	
	// 가입하기 위한 유효성 검사
	$('#formf').on('submit', function()
	{
		//event.preventdefault(); 기존의 효과를 안쓰게 하기 위함
		
		// 나눠진 데이터를 합치는 과정
		var a_phonenum = $('#a_phonenum1').val() + "-" + $('#a_phonenum2').val() + "-" + $('#a_phonenum3').val();
		$('#a_phonenum').val(a_phonenum);
		
		
		// 이메일 형식 유효성 검사
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;	
		
		// 공백일 경우 유효성 검사
		if($.trim($("#a_name").val()) == "")
	    {
			alert("이름을 입력해주세요");
			$("#a_name").focus();
			return false;
	    }
		else if($.trim($("#a_id").val()) == "")
	    {
			alert("아이디를 입력해주세요");
			$("#a_id").focus();
			return false;
	    }
		else if ($("#a_id").val().length < 8 || $("#a_id").val().length > 16)
	    {
			alert("아이디는 8~16자를 입력해주세요.");
			$("#a_id").focus();
			return false;
	    }
		else if (!($("#a_id").val() >= '0' && $("#a_id").val() <= '9') && !($("#a_id").val() >= 'a' && $("#a_id").val() <= 'z')&&!($("#a_id").val() >= 'A' && $("#a_id").val() <= 'Z')) 
		{
            alert("아이디는 대소문자, 숫자만 입력가능합니다.");
            $("#a_id").focus();
 			return false;
		}
 		else if($('#idCheck').val() == "N")
		{
			alert("아이디 중복체크를 해주세요");
			$("#a_id").focus();
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
		else if($.trim($("#a_email").val()) == "")
	    {
			alert("이메일을 입력해주세요");
			$("#a_email").focus();
			return false;
	    }
		else if(!re.test($('#a_email').val()))
    	{
    		alert("이메일 형식이 잘못되었습니다.");
    		$('#a_email').focus();
    		return false;
    	}	
		// 정상적으로 값이 넘어갈 경우 true
		alert("관리자 등록이 완료되었습니다.");
		return true;
	});
});
</script>
<!-- 여러개의 데이터를 하나로 모으는 기능 -->
</body>
</html>