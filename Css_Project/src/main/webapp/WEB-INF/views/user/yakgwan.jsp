<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/info.jsp"%>
<title>fitDam 약관보기</title>
</head>

<body>
<div>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/nav.jsp" %>
<section>
<br/><br/><br/>
<form name="form" method="get" action="/user/userRegister/">
<table>
	<tr>
   		<th height="50px;" align="center" style="padding: 10px; border-radius: 15px; font-size: 25px; background-color: #002266; color: #FFFFFF;">fitDam 약관동의</th>
   	</tr>
 	<tr align="left">
 		<td align="left" style="background-color: #F2F2F2; border-radius: 15px; padding: 10px;">
 			<br/>
 			<span>가. 수집하는 개인정보의 항목첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해</span><br/>
 			<span>&nbsp;&nbsp;&nbsp;&nbsp;최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.</span><br/>
 			<br/>
 			<span>회원가입</span><br/>
 			<span>- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택)</span><br/>
 			<span>&nbsp;&nbsp;가입인증정보</span></br>
 			<br/>
 			<span>만14세 미만 아동 회원가입 </span><br/>
 			<span>- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택)</span><br/>
 			<span>&nbsp;&nbsp;가입인증정보</span></br>
 			<br/>
 			<span>첫째, 단체아이디 회원가입</span><br/>
 			<span>- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, </span><br/>
 			<span>&nbsp;&nbsp;관리자 연락처, 관리자 부서/직위</span></br>
 			<span>- 선택항목 : 대표 홈페이지, 대표 팩스번호</span><br/>
 			<br/>
 			<span>둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 </span><br/>
 			<span>있습니다.</span></br>
 			<span>- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록</span><br/>
 			<br/>
 			<span>셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당</span><br/>
 			<span>서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며 이러한 경우 별도의 동의를 </span></br>
 			<span>받습니다.</span></br>
 			<br/>
 			<span>넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우</span><br/>
 			<span>아래와 같은정보들이 수집될 수 있습니다.</span><br/>
 			<span>- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택),</span><br/>
 			<span>&nbsp;&nbsp;아이핀 번호(아이핀 이용시), 내/외국인 정보</span><br/>
 			<br/>
 			<span>다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. </span><br/>
 			<span>- 신용카드 결제시 : 카드사명, 카드번호 등</span><br/>
 			<span>- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등</span><br/>
 			<span>- 계좌이체시 : 은행명, 계좌번호 등</span><br/>
 			<span>- 상품권 이용시 : 상품권 번호</span><br/>
 			<br/>
 			<br/>
 			<span>나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.</span><br/>
 			<span>- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청</span><br/>
 			<span>- 협력회사로부터의 제공 </span><br/>
 			<span>- 생성정보 수집 툴을 통한 수집</span>
 			<br/>&nbsp;
 		</td>
 	</tr>
   	
   	<tr>
   		<td height="30px;" style="border-radius: 15px; padding: 10px; background-color: #002266; color: #FFFFFF;">
   			<input type="checkbox" name="req"> 개인정보 수집 및 이용에 동의합니다.
   		</td>
   	</tr>
	
	<tr>
		<td height="50px;" style="border-radius: 15px; padding: 10px; background-color: #F2F2F2; color: #FFFFFF;">
	    	<input style="border-radius: 25px; width:250px; height: 30px; font-size: 18px; background-color: #002266; color: #FFFFFF;" type="button" value="약관에 동의 합니다" onclick="check()"/>&nbsp;&nbsp;&nbsp;
	    	<input style="border-radius: 25px; width:250px; height: 30px; font-size: 18px; background-color: #002266; color: #FFFFFF;" type="button" value="약관에 동의하지 않습니다" onclick="nocheck()"/>
	   </td>
	</tr>	
</table>
</form>	

<script>
	function check()
	{
		 var req = document.form.req.checked;
		 var num = 0;
		 
		 if(req == true)
		 {
		  	num = 1;
		 }
		 
		 if(num==1)
		 {
		  	location.href = "/user/userRegister";
		 }
		 
		 else
		 {
		  	alert("개인정보 약관에 동의하셔야 합니다.");
		 }
	}
	
	function nocheck()
	{
	 	alert("동의하지 않으면 가입하실 수 없습니다");
		location.href = "/";
	}
</script>
</section>
<%@include file="../include/footer.jsp"%>
</div>
</body>
</html>