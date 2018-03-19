<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>

<title>회원 등록</title>
</head>
<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>

<!-- 전화번호, 주소, 성별 값 넘기는 방법 알아야함 -->

<section>
<br/>
<br/>
<br/>
<br/>
<br/>
<form name="formf" method="post" id="formf">
    <table class="sssregister">
    	<tr>
    		<th colspan="2" class="sssregister">R E G I S T E R&nbsp;<label style="font-size: 12px;">회원가입에 필요한 정보를 작성해주세요.</label></th>
    	</tr>
    	
    	<tr>
            <td class="sssregister"><label for="u_name">NAME</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left"><input id="u_name" name="u_name" type="text" class="sssregister" style="width: 400px;"/></td>
        </tr>
        
        <tr>
            <td class="sssregister"><label for="u_id">ID</label><label style="color:red">*</label></td> 	
            <td style="padding-left: 15px; font-size: 10px;" align="left">
            	<input id="u_id" name="u_id" type="email" placeholder="example@email.com (인증메일 수신가능한 아이디)" maxlength="30" class="sssregister" style="width: 400px;"/>&nbsp;&nbsp;
            	<input type="button" id="u_id_check" name="u_id_check" value="중복확인" class="sssregbutton"/>
            	<input type="hidden" name="idCheck" id="idCheck" value="N" />
            </td>
        </tr>
       
        <tr>
            <td class="sssregister"><label for="u_password">PASSWORD</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px; font-size: 10px;" align="left"><input id="u_password" name="u_password" type="password" placeholder="공백 없는 영문,숫자 포함 8~16자" maxlength="16" class="sssregister" style="width: 400px;"/></td>
        </tr>
        
        <tr>
            <td class="sssregister"><label for="u_repassword">PASSWORD RE</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px; font-size: 10px;" align="left">
            	<input id="u_repassword" name="u_repassword" type="password" placeholder="비밀번호 확인을 위해 한번 더 입력하세요." maxlength="16" class="sssregister" style="width: 400px;"/>&nbsp;
            	<font name="u_passcheck" size="2" color="red"></font>
            </td>
        </tr>
       
        <tr>
            <td class="sssregister"><label for="u_birthdate">BIRTHDATE</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px; font-size: 15px;" align="left">
            	<input name="u_birthdate1" id="u_birthdate1" type="text" placeholder="YYYY" maxlength="4" onKeyPress="return numkeyCheck(event)" numberonly="true" class="sssregister" style="width: 130px;"/>-
            	<input name="u_birthdate2" id="u_birthdate2" type="text" placeholder="MM" maxlength="2" onKeyPress="return numkeyCheck(event)" numberonly="true" class="sssregister" style="width: 110px;"/>-
            	<input name="u_birthdate3" id="u_birthdate3" type="text" placeholder="DD" maxlength="2" onKeyPress="return numkeyCheck(event)" numberonly="true" class="sssregister" style="width: 110px;"/> ex) 2000-03-07
            	<input type="hidden" name="u_birthdate" id="u_birthdate"/>
            </td>
        </tr>
        
        <tr>
            <td class="sssregister">
                <label for="u_gender">GENDER</label><label style="color:red">*</label>
            </td>
            <td style="padding-left: 15px;" align="left">
                <input id="man" name="u_gender" type="radio" value="남자"/>
                <label for="man">남자</label>
                <input id="woman" name="u_gender" type="radio" value="여자"/>
                <label for="woman">여자</label>
            </td>
        </tr>

		<tr>
            <td class="sssregister"><label for="u_addnum">POST NUMBER</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left"><input id="u_addnum" name="u_addnum" type="text" placeholder="우편번호" onclick="u_execDaumPostcode()" class="sssregister" style="width: 200px"/>&nbsp;&nbsp;<input type="button" id="u_addnum_check" onclick="u_execDaumPostcode()" value="우편번호검색" class="sssregbutton"/></td>
        </tr>

		<tr>
            <td class="sssregister"><label for="u_address">ADDRESS</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left">
            	<input id="u_add" name="u_addressfront" type="text" placeholder="도로명주소 or 지번주소" class="sssregister" style="width: 330px"/>&nbsp;/&nbsp;
            	<input id="u_adddetail" name="u_addressdetail" type="text" placeholder="상세 주소를 입력해주세요." class="sssregister" style="width: 180px"/>
            	<input type="hidden" name="u_address" id="u_address"/>
            </td>
        </tr>
        
		<tr>
            <td class="sssregister"><label for="u_phonenum">PHONE</label><label style="color:red">*</label></td>
            <td style="padding-left: 15px;" align="left">
            	<input id="u_phonenum1" name="u_phonenum1" type="text" maxlength="3" placeholder="010"  onKeyPress="return numkeyCheck(event)" numberonly="true" class="sssregister" style="width: 100px"/>-
            	<input id="u_phonenum2" name="u_phonenum2" type="text" maxlength="4" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)" numberonly="true" class="sssregister" style="width: 125px"/>-
            	<input id="u_phonenum3" name="u_phonenum3" type="text" maxlength="4" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)"  numberonly="true" class="sssregister" style="width: 125px"/>
            	<input type="hidden" name="u_phonenum" id="u_phonenum"/>
            </td>
        </tr>
        
        <tr>
            <td class="sssregister"><label for="interest">FAVORITE<br/>(미선택, 중복가능)</label></td>
            <td style="padding-left: 15px;" align="left">
                <input id="u_interest1" type="checkbox" />&nbsp;OUTER <input id="u_interest3" type="checkbox" />&nbsp;TOP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="u_interest5" type="checkbox" />&nbsp;BOTTOM 
                <br/>
                <input id="u_interest2" type="checkbox" />&nbsp;BAG &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="u_interest4" type="checkbox" />&nbsp;SHOES <input id="u_interest6" type="checkbox" />&nbsp;ACCESSORY
            </td>
        <tr/>

		<tr>
			<td colspan='2' align="center" height="60px" style="background-color: #F2F2F2;">
				<input type="submit" id="registFit" value="Regist FITDAM" class="sssregbutton"/>
		    	&nbsp; &nbsp; &nbsp;
		    	<input type="reset" id="goHome" value="Cancle" class="sssregbutton"/>
			</td>
		</tr>
    </table>
</form>
</section>
<%@include file="../include/footer.jsp"%>
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
	// 아이디 중복검사	
	$('#u_id_check').on('click', function()
    {     
    	// 아이디 항목이 빈칸일경우
    	if($('#u_id').val() == "")
    	{
    		alert("아이디를 입력하세요.");
    		$('#u_id').focus();
    		return false;
    	}
    	
    	// 아이디 형태를 이메일 형식으로 안 할 경우 알림창
    	// 제일 뒤에 i의 의미는 대소문자를 무시한다는 뜻
    	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    	
    	if(!re.test($('#u_id').val()))
    	{
    		alert("아이디 형식이 잘못되었습니다.");
    		$('#u_id').focus();
    		return false;
    	}
        
    	$.ajax({
            type: 'POST',
            url: '/user/useridCheck',
            data: 
            {
                "u_id" : $('#u_id').val()
            },
            
            success: function(data)
            {
                if($.trim(data) == "true")
                {
                    alert("사용 가능한 아이디 입니다");
                    $('#idCheck').val("Y");
                    //duplicate = true;
                }
                
                else if($.trim(data) == "false")
                {
                    alert("이미 사용중인 아이디 입니다");
                    //duplicate = false;
                }
            }
        });
    }); 
	
	
	
	// 비밀번호 확인
	$('#u_password').keyup(function()
	{
   		$('font[name=u_passcheck]').text('');
	}); //#user_pass.keyup

	$('#u_repassword').keyup(function()
	{
   		if($('#u_password').val()!=$('#u_repassword').val())
   		{
    		$('font[name=u_passcheck]').text('');
    		$('font[name=u_passcheck]').html("비밀번호가 일치하지 않습니다.");
   		}
   		else
   		{
    		$('font[name=u_passcheck]').text('');
    		$('font[name=u_passcheck]').html("비밀번호가 일치합니다.");
   		}
  	});

	
	
	
	// 가입하기 위한 유효성 검사
	$('#formf').on('submit', function()
	{
		//event.preventdefault(); 기존의 효과를 안쓰게 하기 위함
		
		// 나눠진 데이터를 합치는 과정
		var u_birthdate = $('#u_birthdate1').val() + "-" + $('#u_birthdate2').val() + "-" + $('#u_birthdate3').val();
		var u_phonenum = $('#u_phonenum1').val() + "-" + $('#u_phonenum2').val() + "-" + $('#u_phonenum3').val();
		var u_address = $('#u_add').val() + "/" + $('#u_adddetail').val();
		
		$('#u_birthdate').val(u_birthdate);
		$('#u_phonenum').val(u_phonenum);
		$('#u_address').val(u_address);
		
		
		// 공백일 경우 유효성 검사
		
		if($.trim($("#u_name").val()) == "")
	    {
			alert("이름을 입력해주세요");
			$("#u_name").focus();
			return false;
	    }
		else if($.trim($("#u_id").val()) == "")
	    {
			alert("아이디를 입력해주세요");
			$("#u_id").focus();
			return false;
	    }
 		else if($('#idCheck').val() == "N")
		{
			alert("아이디 중복체크를 해주세요");
			$("#u_id").focus();
			return false;
		}
		else if ($.trim($("#u_password").val()) == "")
		{
			alert("비밀번호를 입력해주세요");
			$("#u_password").focus();
			return false;
		}
		else if ($("#u_password").val().length < 8 || $("#u_password").val().length > 16)
	    {
			alert("비밀번호는 8~16자를 입력해주세요.");
			return false;
	    }
		else if ($.trim($("#u_repassword").val()) == "")
		{
			alert("비밀번호 확인을 해주세요");
			$("#u_repassword").focus();
			return false;
		}
		else if($("#u_password").val() != $("#u_repassword").val())
		{
			alert("비밀번호가 일치하지 않습니다. 확인해주세요.");
			$("#u_repassword").focus();
			return false;
		}
		else if ($.trim($("#u_birthdate1").val()) == "")
		{
			alert("출생년도를 입력해주세요.");
			$("#u_birthdate1").focus();
			return false;
		}
		else if ($("#u_birthdate1").val().length != 4)
	    {
			alert("출생년도는 YYYY 형태로 입력해주세요");
			return false;
	    }
		else if ($.trim($("#u_birthdate2").val()) == "")
		{
			alert("출생한 월을 입력해주세요.");
			$("#u_birthdate2").focus();
			return false;
		}
		else if ($("#u_birthdate2").val().length != 2)
	    {
			alert("출생한 월은 MM 형태로 입력해주세요");
			return false;
	    }
		else if ($.trim($("#u_birthdate3").val()) == "")
		{
			alert("출생일자를 입력해주세요.");
			$("#u_birthdate3").focus();
			return false;
		}
		else if ($("#u_birthdate3").val().length != 2)
	    {
			alert("출생일자는 DD 형태로 입력해주세요");
			return false;
	    }
		else if ($("#man").is(':checked') == false && $("#woman").is(':checked') == false) 
		{
	    	alert("성별을 선택해주세요");
	    	return false;
		}
		else if ($.trim($("#u_addnum").val()) == "")
		{
			alert("우편번호를 입력해주세요");
			$("#u_addnum").focus();	// addnum 안되면 postcode로 바꾸기
			return false;
		}
		else if ($.trim($("#u_add").val()) == "")
		{
			alert("도로명(또는 지번) 주소를 입력해주세요");
			$("#u_add").focus();
			return false;
		}
		else if ($.trim($("#u_adddetail").val()) == "")
		{
			alert("상세주소를 입력해주세요");
			$("#u_adddetail").focus();
			return false;
		}
		else if ($.trim($("#u_phonenum1").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#u_phonenum1").focus();
			return false;
		}
		else if ($("#u_phonenum1").val().length != 3)
	    {
			alert("첫 세자리 번호를 입력해주세요");
			return false;
	    }
		else if ($.trim($("#u_phonenum2").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#u_phonenum2").focus();
			return false;
		}
		else if (($("#u_phonenum2").val().length != 3) && ($("#u_phonenum2").val().length != 4))
	    {
			alert("가운데 세자리 또는 네자리 번호를 입력해주세요");
			return false;
	    }
		else if ($.trim($("#u_phonenum3").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#u_phonenum3").focus();
			return false;
		}
		else if ($("#u_phonenum3").val().length != 4)
	    {
			alert("마지막 네자리 번호를 입력해주세요");
			return false;
	    }
		
		// 정상적으로 값이 넘어갈 경우 true
		return true;
	});
});
</script>
<!-- 여러개의 데이터를 하나로 모으는 기능 -->

<!-- 우편번호 레이어로 넣기 -->
<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
	<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer"
		style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1; width: 5%; height: auto;"
		onclick="closeDaumPostcode()" alt="X"/>
</div>
<!-- 우편번호 레이어로 넣기 -->
	
<!-- 우편번호검색기능 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    // 우편번호검색 화면을 넣을 element layer 방식
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() 
    {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function u_execDaumPostcode() 
    {
        new daum.Postcode
        ({
        	// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            oncomplete: function(data) 
            {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; 		 // 조합형 주소 변수 기본형 공백

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R')
                {
                    // 해당 주소명이 있을 경우 추가한다.
                    if(data.bname !== '')
                    {
                        extraAddr += data.bname;	// 공백 + 검색한 주소명
                    }
                    
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== '')
                    {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('u_addnum').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('u_add').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                closeDaumPostcode();
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);	// open 기능 대신 embed를 사용 (몇몇 Webview기반 브라우저의 window.open 미대응 때문에 embed 사용 추천)

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition()
    {
        var width = 500; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 항상 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 우편번호검색기능 -->
	
</body>
</html>