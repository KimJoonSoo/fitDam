<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>

<title>상품상세정보</title>
</head>
<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>


<section>

<br/>
<br/>
<br/>
<div class="body">
	<div class="row">
		<div class="box">
		<div class="box-body">
		

		
		<form role="form" action="/user/cartAdd" method="post" id="forminfo">
		<input 	type='hidden' 	name='p_no'  id="p_no"		value="${productVO.p_no}"> 
		<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
		<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
		<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
		<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
		<input 	type='hidden'	name="p_photo"		value="${productVO.p_photo}">
		<input 	type='hidden'	name="p_name"		value="${productVO.p_name}">
		<input 	type='hidden'	name="p_price"		value="${productVO.p_price}">
	
		<table class="supinfo">
			<tr>
				<th class="supinfotitle" colspan="2">[${productVO.p_name}] &nbsp;&nbsp; D E T A I L &nbsp; V I E W</th>
			</tr>
			<tr>
				<td rowspan="13"><div class="uproinfodiv">${productVO.p_desc}</div></td>
				<td class="supinfo">PRODUCT NAME</td>
			</tr>
			<tr>
				<td class="supinfo2">${productVO.p_name}</td>
			</tr>
			<tr>
				<td class="supinfo">PRODUCT PRICE</td>
			</tr>
			<tr>
				<td class="supinfo2">${productVO.p_price}원</td>
			</tr>
			<tr>
				<td class="supinfo">PRODUCT COLOR</td>
			</tr>
			<tr>
				<c:set var="color_array" value="${fn:split(productVO.p_color, '/')}"/>
				<td class="supinfo2">
					<select name="p_color" id="p_color" class="supinfo">
						<option value="">Choose Color</option>
						<c:forEach items="${color_array}" var="color">
							<option value="${color}">${color}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="supinfo">PRODUCT SIZE</td>
			</tr>
			<tr>
				<c:set var="size_array" value="${fn:split(productVO.p_size, '/')}"/>
				<td class="supinfo2">
					<select name="p_size" id="p_size" class="supinfo">
						<option value="">Choose Size</option>
						<c:forEach items="${size_array}" var="size">
							<option value="${size}">${size}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="supinfo">HOW MANY?</td>
			</tr>
			<tr>
				<td class="supinfo2">
					<select name="p_count" id="p_count" class="supinfo">
						<option value="">SELECT COUNT</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<div style="height: 50px; width: 290px; background-color: #002266; color: #FFFFFF; font-size: 20px; margin: 0 auto; text-align: center; vertical-align: middle; border-radius: 8px;">
						SELECT LIST
					</div>
					<div id="p_buydiv" class="uprobuydiv">
						
					</div>
				</td>
			</tr>
			<tr>
				<td><input class="supinfo" type="button" value="Buy it NOW" id="buyBTN" name="buyBTN"></td>
			</tr>
			<tr>
				<td><input class="supinfo" type="button" value="Add to Cart" id="cartBTN"></td>
			</tr>
		</table>
		</form>
		</div>
	</div>
</div>
	</div>
</section>
<%@include file="../include/footer.jsp"%>
</div>

<script>
var result = '${cartinfo}';

if(result == "already")
{
	alert("이미 같은 상품이 장바구니에 존재합니다.");	
}
</script>

<script>
var idx = 0;

function colsizeadd(value) 
{
	var str;
	
	str = "<div  style='height: 40px;'><input type='text' class='cartlist' id='" + idx++ + "' name='p_buy' value = '" + value + "' style='width: 150px; height: 30px; font-size: 16px; padding-left:10px; border-radius:8px;' readonly='readonly'>";
	str += "<input type='button' name='delbuy' value='x' style='width: 20px; height: 20px; font-size: 15px; background-color:black; color:white; border-radius:8px;'></div>";
	
	// 상품이 이미 존재 할 경우 아예 옵션 자체를 선택하지 못하도록 하는 ajax
	$.ajax
	({
		type : "POST",
		url : "/user/productCheck",
		data: 
        {
			// 상품번호, 색상, 사이즈를 데이터로 받아서
			"p_no" : $("#p_no").val(),
	  	 	"c_color" : value.split("/")[0],
	  	 	"c_size" : value.split("/")[1]
        },
        
		success: function(data)
		{		    		
			// 데이터가 장바구니에 존재하지 않는 경우 (=추가 가능)
			if(data == 1)
			{
				$('#p_buydiv').append(str);
		    }
			// 장바구니에 데이터가 존재하는 경우
			else
			{
				alert("이미 해당상품이 장바구니에 존재합니다.");
		    }
		}	
	});
	
}




$(document).ready(function()
{	
	var p_colorf;
	var p_sizef;
	var p_countf;
	var color_stat = false;
	var size_stat = false;
	var count_stat = false;

	
	// color를 먼저 셀렉트 하는 작업   
	$(document).on("change","select[name='p_color']",function()
	{      
	    p_colorf = $(this).val();
	    
	    if($("#p_color").val() != "") color_stat = true;
	    
	    if(color_stat && size_stat && count_stat)
	    {
			if(($("#p_size").val() != "" && $("#p_color").val() != "" && $("#p_count").val() != ""))
			{
				color_stat = false;
				size_stat = false;
				count_stat = false;
				colsizeadd(p_colorf + "/" + p_sizef + "/" + p_countf);
				$("#p_size").val("");
				$("#p_color").val("");
				$("#p_count").val("");
			}
		}
	});

	// size를 먼저 셀렉트 하는 작업
	$(document).on("change","select[name='p_size']",function()
	{         
	    p_sizef = $(this).val();
	    
	    if($("#p_size").val() != "") size_stat = true;
	    
	    if(color_stat && size_stat && count_stat)
	    {
			if(($("#p_size").val() != "" && $("#p_color").val() != "" && $("#p_count").val() != ""))
			{
				color_stat = false;
				size_stat = false;
				count_stat = false;
				colsizeadd(p_colorf + "/" + p_sizef + "/" + p_countf);
				$("#p_size").val("");
				$("#p_color").val("");
				$("#p_count").val("");
			}
		}
	});
	
	// 수량 먼저 셀렉트 하는 작업
	$(document).on("change","select[name='p_count']",function()
	{         
	    p_countf = $(this).val();
	    
	    if($("#p_count").val() != "") count_stat = true;
	    
	    if(color_stat && size_stat && count_stat)
	    {
			if(($("#p_size").val() != "" && $("#p_color").val() != "" && $("#p_count").val() != ""))
			{
				color_stat = false;
				size_stat = false;
				count_stat = false;
				colsizeadd(p_colorf + "/" + p_sizef + "/" + p_countf);
				$("#p_size").val("");
				$("#p_color").val("");
				$("#p_count").val("");
			}
		}
	});
	
	
	$(document).on("click","input[name=delbuy]",function()
	{    
	    var delBuy = $(this).parent();    
	    delBuy.remove();
	});
	
	
	$('#cartBTN').on('click', function()
	{
		if(!$(".cartlist").length)
	    {	
			alert("색상/사이즈/수량을 선택해주세요");
			$("#p_color").focus();
			return false;
	    }
		
		else
		{	
			var str = "";
			$('.cartlist').each(function() 
			{
				str = "<input type='hidden' name='c_color' value='"+$(this).val().split("/")[0]+"'>";
				str += "<input type='hidden' name='c_size' value='"+$(this).val().split("/")[1]+"'>";
				str += "<input type='hidden' name='c_count_string' value='"+$(this).val().split("/")[2]+"'>";
				console.log($(this).val().split("/")[0]);
				console.log($(this).val().split("/")[1]);
				console.log($(this).val().split("/")[2]);
				$('#p_buydiv').append(str);			
			});
			
			
			alert("장바구니로 이동합니다.");
			$('#forminfo').attr("action","/user/cartAdd");
			$('#forminfo').submit(); 
		}
		
	});
	
	
	
 	// 바로 주문하기
	$('#buyBTN').on("click", function(event) 
	{		
		if(!$(".cartlist").length)
	    {	
			alert("색상/사이즈/수량을 선택해주세요");
			$("#p_color").focus();
			return false;
	    }
		
		else
		{	
			var str = "";
			$('.cartlist').each(function() 
			{
				str = "<input type='hidden' name='c_color' value='"+$(this).val().split("/")[0]+"'>";
				str += "<input type='hidden' name='c_size' value='"+$(this).val().split("/")[1]+"'>";
				str += "<input type='hidden' name='c_count_string' value='"+$(this).val().split("/")[2]+"'>";
				console.log($(this).val().split("/")[0]);
				console.log($(this).val().split("/")[1]);
				console.log($(this).val().split("/")[2]);
				
				$('#p_buydiv').append(str);	
			});
					

			// form의 action값을 /user/orderListP로 변경
			$('#forminfo').attr("action","/user/orderListP");
			$('#forminfo').submit();
			alert("구매페이지로 넘어갑니다");
		}
	}); 	
});
</script>
	
</body>
</html>