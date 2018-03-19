<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>게시글 수정하기</title>
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
				<div class="box-body">
					<table class="boardTable">
					<form role="form" action="modifyPage" method="post">
						<input 	type='hidden' 	name='b_no' 		value="${boardVO.b_no}"> 
						<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
						<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
						<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
						<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
						
						<tr align="center">
							<td colspan="3" style="height: 80px; font-size: 40px;">M o d i f y &nbsp;&nbsp;&nbsp; B o a r d</td>
						</tr>
						<tr>
							<td style="background-color:#002266; color: white; width: 150px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">T i t l e</td>
							<td style="width: 80px; font-size: 30px;">▶</td>
							<td><input type="text"	name='b_title' class="form-control" value="${boardVO.b_title}" style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;"></td>
						</tr>
						
						<tr>
							<td style="background-color:#002266; color: white; width: 150px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">C o n t e n t s</td>
							<td style="width: 80px; font-size: 30px;">▶</td>
							<td><textarea class="b_content" name="b_content" rows="10" style="width: 905px; font-size: 20px; border-radius: 5px; padding : 15px;">${boardVO.b_content}</textarea></td>
						</tr>
						
						<tr>
							<td style="background-color:#002266; color: white; width: 150px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">W r i t e r</td>
							<td style="width: 80px; font-size: 30px;">▶</td>
							<td><input type="text"	name="u_id" class="form-control" value="${boardVO.u_id}" readonly="readonly" style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;"></td>
						</tr>
						</form>
						<tr align="center">
							<td colspan="3" style="height: 80px; background-color: #F2F2F2; border-radius: 8px;">
								<button type="submit" id="sav" class="boardTable">Save</button>&nbsp;&nbsp;
								<button type="submit" id="goList" class="boardTable">List</button>
							</td>
						</tr>
					</table>
				</div>		
				
				<!-- <div class="box-footer">
					<button type="submit" id="sav" style="background-color:#d65548;">저장</button>&nbsp;&nbsp;
					<button type="submit" id="goList" style="background-color:#d65548;">목록</button>
				</div> -->
			</div>
		</div>
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

	$("#goList").on("click",function() 
	{
		self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
	});

	$("#sav").on("click",function() 
	{
		formObj.submit();
	});
});
</script>
</html>