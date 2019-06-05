<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
   <html>
      <head>
         <meta charset="UTF-8">
         
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
         <meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         
         <title>로그인</title>
         
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
           <script type="text/javascript" src="/resources/include/js/login.js"></script>
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
           
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <!-- <link rel="stylesheet" href="/resources/include/css/default.css"/> -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            
           
            
            <style>
            	#loginAfter{
            	font-size:14px;}
            </style>
            <!-- lightbox 라이브러리 -->
            <!-- <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script> -->
           <script type="text/javascript">
         
           //에러코드체크
           function codeCheck(){
        	   var codeNumber = '<c:out value = "${codeNumber}"/>';
        	   if(codeNumber != ""){
        		   //명확한 자료형 명시를 위해 codeNumber의 타입을 정수형으로 변환
        		   switch(parseInt(codeNumber)){
        		   case 1:
        			   alert("아이디 또는 비밀번호가 일치하지 않거나, 존재하지 않는 회원입니다. \n다시 로그인을 시도해주세요.");
        			   break;
        		   }
        	   }
           }
			</script>
		</head>
	<body>
		<div class="contentContainer">
		<div class="well">
			<c:if test="${login.mem_id == null or login.mem_id == ''}"> 
			<form id="loginForm" class="form-horizontal">
			  
			  <div class="form-group">
			    <label for="mem_id" class="col-sm-2 control-label">아이디</label>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="mem_id" name ="mem_id" placeholder="아이디입력">
			    </div>
			    <p class="form-control-static error"></p>
			  </div>
			  
			  <div class="form-group">
			    <label for="mem_pwd" class="col-sm-2 control-label">비밀번호</label>
			    <div class="col-sm-3">
			      <input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="비밀번호 입력">
			    </div>
			    <p class="form-control-static error"></p>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <div class="checkbox">
			        <label>
			          <input type="checkbox"> 로그인정보 저장
			        </label>
			      </div>
			    </div>
			  </div>  
			  
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-6">
			      <input type="button" value="로그인" id="loginBtn" class="btn btn-default"/>
			      <input type="button" value="회원가입" id="joinBtn" class="btn btn-default"/>
			    </div>
			  </div>
		  </form>
		  </c:if>
		  
		  <c:if test="${login.mem_id != null and login.mem_id != ''}">
		  	<fieldset id="loginAfter">
		  		<legend>[${login.mem_name}]님 어서오세요. <br>슈즈스타에 오신것을 환영합니다!</legend>
			  		<span id="memberMenu" class="tac">
			  			<a href="/member/logout">로그아웃</a>
			  			<a href="/member/modify">정보수정</a>
			  			<a href="/member/delete">회원탈퇴</a>
			  		</span>
		  	</fieldset>
		  </c:if>
		 </div>
		 </div>
	</body>
</html>