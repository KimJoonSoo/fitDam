<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>관리자 목록</title>
</head>

<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section class="list">
<br/>
<br/>
<br/>
<div class="body">
	<div class="row">
		<div class="box">
			<div class="box-body">
				<table class="lliisstt">
					<tr>
						<th colspan="5" class="lliisstttitle">F I T D A M &nbsp;&nbsp; A D M I N L I S T</th>
					<tr>
						
					<tr>
						<th class="lliisstt" style="width: 200px">ID</th>
						<th class="lliisstt" style="width: 200px">NAME</th>
						<th class="lliisstt" style="width: 300px">PHONE</th>
						<th class="lliisstt" style="width: 350px">EMAIL</th>
						<th class="lliisstt" style="width: 200px">MANAGE-GRADE</th>
					</tr>

					<c:forEach items="${adminList}" var="adminVO">
						<tr>
							<td class="lliisstt" style="width: 200px"><a class="lliisstt" href='/admin/adminInfo${pageMaker.makeSearch(pageMaker.cri.page) }&a_id=${adminVO.a_id}'>${adminVO.a_id}</a></td>
							<td class="lliisstt" style="width: 200px">${adminVO.a_name}</td>
							<td class="lliisstt" style="width: 300px">${adminVO.a_phonenum}</td>
							<td class="lliisstt" style="width: 350px">${adminVO.a_email}</td>
							<td class="lliisstt" style="width: 200px">${adminVO.a_level}</td>
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
									<select name="searchType" style="height: 30px; width: 100px; background-color: #f2f2f2; text-align: center;">
										<option value="all"
											<c:out value="${cri.searchType == null ? 'selected':''}"/>>-----
										</option>
										<option value="n"
											<c:out value="${cri.searchType eq 'n'?'selected':''}"/>>이름
										</option>
										<option value="i"
											<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>아이디
										</option>
										<option value="l"
											<c:out value="${cri.searchType eq 'l'?'selected':''}"/>>등급
										</option>
									</select> 
				      
									<input type="text" name='keyword' id="keywordInput" class="lliissttsrc"	value='${cri.keyword}'/>
									<button id='searchBTN' class="lliisstt">검색</button>
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
	var result = '${msg}';

	if (result == 'SUCCESS') 
	{
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
$(document).ready(function() 
{
	$('#searchBTN').on("click",	function(event) 
	{
		location = "/admin/adminList"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" 
					+ $('#keywordInput').val();
	});
	<%-- &searchType, &keyword는 SearchCriteria에 있다 --%>
	<%-- $("select option:selected").val() 여기에 선택 값이 저장.   ex) title을 고르면 t가 전송되도록. --%>
	<%-- $('#keywordInput').val() 여기에 검색어 값이 저장. --%>
	<%-- searchType=t&keyword=홍&bno=22    이런 식으로 값이 저장 --%>	
});
</script>
</html>