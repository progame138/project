<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- 아래 fn:split을 쓰기위해 반드시 명시 -->
<c:set var="email"  value="${fn:split(member.mem_email,'@')}" /> <!-- DB에서 불러오는 풀네임 email값에서 @를 분리시켜줌 -->
<!DOCTYPE html>
   <html>
      <head>
         <meta charset="UTF-8">
         
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
         <meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         
         <title>회원 정보 수정</title>
         
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
          	<!-- <script type="text/javascript" src="/resources/include/js/join.js"></script>
            <script type="text/javascript" src="/resources/include/js/login.js"></script> -->
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
           <script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
           <script type="text/javascript" src="/resources/include/js/modify.js"></script>
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <!-- <link rel="stylesheet" href="/resources/include/css/default.css"/> -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <!-- lightbox 라이브러리 -->
           <!--  <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script> -->
           <script type="text/javascript">
				function codeCheck(){
					var codeNumber = '<c:out value ="${codeNumber}"/>';
					if(codeNumber !=""){
						alert("기존 비밀번호 검증에 실패하였습니다 \n기존 비밀번호를 다시 확인해 주세요");
						}
					
					}
				
		       	loginUserId = "${member.mem_id}";
				function emailCheck(){
					var mem_email = "${email[1]}";
					$("#emailDomain").val(mem_email).prop("selected", "true");
				}
			</script>
		</head>
	<body>
		<div class="contentContainer">
			<div class="well">
				<form id="memberForm" class="form-horizontal">
					<%-- <input type="hidden" name="mem_no" id="mem_no" value="${member.mem_no}"/>
					<input type="hidden" name="mem_email" id="mem_no"> --%>
					
					<div class="form-group form-group-sm">
						<label for="mem_id" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-3">
							${member.mem_id}
						</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="oldUserPwd" class="col-sm-2 control-label">기존 비밀번호</label>
							<div class="col-sm-3">
								<input type="password" id="oldUserPwd" name="oldUserPwd" maxlength="15" 
								class="form-control" placeholder="기존 비밀번호 입력">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_pwd" class="col-sm-2 control-label">변경할 비밀번호</label>
							<div class="col-sm-3">
								<input type="password" id="mem_pwd" name="mem_pwd" maxlength="15" 
								class="form-control" placeholder="변경할 비밀번호 입력">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="userPwdCheck" class="col-sm-2 control-label">비밀번호 확인</label>
							<div class="col-sm-3">
								<input type="password" id="userPwdCheck" name="userPwdCheck" maxlength="15" 
								class="form-control" placeholder="변경할 비밀번호 입력">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_phone" class="col-sm-2 control-label">휴대폰번호</label>
							<div class="col-sm-3">
								<input type="text" id="mem_phone" name="mem_phone" maxlength="15" 
								class="form-control" placeholder="변경할 비밀번호 입력" value="${member.mem_phone}">
							</div>
							
							<div class="col-sm-5">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_phone" class="col-sm-2 control-label">생년월일</label>
							<div class="col-sm-3">
								${member.mem_birth}
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="userName" class="col-sm-2 control-label">회원이름</label>
							<div class="col-sm-3">
								${member.mem_name}
							</div>
					</div>
					
					<div class="form-group form-group-sm">
						<label for="mem_email" class="col-sm-2 control-label">이메일</label>
							<div class="col-sm-3">
								<input type="text" id="mem_email" name="mem_email" maxlength="60" 
								class="form-control" value="${email[0]}">
							</div>
							 <%--  --%>
							
							<div class="col-sm-2">
								<select id="emailDomain" class="form-control">
									<option value="non">직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="hanmail.net">다음</option>
									<option value="nate.com">네이트</option>
									<option value="google.com">구글</option>
									<option value="gmail.com">Gmail</option>
								</select>
							</div>
							
							<div class="col-sm-3">
								<p class="form-control-static error"></p>
							</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<input type="button" value="확인" id="modify"  class="btn btn-default"/>
							<input type="button" value="재작성" id="modifyReset" class="btn btn-default"/>
							<input type="button" value="취소" id="modifyCancel" class="btn btn-default"/>
						</div>
					</div>
					
				</form>
			</div>
		</div>	
	</body>
</html>