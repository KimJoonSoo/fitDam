<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/js/upload.js"></script>
<%@include file="../include/info.jsp"%>
<title>관리자 : 상품수정</title>
</head>
<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/><br/><br/><br/><br/>
<form name="productMod" method="post" id="productMod" action="/admin/productModify" enctype="multipart/form-data">
		<input 	type='hidden' 	name='page' 		value="${cri.page}"> 
		<input	type='hidden' 	name='perPageNum' 	value="${cri.perPageNum}">
		<input 	type='hidden' 	name='searchType' 	value="${cri.searchType}">
		<input 	type='hidden' 	name='keyword' 		value="${cri.keyword}">
<table class="splist">
	<tr>
		<th colspan="4" class="splist">[${productVO.p_name}] &nbsp;&nbsp; M O D I F Y</th>
	</tr>
	<tr>
		<td class="splist">CATEGORY 1st</td>
		<td class="splist2">
			<c:set var="cat_array" value="${fn:split(productVO.p_no, '_')}"/>
            <input name="cat_id" id="cat_id" type="text" value="${cat_array[0]}" readonly="readonly" class="splist"/>
		</td>
		<td class="splist">CATEGORY 2nd</td>
		<td class="splist2">
			<input name="cat_id2" id="cat_id2" type="text" value="${productVO.cat_id}" readonly="readonly" class="splist"/>
		</td>
	</tr>
	<tr>
		<td class="splist">PRODUCT NO</td>
		<td class="splist2" colspan="3">
			<input id="p_no" name="p_no" type="text" class="splist" value="${productVO.p_no}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td class="splist">PRODUCT NAME</td>
		<td class="splist2"><input id="p_name" name="p_name" type="text" class="splist" value="${productVO.p_name}" onKeyPress="return hangeulkeyCheck(event)"></td>
		<td class="splist">PRODUCT SELL</td>
		<td class="splist2">
			<select id="p_display" name="p_display" style="width: 150px; height: 40px; border-radius: 10px; padding: 8px;">
				<option value="Y" <c:if test="${productVO.p_display} == 'Y'">selected='selected'</c:if>>Y</option>
				<option value="N" <c:if test="${productVO.p_display} == 'N'">selected='selected'</c:if>>N (SOLD OUT)</option>		
			</select>
		</td>
	</tr>
	<tr>
		<td class="splist">PRODUCT PRICE</td>
		<td class="splist2"><input id="p_price" name="p_price" type="text" class="splist" value="${productVO.p_price}" onKeyPress="return numkeyCheck(event)" numberonly="true"></td>
		<td class="splist">PRODUCT COUNT</td>
		<td class="splist2"><input id="p_count" name="p_count" type="text" class="splist" value="${productVO.p_count}" onKeyPress="return numkeyCheck(event)" numberonly="true"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT COLOR</td>
		<td class="splist2"><input id="p_color" name="p_color" type="text" class="splist" value="${productVO.p_color}"></td>
		<td class="splist">PRODUCT SIZE</td>
		<td class="splist2"><input id="p_size" name="p_size" type="text" class="splist" value="${productVO.p_size}"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT DESC</td>
		<td colspan="3" class="splist2"><textarea rows="8" cols="50" id="p_desc" name="p_desc">${productVO.p_desc}</textarea></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT PHOTO</td>
		<td colspan="3" class="splist2">
			<input id="p_photo" name="file" type="file" style="width: 500px; height: 25px; border-radius: 10px;">
			<input type="hidden" name="p_photo" value="${productVO.p_photo}">
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center" height="60px" style="background-color: #F2F2F2; border-radius: 8px;">
			<input type="submit" id="addPro" value="Modify" class="spbutton"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="Cancle" class="spbutton" id="goPList"/>
		</td>
	</tr>	
</table>
</form>
</section>
<%@include file="../include/adminfooter.jsp"%>
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

function hangeulkeyCheck(e) 
{ 
	var keyValue = event.keyCode; 
	// 한글 / 숫자 / 영대소문자
	if( ((keyValue >= 44032) && (keyValue <= 55203)) || ((keyValue >= 48) && (keyValue <= 57)) || ((keyValue >= 65) && (keyValue <= 90)) || ((keyValue >= 97) && (keyValue <= 122))) 
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

<!-- 등록 버튼 누를 시 여러개의 데이터를 하나로 모으는 기능 포함 폼 유효성 검사-->
<script>
$(document).ready(function()
{
	// CK editor 사용을 위한 설정
	var ckeditor_config = 
	{
		resize_enable : false,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		filebrowserUploadUrl : '/admin/imageUpload'	// 상품설명에 사용할 이미지 업로드
	};	
			
	CKEDITOR.replace('p_desc', ckeditor_config);
	
	
	
	
	
	/* // JSON.parse : json배열 데이터를 자바스크립트 객체로 변환시켜주는 기능
	var json = JSON.parse('${jsonList}');
	console.log(json);
	
	// 대분류 변수
    var mainCategoryArray = new Array();
    var mainCategoryObject = new Object();
    
    // 소분류 변수
    var subCategoryArray = new Array();
    var subCategoryObject = new Object();
    
    // 대분류 데이터 넣는 작업 (자바스크립트 배열 객체에서 level 1인 데이터만 추출해서 mainCategoryArray에 push)
    for(var i = 0 ; i < json.length ; i++)
    {
        if(json[i].level == "1")
        {
        	mainCategoryObject = new Object();
        	mainCategoryObject.cat_id = json[i].cat_id;
        	mainCategoryObject.cat_name = json[i].cat_name;
        	mainCategoryArray.push(mainCategoryObject);	//push 메서트로 obj객체를 넣는 기능
        }
    }
    
    // 소분류 데이터 넣는 작업 (자바스크립트 배열 객체에서 level 2인 데이터만 추출해서 subCategoryArray에 push)
    for(var i = 0 ; i < json.length ; i++)
    {
        if(json[i].level == "2")
        {
            subCategoryObject = new Object();
            subCategoryObject.cat_parentid = json[i].cat_parentid;
            subCategoryObject.cat_id = json[i].cat_id;
            subCategoryObject.cat_name = json[i].cat_name;
            subCategoryArray.push(subCategoryObject);	//push 메서트로 obj객체를 넣는 기능
        }
    } */
    
 	/* // 1레벨에 해당하는 대분류를 셀렉트 하는 작업   
    var mainCategorySelectBox = $("select[name='mainCategory']");    
    
    for(var i=0 ; i<mainCategoryArray.length ; i++)
    {
        mainCategorySelectBox.append("<option value='"+mainCategoryArray[i].cat_id+"'>"+mainCategoryArray[i].cat_name+"</option>");
    }
 	// 1레벨에 해당하는 대분류를 셀렉트 하는 작업   
 
 	
 	// 2레벨에 해당하는 소분류를 셀렉트 하는 작업   
    $(document).on("change","select[name='mainCategory']",function()
    {      
        //두번째 셀렉트 박스를 삭제 시킨다.
        var subCategorySelectBox = $("select[name='subCategory']");
        subCategorySelectBox.children().remove(); //기존 리스트 삭제
          
        //선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣는다.
        $("option:selected", this).each(function()
        {
            var selectValue = $(this).val(); //main category 에서 선택한 값
            subCategorySelectBox.append("<option value=''>CHOOSE CATEGORY</option>");
            //alert(selectValue);
            for(var i=0 ; i<subCategoryArray.length ; i++)
            {
            	// 부모(대분류)에서 넘어온 값과 자식(소분류)의 카테고리 값을 비교
                if(selectValue == subCategoryArray[i].cat_parentid)
                {    
                    subCategorySelectBox.append("<option value='"+subCategoryArray[i].cat_id+"'>"+subCategoryArray[i].cat_name+"</option>");     
                }
            }
        });   
    }); */
	/*     여기까지가 카테고리 목록 기능           */
	
	
 	// 카테고리 선택시 상품명 조합하는 부분 (카테고리 대분류, 소분류 선택 완료시 시퀀스와 합쳐서 상품명 쓰는 기능)
    /* $(document).on("change","select[name='subCategory']",function()
    {        
       	$("#p_no").val(mainCategorySelectBox.val() + "_" + $(this).val() + "_" + $("#p_seq").val());
       	$("#cat_id").val(mainCategorySelectBox.val());
    }); */
 	
 	
    $('#goPList').on("click", function() 
	{
		location = "/admin/productInfo?page=${cri.page}&perPageNum=${cri.perPageNum}"
				 	+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&p_no=${productVO.p_no}";
	});
 	
	
	// 가입하기 위한 유효성 검사
	$('#productMod').on('submit', function()
	{
		//event.preventdefault(); 기존의 효과를 안쓰게 하기 위함
		// 공백일 경우 유효성 검사

		if($.trim($("#p_price").val()) == "")
	    {
			alert("상품가격을 입력해주세요");
			$("#p_price").focus();
			return false;
	    }	
		else if($.trim($("#p_count").val()) == "")
	    {
			alert("상품수량을 입력해주세요");
			$("#p_count").focus();
			return false;
	    }
		else if($.trim($("#p_color").val()) == "")
	    {
			alert("상품색상을 입력해주세요");
			$("#p_color").focus();
			return false;
	    }
		else if($.trim($("#p_size").val()) == "")
	    {
			alert("상품사이즈를 입력해주세요");
			$("#p_size").focus();
			return false;
	    }

		
		// 정상적으로 값이 넘어갈 경우 true
		alert("상품 수정이 완료되었습니다.");
		return true;
	});
});
</script>
</body>


</html>