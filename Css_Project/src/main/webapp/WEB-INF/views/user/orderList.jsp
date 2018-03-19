<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>

<title>주문하기</title>

<style>
img {width: 200px; height:150px;}
</style>

</head>
<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>


<section>
<br/>
<br/>
<br/>
<form name="formOrder" method="post" id="formOrder">
<div>
<table class="ubuyorder">
	<tr>
		<th class="ubuyorder" colspan="7">${userVO.u_name}'s &nbsp;&nbsp;&nbsp; O R D E R &nbsp;&nbsp;&nbsp; L I S T</th>
	</tr>
	<tr>
		<th class="ubuyorderth" style="width: 180px">PHOTO</th>
		<th class="ubuyorderth" style="width: 220px">NAME</th>
		<th class="ubuyorderth" style="width: 150px">COLOR</th>
		<th class="ubuyorderth" style="width: 150px">SIZE</th>
		<th class="ubuyorderth" style="width: 150px">COUNT</th>
		<th class="ubuyorderth" style="width: 150px">PRICE</th>
		<th class="ubuyorderth" style="width: 200px">TOTAL</th>
	</tr>
	
	<c:set value="0" var="total"/>
	
	<tr>
		<c:forEach items="${cartVO}" var="cartVO">
		<c:set value="0" var="sum"/>
			<tr>
				<td class="" style="width: 180px"><img src="/admin/upload/displayFile?fileName=${cartVO.p_photo.replace('/s_','/')}"></td>
				<td class="" style="width: 220px">${cartVO.p_name}</td>
				<td class="" style="width: 150px">${cartVO.c_color}</td>
				<td class="" style="width: 150px">${cartVO.c_size}</td>
				<td class="" style="width: 150px">${cartVO.c_count}</td>
				<td class="" style="width: 150px"><fmt:formatNumber value="${cartVO.p_price}" pattern="###,###,###"/></td>
				<c:set value="${cartVO.p_price * cartVO.c_count}" var="sum" />
				<td class="" style="width: 200px"><fmt:formatNumber value="${sum}" pattern="###,###,###"/></td>
				<c:set value="${total+sum}" var="total" />
			</tr>
			
		</c:forEach>
	</tr>
		<c:set value="0" var="deliveryFee"/>
		
		<c:if test="${total >= 50000}">
			<c:set value="0" var="deliveryFee"/>
		</c:if>
		<c:if test="${(total < 50000) && (total >= 0)}">
			<c:set value="2500" var="deliveryFee"/>
		</c:if>
	<tr>
		<td colspan="7" style="height: 60px; background-color: #F2F2F2; font-size: 20px; border-radius: 8px; text-align: right; padding-right: 25px; border: 2px solid black;">															
			Delivery Fee : [<fmt:formatNumber value="${deliveryFee}" pattern="###,###,###원"/>] &nbsp;&nbsp; + &nbsp;&nbsp; Product Price : [<fmt:formatNumber value="${total}" pattern="###,###,###원"/>] &nbsp;&nbsp; = &nbsp;&nbsp; Total : <input type="text" id="o_total" name="o_total" disabled="disabled" value="${total + deliveryFee}" readonly="readonly" style="width: 200px; height: 30px; font-size: 18px; padding-left: 15px;"/>원
		</td>
	</tr>
	
	<tr>
		<td colspan="7" style="height: 60px; background-color: #F2F2F2; font-size: 20px; border-radius: 8px; text-align: right; padding-right: 25px; border: 2px solid black;">
			Available Point : <input type="text" id="u_point" name="u_point" disabled="disabled" value="${userVO.u_point}" readonly="readonly" style="width: 200px; height: 30px; font-size: 18px; padding-left: 15px;"/> &nbsp;&nbsp; | &nbsp;&nbsp;
			Use Point : <input type="text" id="u_usepoint" name="u_usepoint" disabled style="width: 200px; height: 30px; font-size: 18px; padding-left: 15px;" onKeyPress="return numkeyCheck(event)" numberonly="true">
						&nbsp;<input type="checkbox" id="ck_point" name="ck_point">&nbsp;포인트를 사용하실경우 체크해주세요.
		</td>
	</tr>
</table>
</div>

<br/>

<div>
<table class="ubuyorder">
	<tr>
		<th class="ubuyorder" colspan="4">O R D E R E R &nbsp;&nbsp;&nbsp; I N F O</th>
	</tr>
	<tr>
		<th class="ubuyorderthh" style="width: 300px;">I D</th>
		<td align="left">
			<input class="ubuyorder" type="text" id="u_id" name="u_id" value="${userVO.u_id}" readonly="readonly" style="width: 950px; padding-left: 20px;">
		</td>
	</tr>
	<tr>
		<th class="ubuyorderthh" style="width: 300px;">N A M E</th>
		<td align="left">
			<input class="ubuyorder" type="text" id="u_name" name="u_name" value="${userVO.u_name}" readonly="readonly" style="width: 950px; padding-left: 20px;">
		</td>
	</tr>
	<tr>
		<th class="ubuyorderthh" style="width: 300px;">P H O N E</th>
		<td align="left">
			<input class="ubuyorder" type="text" id="u_phonenum" name="u_phonenum" value="${userVO.u_phonenum}" readonly="readonly" style="width: 950px; padding-left: 20px;">
			<c:set var="phone_array" value="${fn:split(userVO.u_phonenum, '-')}"/>
			<input name="u_phonenum1" id="u_phonenum1" type="hidden" value="${phone_array[0]}"/>
           	<input name="u_phonenum2" id="u_phonenum2" type="hidden" value="${phone_array[1]}"/>
           	<input name="u_phonenum3" id="u_phonenum3" type="hidden" value="${phone_array[2]}"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" id="u_addnum" name="u_addnum" value="${userVO.u_addnum}">
			<input type="hidden" id="u_address" name="u_address" value="${userVO.u_address}">
			<c:set var="address_array" value="${fn:split(userVO.u_address, '/')}"/>
			<input name="u_address1" id="u_address1" type="hidden" value="${address_array[0]}"/>
           	<input name="u_address2" id="u_address2" type="hidden" value="${address_array[1]}"/>
           	<input name="u_address3" id="u_address3" type="hidden" value="${address_array[2]}"/>
		</td>
	</tr>	
</table>
</div>

<br/>

<div>
<table class="ubuyorder">
	<tr>
		<th class="ubuyorder" colspan="2">D E S T I N A T I O N &nbsp;&nbsp;&nbsp; I N F O</th>
	</tr>
	<tr>
		<td colspan="2" style="padding-left: 20px; text-align: left; height: 50px; background-color: #F2F2F2; font-size: 25px; border-radius: 8px; border: 2px solid black;">
            <input id="samestop" name="o_info" type="radio" value="주문자정보와동일"/>
            <label for="samestop">주문자 정보와 동일</label>
             &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; 
            <input id="newstop" name="o_info" type="radio" value="새로운배송지"/>
            <label for="newstop">새로운 배송지</label>
        </td>
	</tr>	
	
	<tr>
		<th class="ubuyorderthh" style="width: 300px;">RECEIVER NAME</th>
		<td align="left">
			<input class="ubuyorder" type="text" id="o_infoname" name="o_infoname" placeholder="배송 받으시는 분의 성함을 적어주세요." style="width: 950px; padding-left: 20px;">
		</td>
	</tr>
	<tr>
		<th class="ubuyorderthh" style="width: 300px;">RECEIVER PHONE</th>
		<td align="left">
			<input class="ubuyorder" id="o_infophone1" name="o_infophone1" type="text" maxlength="3" placeholder="010"  onKeyPress="return numkeyCheck(event)" numberonly="true" style="width: 200px;"/> -
           	<input class="ubuyorder" id="o_infophone2" name="o_infophone2" type="text" maxlength="4" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)" numberonly="true" style="width: 225px"/> -
           	<input class="ubuyorder" id="o_infophone3" name="o_infophone3" type="text" maxlength="4" placeholder="xxxx"  onKeyPress="return numkeyCheck(event)"  numberonly="true" style="width: 225px"/>
           	<input type="hidden" name="o_infophone" id="o_infophone"/>
		</td>
	</tr>
	<tr>
        <th class="ubuyorderthh" style="width: 300px;">RECEIVER POSTNO.</th>
        <td align="left">
        	<input class="ubuyorder" id="o_addnum" name="o_addnum" type="text" placeholder="우편번호" onclick="o_execDaumPostcode()" style="width: 200px"/>&nbsp;&nbsp;
        	<input type="button" id="o_addnum_check" onclick="o_execDaumPostcode()" value="우편번호검색" style="background-color: #002266; color: #FFFFFF; height: 25px; width: 150px; border-radius: 5px;"/>
        </td>
    </tr>
	<tr>
		<th class="ubuyorderthh" style="width: 300px;">RECEIVER ADDRESS</th>
		<td align="left">
			<input class="ubuyorder" id="o_add" name="o_addressfront" type="text" placeholder="도로명주소 or 지번주소" style="width: 450px"/>&nbsp;/&nbsp;
           	<input class="ubuyorder" id="o_adddetail" name="o_addressdetail" type="text" placeholder="상세 주소를 입력해주세요." style="width: 450px"/>
           	<input type="hidden" name="o_infoadd" id="o_infoadd"/>
		</td>
	</tr>
	<tr>
		<th class="ubuyorderthh" style="width: 300px;">ORDER MESSAGE</th>
		<td align="left">
			<input class="ubuyorder" type="text" id="o_infomessage" name="o_infomessage" placeholder="배송메시지를 입력해주세요. ex)부재시 경비실에 부탁드려요" style="width: 950px;">
		</td>
	</tr>
</table>
</div>

<br/><br/><br/>
<div>
<table>
	<tr>
		<td>
			<input type="submit" value="Order Now" id="OrderBTN" name="OrderBTN" style="width: 200px; height: 80px; font-size: 30px; background-color: #002266; color: #FFFFFF; border-radius: 10px;">
		</td>
	</tr>
</table>
</div>
</form>



</section>
<%@include file="../include/footer.jsp"%>
</div>
	


<!-- 숫자만 입력 가능한 기능 -->
<script>
function numkeyCheck(e) 
{ 
	var keyValue = event.keyCode; 
	
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
	{	
		return true; 
	}
	
	else return false; 
} 

$(document).on("keyup", "input:text[numberonly]", function() 
{
	$(this).val( $(this).val().replace(/[^0-9]/gi,""));	// 숫자 이외의 값을 입력하면 ""으로 변환하도록 함
});
</script>
<!-- 숫자만 입력 가능한 기능 -->


<script>
$(document).ready(function()
{
	// 포인트 사용여부를 묻는 체크박스를 선택할때마다 상태변화
	$('#ck_point').click(function() 
	{
		// 체크박스 선택시 포인트 입력 input 비활성화 해제
		if($('#ck_point').is(":checked"))
		{
			$('#u_usepoint').attr("disabled", false);
		}
		// 체크박스 선택해제시 포인트 입력 input 비활성화
		else 
		{
			$('#u_usepoint').attr("disabled", true);
			
			// 체크박스 선택해제시 사용포인트 값이 "" 일 경우 공백으로 둔다
			if($('#u_usepoint').val() == "")
			{
				$('#u_usepoint').val("");
			}
			// 체크박스 선택해제시 사용포인트 값이 있는경우 값을 계산한다
			else if ($('#u_usepoint').val() != "") 
			{
				$('#o_total').val(parseInt($('#o_total').val()) + parseInt($('#u_usepoint').val()));
				$('#u_point').val(parseInt($('#u_point').val()) + parseInt($('#u_usepoint').val()));
				$('#u_usepoint').val("");
			}
		} 
		
	});
	
	// 입력창에 입력후 blur 동작시
	$('#u_usepoint').blur(function() 
	{
		var result = (($('#u_point').val()) - ($('#u_usepoint').val()));		
		
		if(result >= 0)
		{
			$('#o_total').val($('#o_total').val() - $('#u_usepoint').val());
			$('#u_point').val($('#u_point').val() - $('#u_usepoint').val());
			$('#u_usepoint').attr("disabled", true);
		}
		else if(result < 0)
		{
			alert("보유중인 포인트 범위내에서 사용 가능합니다.");
			$('#u_usepoint').val("");
		}
	});
	
	
	
	
	
	$('#samestop').click(function() 
	{
		alert("주문자 정보와 동일합니다.");
    	
    	$("#o_infoname").val($("#u_name").val());

    	$("#o_infophone1").val($("#u_phonenum1").val());
    	$("#o_infophone2").val($("#u_phonenum2").val());
    	$("#o_infophone3").val($("#u_phonenum3").val());
    	
    	$("#o_addnum").val($("#u_addnum").val());
    	
    	$("#o_add").val($("#u_address1").val());
    	$("#o_adddetail").val($("#u_address2").val());
	});
	
	$('#newstop').click(function() 
	{
		alert("새로운 배송 정보를 입력해주세요.");
    	
    	$("#o_infoname").val("");

    	$("#o_infophone1").val("");
    	$("#o_infophone2").val("");
    	$("#o_infophone3").val("");
    	
    	$("#o_addnum").val("");
    	
    	$("#o_add").val("");
    	$("#o_adddetail").val("");
	});
	
	
	$('#formOrder').on('submit', function()
	{
		//event.preventdefault(); 기존의 효과를 안쓰게 하기 위함
		
		// 나눠진 데이터를 합치는 과정
		var o_phonenum = $('#o_infophone1').val() + "-" + $('#o_infophone2').val() + "-" + $('#o_infophone3').val();
		var o_address = $('#o_add').val() + "/" + $('#o_adddetail').val();
		
		$('#o_infophone').val(o_infophone);
		$('#o_address').val(o_address);
		
		
		// 공백일 경우 유효성 검사
		
		if($.trim($("#o_infoname").val()) == "")
	    {
			alert("배송받으실 분의 이름을 입력해주세요");
			$("#o_infoname").focus();
			return false;
	    }
		
		else if ($.trim($("#o_infophone1").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#o_infophone1").focus();
			return false;
		}
		else if ($("#o_infophone1").val().length != 3)
	    {
			alert("첫 세자리 번호를 입력해주세요");
			return false;
	    }
		
		else if ($.trim($("#o_infophone2").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#o_infophone2").focus();
			return false;
		}
		else if (($("#o_infophone2").val().length != 3) && ($("#o_infophone2").val().length != 4))
	    {
			alert("가운데 세자리 또는 네자리 번호를 입력해주세요");
			return false;
	    }
		
		else if ($.trim($("#o_infophone3").val()) == "")
		{
			alert("핸드폰 번호를 입력해주세요");
			$("#o_infophone3").focus();
			return false;
		}
		else if ($("#o_infophone3").val().length != 4)
	    {
			alert("마지막 네자리 번호를 입력해주세요");
			return false;
	    }
		
		else if ($.trim($("#o_addnum").val()) == "")
		{
			alert("우편번호를 입력해주세요");
			$("#o_addnum").focus();	// addnum 안되면 postcode로 바꾸기
			return false;
		}
		
		else if ($.trim($("#o_add").val()) == "")
		{
			alert("도로명(또는 지번) 주소를 입력해주세요");
			$("#o_add").focus();
			return false;
		}
		
		else if ($.trim($("#o_adddetail").val()) == "")
		{
			alert("상세주소를 입력해주세요");
			$("#o_adddetail").focus();
			return false;
		}
		
		else if ($.trim($("#o_infomessage").val()) == "")
		{
			alert("배송메시지를 입력해주세요");
			$("#o_infomessage").focus();
			return false;
		}
		

		// 정상적으로 값이 넘어갈 경우 true
		return true;
	});
});
</script>

<!-- 우편번호 레이어로 넣기 -->
<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
	<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer"
		style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1; width: 5%; height: auto;"
		onclick="closeDaumPostcode()" alt="X"/>
</div>
<!-- 우편번호 레이어로 넣기 -->
	
<!-- 우편번호검색기능 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    // 우편번호검색 화면을 넣을 element layer 방식
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() 
    {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function o_execDaumPostcode() 
    {
        new daum.Postcode
        ({
        	// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            oncomplete: function(data) 
            {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; 		 // 조합형 주소 변수 기본형 공백

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R')
                {
                    // 해당 주소명이 있을 경우 추가한다.
                    if(data.bname !== '')
                    {
                        extraAddr += data.bname;	// 공백 + 검색한 주소명
                    }
                    
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== '')
                    {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('o_addnum').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('o_add').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                closeDaumPostcode();
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);	// open 기능 대신 embed를 사용 (몇몇 Webview기반 브라우저의 window.open 미대응 때문에 embed 사용 추천)

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition()
    {
        var width = 500; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 항상 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 우편번호검색기능 -->

</body>
</html>