<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
   <html>
      <head>
         <meta charset="UTF-8">
         
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
         <meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         
         <title>Insert title here</title>
         
         <!--모바일 웹 페이지 설정-->
         <link rel="shortcut icon" href="../image/icon.png"/>
         <link rel="apple-touch-icon" href="../image/icon.png"/>
      <!--    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> -->
         <!--모바일 웹 페이지 설정 끝-->
         <!--<link rel="stylesheet" type="text/css" href=""/>-->
         
         <!-- 인터넷익스8 이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
         <!-- [if it IE 9] > <script src="js/html5shiv.js"></script><![endif] -->
         <!-- <link rel="stylesheet" type="text/css" href="../js/jquery-1.12.4.min.js">
         <!-- jQuery프레임워크 참조 -->         
           <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
           <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
           <!-- <script type="text/javascript" src="/resources/include/js/common.js"></script> -->
           <script type="text/javascript" src="/resources/include/js/join.js"></script>
           <script type="text/javascript" src="/resources/include/js/login.js"></script>
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
           <script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <!-- <link rel="stylesheet" href="/resources/include/css/default.css"/> -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
            <!-- lightbox 라이브러리 -->
           <!--  <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script> -->
            
            <style>
            	/* #ss{
            	width:100%;
            	height:100%;
            	float:left;} */
            </style>
           <script type="text/javascript">
           
         //로그인화면으로
       	$("#modifyBtn").click(function(){
       		location.href="/member/modify";
       	}); 
           function codeCheck(){
        	   var codeNumber = '<c:out value="${codeNumber}"/>';
        	   if(codeNumber !=''){
        		   switch(parseInt(codeNumber)){
        		   case 1:
        			   		alert("이미 가입된 회원입니다");
        			   		break;
        		   case 2:
        			   		alert("회원 가입처리가 실패하였습니다. \n다시 시도해 주세요.");
        			   		break;
        		   }
        	   }
           }
           
           function execDaumPostcode() {
             new daum.Postcode({
               oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                 // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                 var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
                 }
                 // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                 if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
                 }
                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('mem_zip').value = data.zonecode; //5자리 새우편번호 사용
                 document.getElementById('mem_addr1').value = fullRoadAddr;
                 document.getElementById('mem_addr2').value = data.jibunAddress;
                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                 if(data.autoRoadAddress) {
                   //예상되는 도로명 주소에 조합형 주소를 추가한다.
                   var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                   document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                 } else if(data.autoJibunAddress) {
                     var expJibunAddr = data.autoJibunAddress;
                     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                 } else {
                     document.getElementById('guide').innerHTML = '';
                 }
                 
                
               }
             }).open();
           }
           /* function fn_overlapped(){
               var _id=$("#_member_id").val();
               if(_id==''){
              	 alert("ID를 입력하세요");
              	 return;
               }
               $.ajax({
                  type:"post",
                  async:false,  
                  url:"${contextPath}/member/overlapped.do",
                  dataType:"text",
                  data: {id:_id},
                  success:function (data,textStatus){
                     if(data=='false'){
                  	    alert("사용할 수 있는 ID입니다.");
                  	    $('#btnOverlapped').prop("disabled", true);
                  	    $('#_member_id').prop("disabled", true);
                  	    $('#member_id').val(_id);
                     }else{
                   	  alert("사용할 수 없는 ID입니다.");
                     }
                  },
                  error:function(data,textStatus){
                     alert("에러가 발생했습니다.");ㅣ
                  },
                  complete:function(data,textStatus){
                     //alert("작업을완료 했습니다");
                  }
               });  //end ajax	 
            }	 */
           </script>
			
		</head>
	<body>
	
		<div class="contentContainer" >
			<div class="well"> 
				<form id="memberForm" class="form-jorizontal">
					<input type="hidden" name="mem_email" id="mem_email">
					<input type="hidden" name="pinno" id="pinno">
					
					<div class="form-group form-group-sm">
						<label for="mem_id" class="col-sm-2 control-label">아이디</label>
							<div class="col-sm-3">
								<input type="text" id="mem_id" name="mem_id" maxlength="12" class="form-conrtrol" placeholder="아이디입력"/>
							</div>
							
							<div class="col-sm-2">
								<input type="button" id="idConfirmBtn" value="아이디 중복체크" class="form-control btn-primary">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_pwd" class="col-sm-2 control-label">비밀번호</label>
							<div class="col-sm-3">
								<input type="password" id="mem_pwd" name="mem_pwd" maxlength="15" 
								class="form-control" placeholder="비밀번호입력">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_pwdCheck" class="col-sm-2 control-label">비밀번호 확인</label>
							<div class="col-sm-3">
								<input type="password" id="mem_pwdCheck" name="mem_pwdCheck" 
								class="form-control" maxlength="15" placeholder="비밀번호확인">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="phone" class="col-sm-2 control-label">휴대폰번호</label>
							<div class="col-sm-3">
								<input type="text" id="mem_phone" name="mem_phone" maxlength="15" 
								class="form-control" placeholder="휴대폰 번호">
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_birth" class="col-sm-2 control-label">생년월일</label>
							<div class="col-sm-3">
								<input type="text" id="mem_birth" name="mem_birth" maxlength="6" 
								class="form-control" placeholder="주민등록번호 앞 6자리">
							</div>	
							
							<div class="col-sm-2">
								<input type="text" id="gender" name="gender" maxlength="1"
								class="form-control" placeholder="주민등록번호 7자리중 앞 1자리"/>
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_name" class="col-sm-2 control-label">회원이름</label>
							<div class="col-sm-3">
								<input type="text" id="mem_name" name="mem_name" maxlength="10" 
								class="form-control" placeholder="이름입력">
							</div>	
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_name" class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-3">
								<input type="text" id="mem_email" name="mem_email" maxlength="60"
								class="form-control" placeholder="이메일주소">
							</div>	
							
							<div class="col-sm-2">
								<select id="emailDomain" class="form-control">
									<option value="non">직접입력</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="naver.com">naver.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="nate.com">nate.com</option>
									<option value="google.com">google.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="empal.com">empal.com</option>
									<option value="korea.com">korea.com</option>
									<option value="freechal.com">freechal.com</option>
								</select>
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					
					
					<div class="form-group form-group-sm">
						<label for="phone" class="col-sm-2 control-label">주소</label>
							<div class="col-sm-3">
								 <input type="text" id="mem_zip" name="mem_zip" size="10" > <a href="javascript:execDaumPostcode()">주소검색</a>
								<label>도로명주소 <input type="text" id="mem_addr1" name="mem_addr1" size="50" /></label>
								 <label>지번주소<input type="text" id="mem_addr2" name="mem_addr2" size="50" /></label> 
							</div>
						</div>	
							
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
								<input type="button" value="가입하기" id="joinInsert" class="btn btn-default"/>
								<input type="button" value="초기화" id="joinReset" class="btn btn-default"/>
								<input type="button" value="회원수정테스트" id="modifyBtn" class="btn btn-default"/>
						</div>
					</div>
					
					
				 
				</form>
			</div>
		</div> 
	
	</body>
</html>