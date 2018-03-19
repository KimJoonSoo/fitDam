<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 회원 정보 수정</title>
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
    		<th colspan="2" class="mypage">M E M B E R M O D I F Y &nbsp;<label style="font-size: 10px;">수정하고 싶은 정보를 작성해주세요.</label></th>
    	</tr>
    	
    	<tr align="left">
            <td class="mypage"><label for="u_name">NAME</label></td>
            <td style="padding-left: 15px;"><input id="u_name" name="u_name" type="text" value="${userVO.u_name}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr align="left">
            <td class="mypage"><label for="u_id">ID</label></td> 	
            <td style="padding-left: 15px;">
            	<input id="u_id" type="email" value="${userVO.u_id}" readonly="readonly" maxlength="30" class="mypage"/>
            </td>
        </tr>
       
        <tr align="left">
            <td class="mypage"><label for="u_birthdate">BIRTHDATE</label></td>
            <td style="padding-left: 15px;">
            <c:set var="birth_array" value="${fn:split(userVO.u_birthdate, '-')}"/>
            	<input name="u_birthdate1" id="u_birthdate1" type="text" value="${birth_array[0]}" readonly="readonly" class="mypagep" style="width: 120px"/>&nbsp;-&nbsp;
            	<input name="u_birthdate2" id="u_birthdate2" type="text" value="${birth_array[1]}" readonly="readonly" class="mypagep" style="width: 120px"/>&nbsp;-&nbsp;
            	<input name="u_birthdate3" id="u_birthdate3" type="text" value="${birth_array[2]}" readonly="readonly" class="mypagep" style="width: 120px"/>
            	<input type="hidden" name="u_birthdate" id="u_birthdate"/>
            </td>
        </tr>
        
        <tr align="left">
            <td class="mypage"><label for="u_gender">GENDER</label></td>
            <td style="padding-left: 15px;">
                <input id="man" name="u_gender" type="radio" value="남자" disabled="disabled" <c:if test="${userVO.u_gender == '남자'}">checked</c:if>/>
                <label for="man">남자</label>
                <input id="woman" name="u_gender" type="radio" value="여자" disabled="disabled" <c:if test="${userVO.u_gender == '여자'}">checked</c:if>/>
                <label for="woman">여자</label>
            </td>
        </tr>

		<tr align="left">
            <td class="mypage"><label for="u_addnum">POST NUMBER</label></td>
            <td style="padding-left: 15px;"><input id="u_addnum" name="u_addnum" type="text" value="${userVO.u_addnum}" readonly="readonly" class="mypage"/></td>
        </tr>

		<tr align="left">
            <td class="mypage"><label for="u_address">ADDRESS</label></td>
            <td style="padding-left: 15px;">
            	<c:set var="address_array" value="${fn:split(userVO.u_address, '/')}"/>
            	<input id="u_add" name="u_addressfront" type="text" value="${address_array[0]}" readonly="readonly" class="mypage" style="width: 350px"/>&nbsp;/&nbsp;
            	<input id="u_adddetail" name="u_addressdetail" type="text" value="${address_array[1]}" readonly="readonly" class="mypage" style="width: 220px"/>
            	<input type="hidden" name="u_address" id="u_address"/>
            </td>
        </tr>
        
		<tr align="left">
            <td class="mypage"><label for="u_phonenum">PHONE</label></td>
            <td style="padding-left: 15px;">
            	<c:set var="phone_array" value="${fn:split(userVO.u_phonenum, '-')}"/>
            	<input id="u_phonenum1" name="u_phonenum1" type="text" maxlength="3" value="${phone_array[0]}" readonly="readonly" class="mypagep" style="width: 120px"/>&nbsp;-&nbsp;
            	<input id="u_phonenum2" name="u_phonenum2" type="text" maxlength="4" value="${phone_array[1]}" readonly="readonly" class="mypagep" style="width: 150px"/>&nbsp;-&nbsp;
            	<input id="u_phonenum3" name="u_phonenum3" type="text" maxlength="4" value="${phone_array[2]}" readonly="readonly" class="mypagep" style="width: 150px"/>
            	<input type="hidden" name="u_phonenum" id="u_phonenum"/>
            </td>
        </tr>
        
		<tr align="left">
            <td class="mypage"><label for="u_regdate">REGDATE</label></td>
            <td style="padding-left: 15px;"><input id="u_regdate" name="u_regdate" type="text" value="${userVO.u_regdate}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr align="left">
            <td class="mypage""><label for="g_code">GRADE</label></td>
            <td style="padding-left: 15px;">
				<select name="g_code" id="g_code" style="width: 250px; border-radius: 10px; padding-left: 15px; padding-right: 10px; height: 30px;">
					<option>${userVO.g_code}</option>
					<option value="W">W</option>
					<option value="B">B</option>
					<option value="G">G</option>
					<option value="D">D</option>
				</select>
			</td>
        </tr>
        
        <tr align="left">
            <td class="mypage"><label for="u_point">POINT</label></td>
            <td style="padding-left: 15px;"><input id="u_point" name="u_point" type="text" value="${userVO.u_point}" onKeyPress="return numkeyCheck(event)" numberonly="true" class="mypage"/></td>
        </tr>

		<tr>
			<td colspan="2" style="background-color: #F2F2F2; height: 50px;" align="center">
				<input type="submit" id="amodifyFit" value="Modify" class="mypages"/>
		    	&nbsp; &nbsp; &nbsp;
		    	<input type="button" id="agoMypage" value="Cancle" class="mypages"/>
			</td>
		</tr>
    </table>
</form>

</section>
<%@include file="../include/footer.jsp"%>
</div>
</body>

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
	$('#agoMypage').on("click", function() 
	{					//get 방식에는 이런식으로 주소뒤에 붙는 값들을 붙여준다
		self.location = "/admin/auserInfo?page=${cri.page}&perPageNum=${cri.perPageNum}"
				 	+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&u_id=${userVO.u_id}";
	});
	
	$('#formf').on('submit', function()
	{
		var u_birthdate = $('#u_birthdate1').val() + "-" +$('#u_birthdate2').val() + "-" + $('#u_birthdate3').val();
		var u_phonenum = $('#u_phonenum1').val() + "-" + $('#u_phonenum2').val() + "-" + $('#u_phonenum3').val();
		var u_address = $('#u_add').val() + "/" + $('#u_adddetail').val();
		
		$('#u_birthdate').val(u_birthdate);
		$('#u_phonenum').val(u_phonenum);
		$('#u_address').val(u_address);
		
		if($.trim($("#g_code").val()) == "")
	    {
			alert("회원등급을 입력해주세요");
			$("#g_code").focus();
			return false;
	    }
		
		else if ($.trim($("#u_point").val()) == "")
		{
			alert("포인트를 적립해주세요");
			$("#u_point").focus();
			return false;
	    }
		
		return true;
	});
});
</script>
</html>