<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>

<title>장바구니 목록</title>

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
		<form id="cartDel" action="/user/cartDel" method="post">
			<input type="hidden" id="c_no" name="c_no">
		</form>
		<form id="cartBuy" action="/user/orderList" method="get">
			<input type="hidden" id="buy_c_no" name="c_no">
		</form>

		<div class="box-body">
			
			<!-- 여기서 조건을 걸어서 장바구니 목록이 없으면 cart empty를 띄우고 차있으면 그 내용을 띄우도록 하고싶은데 -->
			<c:choose>
			<c:when test="${map.count == 0}">
			<table class="lliisstt">
				<tr>
					<th class="lliisstttitle">C A R T &nbsp;&nbsp;&nbsp; L I S T</th>
				</tr>
				
				<tr>
					<td align="center" style="height: 100px; text-align: center; font-size: 30px;">C A R T &nbsp;&nbsp;&nbsp; I S  &nbsp;&nbsp;&nbsp; E M P T Y</td>
				</tr>
			</table>
			</c:when>
			
			<c:otherwise>
			<form name="cartform" method="post" action="/user/cartuList">
			<input 	type='hidden' 	name='c_no'		value="${cartVO.c_no}"> 
			
			<table class="lliisstt">
			<tr>
				<th colspan="10" class="lliisstttitle">C A R T &nbsp;&nbsp;&nbsp; L I S T</th>
			</tr>
			
			<tr>
				<th class="lliisstt" style="width: 50px"><input type="checkbox" name="all_C" id="all_C"></th>
				<th class="lliisstt" style="width: 200px">ID</th>
				<th class="lliisstt" style="width: 100px">P.NO</th>
				<th class="lliisstt" style="width: 200px">NAME</th>
				<th class="lliisstt" style="width: 250px">PHOTO</th>
				<th class="lliisstt" style="width: 100px">COLOR</th>
				<th class="lliisstt" style="width: 100px">SIZE</th>
				<th class="lliisstt" style="width: 100px">PRICE</th>
				<th class="lliisstt" style="width: 50px">COUNT</th>
				<th class="lliisstt" style="width: 100px">DEL</th>
			</tr>
		<%-- 방법2 :  <c:set value="0" var="total"/> --%>
		
		<c:forEach items="${map.list}" var="cartVO">
			<tr>
				<td class="lliisstt" style="width: 50px"><input type="checkbox" name="check_C" class="check_C" data-c_no="${cartVO.c_no}"></td>
				<td class="lliisstt" style="width: 200px">${cartVO.u_id}</td>
				<td class="lliisstt" style="width: 100px">${cartVO.p_no}</td>
				<td class="lliisstt" style="width: 200px"><a class="lliisstt" href='/user/uproductInfo?&p_no=${cartVO.p_no}'>${cartVO.p_name}</a></td>
				<td class="lliisstt" style="width: 250px"><a class="lliisstt" href='/user/uproductInfo?&p_no=${cartVO.p_no}'><img src="/admin/upload/displayFile?fileName=${cartVO.p_photo.replace('/s_','/')}"></a></td>
				<td class="lliisstt" style="width: 100px">${cartVO.c_color}</td>
				<td class="lliisstt" style="width: 100px">${cartVO.c_size}</td>
				<td class="lliisstt" style="width: 100px"><fmt:formatNumber value="${cartVO.p_price}" pattern="###,###,###"/></td>
				<td class="lliisstt" style="width: 150px">
					<select id="c_count${cartVO.c_no}" name="c_count" style="border-radius: 4px; height: 30px; width: 50px;">
						<%-- foreach문을 사용해서 원하는 옵션의 수만큼 구성이 가능 --%>
						<c:forEach begin="0" end="9" step="1" varStatus="status">
							<option value="${status.index+1}" <c:if test="${cartVO.c_count == status.index+1}">selected="selected"</c:if>>${status.index+1}</option>
						</c:forEach>
					</select>
					<input type="button" value="수정" class="cartBTN" name="c_countMod" data-c_no="${cartVO.c_no}">
				</td>
				<td class="lliisstt" style="width: 100px"><input type="button" class="deldel" data-c_no="${cartVO.c_no}" value="DEL"></td>
				<%-- 방법2 : <c:set value="${cartVO.p_price* cartVO.c_count + total}" var="total" /> --%>
			</tr>
		</c:forEach>
			
			<tr><%-- ${cartVO.p_price} * ${cartVO.c_count} --%>
				<td colspan="4" style="text-align: center; height: 70px; padding-right: 25px; background-color: #F2F2F2; font-size: 25px; border-radius: 8px;">
					<input class="cartCButton" type="button" id="checkBuy" name="checkBuy" value="Checked Buy"> &nbsp;&nbsp;&nbsp;
					<input class="cartCButton" type="button" id="checkDel" name="checkDel" value="Checked Del">
				</td>
				<td colspan="6" style="text-align: right; height: 70px; padding-right: 25px; background-color: #F2F2F2; font-size: 25px; border-radius: 8px;">Total : <fmt:formatNumber value="${map.total}" pattern="###,###,###"/>won</td>
			</tr>
			
			</table>
			</form>
			</c:otherwise>
			</c:choose>
			</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
</div>


<script>
var result = '${cartdel}';

if(result == "deldeldel")
{
	alert("장바구니에서 항목이 삭제 되었습니다.");	
}
</script>

<script>
$(document).ready(function() 
{
	// 개별적으로 하나씩 지우기
	$('.deldel').on("click", function(event) 
	{		
		if (confirm("장바구니에서 정말 삭제 하시겠습니까??") == true)	// POST 방식
		{
			$('#c_no').val($(this).attr("data-c_no"));
			
			$('#cartDel').submit();
			
			//location = "/user/cartDel&c_no=" + $(this).attr("data-c_no");    // GET 방식
		}
		else
		{
			return false;
		}
	});
	
	
	// 전체체크 설정 및 전체체크 해제
	$('#all_C').on("click", function(event) 
	{		
		if($("#all_C").prop("checked")) 
		{ 
			//해당화면에 전체 checkbox들을 체크해준다 
			$("input[type=checkbox]").prop("checked",true); 
		} 
		else 
		{ 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[type=checkbox]").prop("checked",false); 
		}		
	});
	
	
	// 체크된 부분만 삭제하기
	$('#checkDel').on("click", function(event) 
	{		
		// 변수 초기값 0 설정
		var cnt = 0;
		
		// 체크된 갯수가 있을때마다 cnt를 후치증가
		$(".check_C").each(function() 
		{
			if($(this).is(":checked"))
			{
				cnt++;
			}
		});
		// cnt가 0일 경우 (= 체크된 항목이 없는 경우)
		if(cnt == 0)
		{	
			alert("항목을 선택해주세요");
		}
			
		// 체크된 항목들이 있는경우 삭제 확인 메시지 출력
		else if (confirm("장바구니에서 선택항목을 삭제 하시겠습니까??") == true)	// POST 방식
		{
			var str = "";
			$("input[name=check_C]:checked").each(function() 
			{
				str += $(this).attr("data-c_no") + ",";
			});
			//마지막 부분에 들어가는 ,는 빼야 하기때문에 slice를 통해서 범위를 설정
			$('#c_no').val(str.slice(0,-1));
			$('#cartDel').submit();
		}
		else
		{
			return false;
		}					
	});
	
	
	
 	// 체크된 부분 주문하기
	$('#checkBuy').on("click", function(event) 
	{		
		// 변수 초기값 0 설정
		var cnt = 0;
		
		// 체크된 갯수가 있을때마다 cnt를 후치증가
		$(".check_C").each(function() 
		{
			if($(this).is(":checked"))
			{
				cnt++;
			}
		});
		// cnt가 0일 경우 (= 체크된 항목이 없는 경우)
		if(cnt == 0)
		{	
			alert("항목을 선택해주세요");
		}
			
		// 체크된 항목들이 있는경우 주문
		else if (confirm("장바구니에서 선택항목을 구매 하시겠습니까??") == true)	// POST 방식
		{
			var str = "";
			$("input[name=check_C]:checked").each(function() 
			{
				str += $(this).attr("data-c_no") + ",";
			});
			//마지막 부분에 들어가는 ,는 빼야 하기때문에 slice를 통해서 범위를 설정
			$('#buy_c_no').val(str.slice(0,-1));
			
			alert("구매페이지로 넘어갑니다");
			$('#cartBuy').submit();
		}
		else
		{
			return false;
		}					
	}); 
	
	
	

	
	// 수량 수정하기					&amp; = & 같은 뜻
	$('.cartBTN').on("click", function(event) 
	{		
		//$('#cartUp').submit();
		var c_no = $(this).attr("data-c_no");
		var c_count = $("#c_count"+c_no).val();
		
		//alert(c_no + c_count);
		
		location = "/user/cartUp?c_no=" + c_no + "&c_count=" + c_count;
	});
});
</script>
	
</body>
</html>