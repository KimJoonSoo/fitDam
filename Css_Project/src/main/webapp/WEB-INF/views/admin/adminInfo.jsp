<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 정보보기</title>
</head>
<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/>
<br/>
<form role="form" action="/admin/alevelModify/" method="get">
    <table class="mypage">
    	<tr>
    		<th colspan="2" class="mypage">[${adminVO.a_name}] 님은 fitDam의 보안담당자</th>
    	</tr>
    	<tr>
            <td class="mypage"><label for="a_name">NAME</label></td>
            <td><input id="a_name" type="text" value="${adminVO.a_name}" readonly="readonly" class="mypage"/></td>
        </tr>
        
		<tr>
            <td class="mypage"><label for="a_id">ID</label></td>
            <td><input id="a_id" name="a_id" type="text" value="${adminVO.a_id}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="a_level">MANAGE-GRADE</label></td>
            <td><input id="a_level" type="text" value="${adminVO.a_level}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="a_phonenum">PHONE</label></td>
            <td><input id="a_phonenum" type="text" value="${adminVO.a_phonenum}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="a_email">EMAIL</label></td>
            <td><input id="a_email" type="text" value="${adminVO.a_email}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
            <td class="mypage"><label for="a_regdate">REGDATE</label></td>
            <td><input id="a_regdate" type="text" value="${adminVO.a_regdate}" readonly="readonly" class="mypage"/></td>
        </tr>
        
		<tr>
            <td class="mypage"><label for="a_recentlogout">RECENT LOGOUT</label></td>
            <td><input id="a_recentlogout" type="text" value="${adminVO.a_recentlogout}" readonly="readonly" class="mypage"/></td>
        </tr>
        
        <tr>
        	<td colspan="2" style="background-color: #F2F2F2; height: 50px;" align="center">
        		<button type="submit" id="modifyInfo" class="mypage">Modify</button>&nbsp;&nbsp;&nbsp;
        		<button type="button" id="useerList" class="mypage">List</button>
        	</td>
        </tr>
    </table>
</form>
</section>
<%@include file="../include/adminfooter.jsp"%>
</div>
</body>

<script>
	$(document).ready(function()
	{
		$('#useerList').on("click", function() 
		{
			location = "/admin/adminList";
		});
	});
</script>

</html>