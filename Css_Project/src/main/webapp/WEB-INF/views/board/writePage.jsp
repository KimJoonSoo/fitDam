<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>게시글 쓰기</title>
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
				<form role="form" method="post">
					<div class="box-body">
						<table class="boardTable">
							<tr>
								<td colspan="3" style="height: 80px; font-size: 40px;">W r i t e &nbsp;&nbsp;&nbsp; B o a r d</td>
							</tr>
							
							<tr>
								<td style="background-color:#002266; color: white; width: 150px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">T i t l e</td>
								<td style="width: 80px; font-size: 30px;">▶</td>
								<td><input style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;" type="text"	name='b_title' class="form-control" placeholder="제목을 입력하세요."></td>
							</tr>
							
							<tr>
								<td style="background-color:#002266; color: white; width: 150px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">C o n t e n t s</td>
								<td style="width: 80px; font-size: 30px;">▶</td>
								<td><textarea class="form-control" name="b_content" rows="10" placeholder="내용을 입력하세요." style="width: 905px; font-size: 20px; border-radius: 5px; padding : 15px;"></textarea></td>
							</tr>
							
							<tr>
								<td style="background-color:#002266; color: white; width: 150px; border-radius: 8px; height: 45px; text-align: right; padding-right: 10px;">W r i t e r</td>
								<td style="width: 80px; font-size: 30px;">▶</td>
								<td><input style="width: 920px; font-size: 20px; border-radius: 8px; height: 30px; padding-left: 15px;" type="text" value="${userVO.u_id}" readonly="readonly" name="u_id" class="form-control" placeholder="아이디를 입력하세요."></td>
							</tr>
							
							<tr>
								<td colspan="3" style="height: 80px; background-color: #F2F2F2; border-radius: 8px;"><button type="submit" id="add" class="boardTable">등록</button></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
</div>
</body>
</html>