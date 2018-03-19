<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 : 유저 목록 관리</title>
</head>

<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section class="list">
<br/><br/><br/><br/><br/>
<div class="body">
	<div class="row">
		<div class="box">
		<form role="form" action="modifyPage" method="post">
		<input 	type='hidden' 	name='u_id' 		value="$(this).attr("data-u_id")"> 
		<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
		<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
		<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
		<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
		</form>
		<div class="box-body">
		<table class="lliisstt">
			<tr>
				<th colspan="8" class="lliisstttitle">F I T D A M &nbsp;&nbsp; U S E R L I S T</th>
			<tr>
			
			<tr>
				<th class="lliisstt" style="width: 250px">ID</th>
				<th class="lliisstt" style="width: 150px">NAME</th>
				<th class="lliisstt" style="width: 100px">GENDER</th>
				<th class="lliisstt" style="width: 250px">PHONE</th>
				<th class="lliisstt" style="width: 200px">REGDATE</th>
				<th class="lliisstt" style="width: 100px">GRADE</th>
				<th class="lliisstt" style="width: 100px">VERIFY</th> <!-- 미인증 계정 삭제 위해 불러오기 -->
				<th class="lliisstt" style="width: 100px">DEL</th>
			</tr>

			<c:forEach items="${auserList}" var="userVO">
				<tr>
					<td class="lliisstt" style="width: 250px"><a class="lliisstt" href='/admin/auserInfo${pageMaker.makeSearch(pageMaker.cri.page) }&u_id=${userVO.u_id}'>${userVO.u_id}</a></td>
					<td class="lliisstt" style="width: 150px">${userVO.u_name}</td>
					<td class="lliisstt" style="width: 100px">${userVO.u_gender}</td>
					<td class="lliisstt" style="width: 250px">${userVO.u_phonenum}</td>
					<td class="lliisstt" style="width: 200px">${userVO.u_regdate}</td>
					<td class="lliisstt" style="width: 100px">${userVO.g_code}</td>
					<td class="lliisstt" style="width: 100px">${userVO.u_verify}</td>			
					<td class="lliisstt" style="width: 100px" align="center"><input type="button" class="deldel" data-u_id="${userVO.u_id}" value="DEL"></td>
				</tr>
			</c:forEach>
				
				<tr align="center">
					<td colspan="4" align="center" style="height: 80px; text-align: center; margin: 0 auto; background-color: #f2f2f2; border-radius: 10px;">
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
					<td colspan="4" align="center" style="border: 1px solid black; border-radius: 10px;">
						<div class="box-body">
							<select name="searchType" style="height: 30px; width: 100px; background-color: #f2f2f2; text-align: center;">
								<option value="all"
									<c:out value="${cri.searchType == null ? 'selected':''}"/>>-----
								</option>
								<option value="n"
									<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>NAME
								</option>
								<option value="i"
									<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>ID
								</option>
								<option value="g"
									<c:out value="${cri.searchType eq 'g'?'selected':''}"/>>GRADE
								</option>
								<option value="v"
									<c:out value="${cri.searchType eq 'v'?'selected':''}"/>>VERIFY
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
<%@include file="../include/adminfooter.jsp"%>
</div>
</body>

<script>
$(document).ready(function() 
{
	$('#searchBTN').on("click",	function(event) 
	{
		location = "/admin/auserList"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" 
					+ $('#keywordInput').val();
	});
	
	$('.deldel').on("click", function(event) 
	{		
		if (confirm("정말 삭제 하시겠습니까??") == true)
		{
			//location = "/admin/auserWithdraw/?u_id="+ $(this).attr("data-u_id");
			location = "/admin/auserWithdraw/${pageMaker.makeSearch(pageMaker.cri.page)}&u_id=" + $(this).attr("data-u_id");
			alert("삭제가 완료되었습니다.");
		}
		else
		{
			return false;
		}
	});
});
</script>
</html>