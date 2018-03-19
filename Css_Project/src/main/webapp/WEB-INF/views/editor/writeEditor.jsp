<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>

<title>Insert title here</title>
<script>
	$(document).ready(function(){
		var ckeditor_config = {
				resize_enable : false,
				enterMode : CKEDITOR.ENTER_BR,
				shiftEnterMode : CKEDITOR.ENTER_P,
				filebrowserUploadUrl : '/editor/imageUpload'
			};	
			
			CKEDITOR.replace('editor', ckeditor_config);
	});
</script>
</head>
<body>
<form>
	<textarea rows="5" cols="50" id="editor" name="editor"></textarea>
</form>
<%= request.getRealPath("/") %>
<!-- <script>
	$(function(){
		var ckeditor_config = {
			resize_enable : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P
/* 			filebrowserUploadUrl :  */
		};	
		
		CKEDITOR.replace('editor', ckeditor_config);
	});
</script> -->
</body>
</html>