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
<br/>
<br/>
<form name="formf" method="post" id="formf">
    <table class="mypage">
    	<tr>
    		<th colspan="2" class="mypage">L E V E L M O D I F Y</th>
    	</tr>
    	
    	<tr align="left">
            <td class="mypage"><label for="a_name">NAME</label></td>
            <td style="padding-left: 20px;"><input id="a_name" name="a_name" type="text" value="${adminVO.a_name}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr align="left">
            <td class="mypage"><label for="a_id">ID</label></td> 	
            <td style="padding-left: 20px;">
            	<input id="a_id" type="text" value="${adminVO.a_id}" readonly="readonly" maxlength="30" class="mypage"/>
            </td>
        </tr>
       
        <tr align="left">
            <td class="mypage"><label for="a_level">MANAGE-GRADE</label></td>
            <td style="padding-left: 20px;">
				<select name="a_level" style="width: 500px; border-radius: 8px; height: 30px; padding-left: 15px; padding-right: 5px;">
					<option value="base">${adminVO.a_level}</option>
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
				</select>
			</td>
        </tr>

		<tr align="left">
            <td class="mypage"><label for="a_phonenum">PHONE</label></td>
            <td style="padding-left: 20px;">
            	<c:set var="phone_array" value="${fn:split(adminVO.a_phonenum, '-')}"/>
            	<input id="a_phonenum1" name="a_phonenum1" type="text" maxlength="3" value="${phone_array[0]}" placeholder="010"  onKeyPress="return numkeyCheck(event)" numberonly="true" readonly="readonly" class="mypagep" style="width: 120px"/>&nbsp;-&nbsp;
            	<input id="a_phonenum2" name="a_phonenum2" type="text" maxlength="4" value="${phone_array[1]}" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)" numberonly="true" readonly="readonly" class="mypagep" style="width: 150px"/>&nbsp;-&nbsp;
            	<input id="a_phonenum3" name="a_phonenum3" type="text" maxlength="4" value="${phone_array[2]}" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)"  numberonly="true" readonly="readonly" class="mypagep" style="width: 150px"/>
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
		return true;
	});
});
</script>
</html>