<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/js/upload.js"></script>
<%@include file="../include/info.jsp"%>
<title>상품등록</title>
</head>
<body>
<div>
<%@ include file="../include/adminheader.jsp" %>
<%@ include file="../include/adminnav.jsp" %>
<section>
<br/><br/><br/><br/><br/>
<form name="productadd" method="post" id="productadd" action="/admin/productAdd" enctype="multipart/form-data">
<table class="splist">
	<tr>
		<th colspan="4" class="splist">P R O D U C T &nbsp;&nbsp; A D D</th>
	</tr>
	<tr>
		<td class="splist">CATEGORY 1st</td>
		<td class="splist2">
			<select class="splist" id="mainCategory" name="mainCategory">
				<option value="">CHOOSE CATEGORY</option>
			</select>
		</td>
		<td class="splist">CATEGORY 2nd</td>
		<td class="splist2">
			<select class="splist" id="subCategory" name="subCategory">
				<option value="">CHOOSE CATEGORY</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="splist">PRODUCT NO</td>
		<td class="splist2" colspan="3">
			<input type="hidden" id="p_seq" name="p_seq" value="${p_seq}"/>
			<input id="p_no" name="p_no" type="text" class="splist">
		</td>
	</tr>
	<tr>
		<td class="splist">PRODUCT NAME</td>
		<td class="splist2" colspan="3"><input id="p_name" name="p_name" type="text" class="splist" onKeyPress="return hangeulkeyCheck(event)"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT PRICE</td>
		<td class="splist2"><input id="p_price" name="p_price" type="text" class="splist" onKeyPress="return numkeyCheck(event)" numberonly="true"></td>
		<td class="splist">PRODUCT COUNT</td>
		<td class="splist2"><input id="p_count" name="p_count" type="text" class="splist" onKeyPress="return numkeyCheck(event)" numberonly="true"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT COLOR</td>
		<td class="splist2"><input id="p_color" name="p_color" type="text" class="splist"></td>
		<td class="splist">PRODUCT SIZE</td>
		<td class="splist2"><input id="p_size" name="p_size" type="text" class="splist"></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT DESC</td>
		<td colspan="3" class="splist2"><textarea rows="8" cols="50" id="p_desc" name="p_desc"></textarea></td>
	</tr>
	<tr>
		<td class="splist">PRODUCT PHOTO</td>
		<td colspan="3" class="splist2">
			<input id="p_photo" name="file" type="file" style="width: 500px; height: 25px; border-radius: 10px;">
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center" height="60px" style="background-color: #F2F2F2; border-radius: 8px;">
			<input type="submit" id="addPro" value="Add" class="spbutton"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="Cancle" class="spbutton" id="goPList"/>
			<input type="hidden" name="cat_id" id="cat_id"/>
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
	
	
	
	
	
	// JSON.parse : json배열 데이터를 자바스크립트 객체로 변환시켜주는 기능
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
    }
    
 	// 1레벨에 해당하는 대분류를 셀렉트 하는 작업   
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
    });
	/*     여기까지가 카테고리 목록 기능           */
	
	
 	// 카테고리 선택시 상품명 조합하는 부분 (카테고리 대분류, 소분류 선택 완료시 시퀀스와 합쳐서 상품명 쓰는 기능)
    $(document).on("change","select[name='subCategory']",function()
    {        
       	$("#p_no").val(mainCategorySelectBox.val() + "_" + $(this).val() + "_" + $("#p_seq").val());
       	$("#cat_id").val($(this).val());	// cat_id 컬럼에 최상위 카테고리의 값만 저장하도록 한다.
    });
 	
 	
    $('#goPList').on("click", function() 
	{
		location = "/admin/productList";
	});
 	
	
	// 가입하기 위한 유효성 검사
	$('#productadd').on('submit', function()
	{
		//event.preventdefault(); 기존의 효과를 안쓰게 하기 위함
		// 공백일 경우 유효성 검사

		if($.trim($("#mainCategory").val()) == "")
		{
			alert("카테고리를 선택해주세요");
			$("#cat_id").focus();
			return false;
		}
		else if($.trim($("#subCategory").val()) == "")
		{
			alert("하위 카테고리를 선택해주세요");
			$("#cat_id2").focus();
			return false;
		}
		
		else if($.trim($("#p_no").val()) == "")
	    {
			alert("상품번호를 입력해주세요");
			$("#p_no").focus();
			return false;
	    }
		else if ($("#p_no").val().length < 6 || $("#p_no").val().length > 15)
	    {
			alert("상품번호 형식에 맞게 써주세요");
			$("#p_no").focus();
			return false;
	    }
		
		else if($.trim($("#p_name").val()) == "")
	    {
			alert("상품명을 입력해주세요");
			$("#p_name").focus();
			return false;
	    }
		
		else if($.trim($("#p_price").val()) == "")
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
		/* else if($.trim($("#p_desc").val()) == "")
	    {
			alert("상품설명을 입력해주세요");
			$("#p_desc").focus();
			return false;
	    }	 */
		else if($.trim($("#p_photo").val()) == "")
	    {
			alert("상품사진을 업로드해주세요");
			$("#p_photo").focus();
			return false;
	    }	
		
		// 정상적으로 값이 넘어갈 경우 true
		alert("상품 등록이 완료되었습니다.");
		return true;
	});
});
</script>
</body>


</html>