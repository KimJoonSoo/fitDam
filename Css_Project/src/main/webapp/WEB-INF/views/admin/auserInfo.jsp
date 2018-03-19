<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 회원 정보보기</title>
</head>



<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/>
<br/>
<form role="form" id="modifyform" action="/admin/auserModify" method="get">
	<input 	type='hidden' 	name='u_id' 		value="${userVO.u_id}"> 
	<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
	<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
	<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
	<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
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
        		<button type="button" id="amodifyInfo" class="mypage">Modify</button>&nbsp;&nbsp;&nbsp;
        		<button type="button" id="auseerList" class="mypage">List</button>
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
		$('#amodifyInfo').on("click", function() 
		{
			$('#modifyform').submit();
		});
		$('#auseerList').on("click", function() 
		{
			self.location = "/admin/auserList?page=${cri.page}&perPageNum=${cri.perPageNum}"
				 + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
	});
</script>
</html>