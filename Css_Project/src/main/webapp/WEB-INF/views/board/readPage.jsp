<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>게시글 읽기</title>
</head>


<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<section class="content">
<br/>
<br/>
<br/>
	<div class="body">
		<div class="row">
			<div class="box">
				<%-- 수정이나 삭제 같은 동작을 했을 경우 원래대로 넘어오기 위한 정보 --%>
				<form role="form" action="modifyPage" method="post">
					<input 	type='hidden' 	name='b_no' 		value="${boardVO.b_no}"> 
					<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
					<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
					<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
					<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
				
				<div class="box-body">
					<table class="boardTable">
						<tr>
							<th class="boardTable" style="width: 150px;">View Count</th>
							<td class="boardTable" style="width: 80px; background-color: #F2F2F2; border-radius: 8px;">${boardVO.b_viewcnt}</td>
							<th style="height: 80px; font-size: 40px;">R e a d &nbsp;&nbsp;&nbsp; B o a r d</th>
						</tr>
						
						<tr>
							<td style="background-color:#002266; color: white; width: 100px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">T i t l e</td>
							<td style="width: 80px; font-size: 30px;">▶</td>
							<td><input type="text" name='b_title' class="form-control" value="${boardVO.b_title}" readonly="readonly" style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;"></td>
						</tr>
						
						<tr>
							<td style="background-color:#002266; color: white; width: 100px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">C o n t e n t s</td>
							<td style="width: 80px; font-size: 30px;">▶</td>
							<td><textarea class="b_content" name="b_content" rows="10" readonly="readonly" style="width: 905px; font-size: 20px; border-radius: 5px; padding : 15px;">${boardVO.b_content}</textarea></td>
						</tr>
						
						<tr>
							<td style="background-color:#002266; color: white; width: 100px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">W r i t e r</td>
							<td style="width: 80px; font-size: 30px;">▶</td>
							<td><input type="text"	name="u_id" class="form-control" value="${boardVO.u_id}" readonly="readonly" style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;"></td>
						</tr>
						
						<tr align="center">
							<td colspan="3" style="height: 80px; background-color: #F2F2F2; border-radius: 8px;">
								<c:if test="${boardVO.u_id == userVO.u_id}">
									<button type="button" id="mod" class="boardTable">Mod</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" id="del" class="boardTable">Del</button>&nbsp;&nbsp;&nbsp;&nbsp;
								</c:if>
								<button type="button" id="alllist" class="boardTable">List</button>
							</td>
						</tr>
					</table>
				</div>		
				</form>
				
			</div>
		</div>
	</div>


<br/><br/><br/>

<div>
<table class="boardTable">
	<tr>
		<th colspan="5" style="height: 80px; font-size: 40px;">[${boardVO.b_no}]'s &nbsp;&nbsp;&nbsp; R e p l y &nbsp;&nbsp;&nbsp; L i s t</th>
	</tr>
	<tr>
		<th class="boardTable" style="width: 150px">Re. N o</th>
		<th class="boardTable" style="width: 350px" colspan="2">Re. T i t l e</th>
		<th class="boardTable" style="width: 350px">Re. W r i t e r</th>
		<th class="boardTable" style="width: 350px">Re. R e g d a t e</th>
	</tr>
	
	<c:choose>
	
	<c:when test="${replyList.size() == 0}">
		<tr>
			<td align="center" colspan="5" style="height: 100px; text-align: center; font-size: 30px;">N o &nbsp;&nbsp;&nbsp; R e p l y</td>
		</tr>
	</c:when>

	<c:otherwise>
		<c:forEach items="${replyList}" var="replyVO">
			<tr>
				<td rowspan="2" style="background-color:#002266; color: white; width: 150px; border-radius: 8px; height: 45px;">${replyVO.re_no}</td>
				<td colspan="2" class="boardTable" style="width: 350px">${replyVO.re_title}</td>
				<td class="boardTable" style="width: 350px">${replyVO.u_id}</td>
				<td class="boardTable" style="width: 350px">${replyVO.re_regdate}</td>
			</tr>
			<tr>
				<th class="boardTable" style="width: 300px">Re. Contents</th>
				<td colspan="3"><textarea class="b_content" name="b_content" rows="3" readonly="readonly" style="width: 800px; font-size: 20px; border-radius: 5px; padding : 15px;">${replyVO.re_content}</textarea></td>
			</tr>
		</c:forEach>
	</c:otherwise>
	
	</c:choose>
</table>


<br/><br/><br/>
<form method="post" action="/board/replyInsert" id="replyForm">
<input 	type='hidden' 	name='b_no' 		value="${boardVO.b_no}"> 
<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
<table class="boardTable">	
	<tr>
		<th colspan="3" style="height: 80px; font-size: 40px;">W r i t e &nbsp;&nbsp;&nbsp; R e p l y &nbsp;&nbsp;&nbsp; <font style="font-size: 20px;">written by ${userVO.u_name}</font></th>
	</tr>
	<tr>
		<td style="background-color:#002266; color: white; width: 200px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">Re : T i t l e</td>
		<td style="width: 80px; font-size: 30px;">▶</td>
		<td><input type="text" id="re_title" name='re_title' class="form-control" style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;"></td>
	</tr>
	<tr>
		<td style="background-color:#002266; color: white; width: 200px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">Re : C o n t e n t s</td>
		<td style="width: 80px; font-size: 30px;">▶</td>
		<td><textarea class="re_content" id="re_content" name="re_content" rows="5" style="width: 905px; font-size: 20px; border-radius: 5px; padding : 15px;">${replyVO.re_content}</textarea></td>
	</tr>
	<tr>
		<td style="background-color:#002266; color: white; width: 200px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">Re : W r i t e r</td>
		<td style="width: 80px; font-size: 30px;">▶</td>
		<td><input type="text" id="u_id" name="u_id" class="form-control" value="${userVO.u_id}" readonly="readonly" style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;"></td>
	</tr>
	<tr>
		<td colspan="3" style="height: 80px; background-color: #F2F2F2; border-radius: 8px;"><button type="button" id="writeReply" class="boardTable">Write</button></td>
	</tr>
</table>
</form>

</div>
	


</section>
<%@include file="../include/footer.jsp"%>
</div>
</body>


<script>
$(document).ready(function() 
{
	var formObj = $("form[role='form']");

	console.log(formObj);
	
	$("#mod").on("click", function() 
	{
		formObj.attr("action", "/board/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();	// 강제 submit 기능
	});
	
	$("#del").on("click", function() 
	{
		if (confirm("정말 삭제하시겠습니까??") == true)
		{    
			formObj.attr("action", "/board/removePage");
			formObj.submit();
		}
		else
		{  
		    return;
		}
	});			
	
	$("#alllist").on("click", function() 
	{
		formObj.attr("method", "get");
		formObj.attr("action", "/board/listPage");
		formObj.submit();
	});
	

	$("#writeReply").on("click", function() 
	{
		if($.trim($("#re_title").val()) == "")
	    {
			alert("댓글 제목을 입력해주세요");
			$("#re_title").focus();
			return false;
	    }
		else if($.trim($("#re_content").val()) == "")
	    {
			alert("댓글 내용을 입력해주세요");
			$("#re_content").focus();
			return false;
	    }
		else if($.trim($("#u_id").val()) == "")
	    {
			alert("아이디를 입력해주세요");
			$("#u_id").focus();
			return false;
	    }
		
		alert("Reply add success");
		
		$("#replyForm").submit();
		// location = "/user/replyInsert"; 이건 get방식으로 뒤에 넘겨야할 값에 대한 정보를 써야함
	});
});
</script>
</html>