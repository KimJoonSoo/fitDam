<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>

<title>상품 목록</title>


<style>
img {width: 200px; height:150px;}
</style>


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
<div class="body">
	<div class="row">
		<div class="box">
		<form role="form" action="modifyPage" method="post">
		<input 	type='hidden' 	name='p_no' 		value="$(this).attr("data-p_no")"> 
		<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
		<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
		<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
		<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
		<input 	type='hidden' 	name='cat_id'  id="cat_id"	value="${cri.cat_id}">
		</form>
		<div class="box-body">
		<table class="lliisstt">
			<tr>
				<th colspan="6" class="lliisstttitle">P R O D U C T &nbsp;&nbsp;&nbsp; L I S T</th>
			<tr>
			
			<tr>
				<th class="lliisstt" style="width: 150px">CATEGORY</th>
				<th class="lliisstt" style="width: 250px">PHOTO</th>
				<th class="lliisstt" style="width: 200px">P.NO</th>
				<th class="lliisstt" style="width: 200px">P.NAME</th>
				<th class="lliisstt" style="width: 150px">PRICE</th>
				<th class="lliisstt" style="width: 100px">COUNT</th>
			</tr>

			<c:forEach items="${uproductcList}" var="productVO">
				<tr>
					<td class="lliisstt" style="width: 150px">${productVO.cat_id}</td>
					<td class="lliisstt" style="width: 250px"><a class="lliisstt" href='/user/uproductInfo${pageMaker.makeSearch(pageMaker.cri.page) }&p_no=${productVO.p_no}'><img src="/admin/upload/displayFile?fileName=${productVO.p_photo.replace('/s_','/')}"></a></td>
					<td class="lliisstt" style="width: 200px"><a class="lliisstt" href='/user/uproductInfo${pageMaker.makeSearch(pageMaker.cri.page) }&p_no=${productVO.p_no}'>${productVO.p_no}</a></td>
					<td class="lliisstt" style="width: 200px">${productVO.p_name}</td>
					<td class="lliisstt" style="width: 150px"><fmt:formatNumber value="${productVO.p_price}" pattern="###,###,###"/></td>
					<td class="lliisstt" style="width: 100px">${productVO.p_count}</td>
				</tr>
			</c:forEach>
				
				<tr align="center">
					<td colspan="3" align="center" style="height: 80px; text-align: center; margin: 0 auto; background-color: #f2f2f2; border-radius: 10px;">
						<div class="box-footer">
							<div class="pagination" style="background-color: #f2f2f2" >
								<ul class="lliisstt">
									<c:if test="${pageMaker.prev}">
										<span><a href="${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></span>
									</c:if>
						
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<span>
											<a <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/> href="${pageMaker.makeSearch(idx)}">${idx}</a>
										</span>
									</c:forEach>
						
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<span><a href="${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></span>
								</c:if>
								</ul>
							</div>
						</div>
					</td>
					<td colspan="3" align="center" style="border: 1px solid black; border-radius: 10px;">
						<div class="box-body">
							<select id="twoSearch" name="searchType" style="height: 30px; width: 100px; background-color: #f2f2f2; text-align: center;">
								<option value="all"
									<c:out value="${cri.searchType == null ? 'selected':''}"/>>------
								</option>
								<option value="no"
									<c:out value="${cri.searchType eq 'no'?'selected':''}"/>>PRODUCT NO
								</option>
								<option value="n"
									<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>NAME
								</option>
							</select> 
		      
							<input type="text" name='keyword' id="keywordInput" class="lliissttsrc"	value='${cri.keyword}'/>
							<button id='searchBTN' class="lliisstt">Search</button>
						</div>
					</td>
				</tr>
			</table>
			</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
</div>

<script>
$(document).ready(function() 
{
	$('#searchBTN').on("click",	function(event) 
	{
		location = "/user/uproductcList"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("#twoSearch option:selected").val()
					+ "&keyword=" 
					+ encodeURIComponent($('#keywordInput').val())
					+ "&cat_id=${cri.cat_id}";		
	});
});
</script>
	
</body>
</html>