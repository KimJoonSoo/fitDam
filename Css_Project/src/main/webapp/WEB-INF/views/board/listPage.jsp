<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>일반게시판</title>
</head>

<body>
<div>
<%-- <jsp:include page="../include/header.jsp"></jsp:include> --%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<section class="content">
<br/>
<br/>
<br/>
<div class="body">
	<div class="row">
		<div class="box">
			<div class="box-body">
				<table class="boardTable">
					<tr>
						<th colspan="4" style="height: 60px; font-size: 40px; text-align: center;">fitDam's Funny Board</th>
						<th style="background-color:#F2F2F2; text-align: center; border-radius: 8px;" >
							<%-- 새 글 입력 버튼 --%>
			    			<button id='newBtn' class="boardTable">새글</button>
			    		</th>
					</tr>
					
					<%-- board list 제목 라인 생성 --%>
					<tr>
						<th class="boardTable" style="width: 70px">N o</th>
						<th class="boardTable" style="width: 360px">T i t l e</th>
						<th class="boardTable" style="width: 220px">W r i t e r</th>
						<th class="boardTable" style="width: 150px">R e g d a t e</th>
						<th class="boardTable" style="width: 100px">V i e w</th>
					</tr>
					
					<%-- board list 내용 라인 생성 --%>
					<%-- c:forEach로 중복되는 내용들을 반복 생성 --%>
					<c:forEach items="${listPage}" var="boardVO">
						<tr>
							<td style="background-color:#002266; color: white; width: 70px; border-radius: 8px; height: 45px;">${boardVO.b_no}</td>
							<td class="boardTable"><a class="boardTable" href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&b_no=${boardVO.b_no}'>${boardVO.b_title}</a></td>
							<td class="boardTable"><span class="u_idinfo">${boardVO.u_id}</span></td>
							<td class="boardTable"><fmt:formatDate value="${boardVO.b_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td class="boardTable">${boardVO.b_viewcnt}</td>
						</tr>
					</c:forEach>
					
					<tr align="center">
						<td colspan="3" style="background-color: #f2f2f2; height: 80px; border-radius: 8px;">
							<div class="box-footer">
								<div class="pagination">
									<ul>
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
						<td colspan="2">
							<%-- 검색 타입 설정창 --%>
							<select name="searchType">
							<option value="n"
								<c:out value="${cri.searchType == null ? 'selected':''}"/>>검색분류
							</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목
							</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'i'?'selected':''}"/>>작성자
							</option>
							<option value="tw"
								<c:out value="${cri.searchType eq 'ti'?'selected':''}"/>>제목 or작성자
							</option>
							</select>
							<%-- 키워드 입력창 생성 --%>
							<input type="text" name='keyword' id="keywordInput"	value='${cri.keyword}' placeholder="검색어를 입력하세요."/>
							
							<%-- 검색 버튼 --%>
							<button id='searchBtn' class="boardTable">검색</button>
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
</body>





<%-- 성공시 처리가 완료되었습니다 메시지 출력 --%>
<script>
	var result = '${msg}';

	if (result == 'ADDSUCCESS') 
	{
		alert("글등록이 완료되었습니다.");
	}
	if (result == 'MODSUCCESS') 
	{
		alert("수정이 완료되었습니다.");
	}
	if (result == 'DELSUCCESS') 
	{
		alert("삭제가 완료되었습니다.");
	}
	if (result == 'INSUCCESS') 
	{
		alert("fitDam에 핏 되셨습니다.]");
	}
	if (result == 'INFAIL') 
	{
		alert("fitDam에 다시 핏하세요.");
	}
	if (result == 'OUTSUCCESS')
	{
		alert("로그아웃이 완료되었습니다.");
	}
</script>

<script>
$(document).ready(function() 
{
	$('#searchBtn').on("click",	function(event) 
	{
		location = "/board/listPage"
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
				
	$('#newBtn').on("click", function() 
	{
		location = "/board/writePage";
	});
	
	$('.u_idinfo').on("click", function() 
	{
		//alert("");
	});
});
</script>
</html>