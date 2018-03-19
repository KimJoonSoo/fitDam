<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 : 상품 정보보기</title>
</head>



<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/>
<br/>
<form role="form" id="pmodifyform" action="/admin/productModify" method="get">
	<input 	type='hidden' 	name='p_no' 		value="${productVO.p_no}"> 
	<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
	<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
	<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
	<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
	
	<table class="splist">
	<tr>
		<th colspan="4" class="splist">[${productVO.p_name}] &nbsp;&nbsp; I N F O</th>
	</tr>
	<tr>
		<td class="splist">CATEGORY 1st</td>
		<td class="splist2">
			<c:set var="cat_array" value="${fn:split(productVO.p_no, '_')}"/>
            <input name="cat_id1" id="cat_id1" type="text" value="${cat_array[0]}" readonly="readonly" class="splist"/>
		</td>
		<td class="splist">CATEGORY 2nd</td>
		<td class="splist2">
			<input name="cat_id2" id="cat_id2" type="text" value="${cat_array[1]}" readonly="readonly" class="splist"/>
		</td>
	</tr>
	<tr>
		<td class="splist">PRODUCT NO</td>
		<td class="splist2" colspan="3">
			<input id="p_no" name="p_no" type="text" class="splist" value="${productVO.p_no}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td class="splist">PRODUCT NAME</td>
		<td class="splist2" colspan="3"><input id="p_name" name="p_name" type="text" class="splist" value="${productVO.p_name}" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT REGDATE</td>
		<td class="splist2" colspan="3"><input id="p_regdate" name="p_regdate" type="text" class="splist" value="${productVO.p_regdate}" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT PRICE</td>
		<td class="splist2"><input id="p_price" name="p_price" type="text" class="splist" value="${productVO.p_price}" readonly="readonly"></td>
		<td class="splist">PRODUCT COUNT</td>
		<td class="splist2"><input id="p_count" name="p_count" type="text" class="splist" value="${productVO.p_count}" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT COLOR</td>
		<td class="splist2"><input id="p_color" name="p_color" type="text" class="splist" value="${productVO.p_color}" readonly="readonly"></td>
		<td class="splist">PRODUCT SIZE</td>
		<td class="splist2"><input id="p_size" name="p_size" type="text" class="splist" value="${productVO.p_size}" readonly="readonly"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT DESC</td>
		<td colspan="3" class="splist2"><div class="proinfodiv">${productVO.p_desc}</div></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT PHOTO</td>
		<td colspan="3" class="splist2"><img src="/admin/upload/displayFile?fileName=${productVO.p_photo}"></td>
	</tr>
	<tr>
		<td colspan="4" align="center" height="60px" style="background-color: #F2F2F2; border-radius: 8px;">
			<input type="button" id="promodifyInfo" value="Modify" class="spbutton"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="productList" value="Cancle" class="spbutton"/>
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
		// 단순히 페이지 넘기는 기능에는 location을 써준다.
		$('#promodifyInfo').on("click", function() 
		{					//get 방식에는 이런식으로 주소뒤에 붙는 값들을 붙여준다
			location = "/admin/productModify?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}" 
					+ "&p_no=${productVO.p_no}";
		});
		/* 
		$('#promodifyInfo').on("click", function() 
		{
			$('#pmodifyform').submit();	// submit은 어떤 정보를 입력해서 전송할 때 사용
		}); */
		$('#productList').on("click", function() 
		{
			self.location = "/admin/productList?page=${cri.page}&perPageNum=${cri.perPageNum}"
				 + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
	});
</script>
</html>