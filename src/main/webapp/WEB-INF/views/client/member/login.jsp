<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
           <script type="text/javascript" src="/resources/include/js/pwdPattern.js"></script>
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <link rel="stylesheet" href="/resources/include/css/default.css"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <!-- lightbox 라이브러리 -->
            <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
           <script type="text/javascript">
           $(function(){
        		codeCheck();
        		$('#mem_id, #mem_pwd').bind("keyup", function(){
        			$(this).parents("div").find("error").html("");
        		});
        		//로그인 버튼 클릭시 처리 이벤트
        		$("#loginBtn").click(function(){
        			if(!formCheck($('#mem_id'), $('.error:eq(0)'), "아이디를")) return;
        			else if(!inputVerify(0,'#mem_id','error:eq(0)')) return;
        			else if(!formCheck($('#mem_pwd'),$('.error:eq(1)'), "비밀번호를")) return;
        			else if(!inputVerify(1,'#mem_pwd', '.error:eq(1)')) return;
        			else{
        				$("#loginForm").attr({
        					"method":"POST",
        					"action":"/member/login"
        				});
        				$("#loginForm").submit();
        			}
        		});
        		
        		//회원가입 버튼 클릭시 처리 이벤트
        		$("#signUpBtn").click(function(){
        			location.href="/member/signUp";
        		});
        	});
           
           //에러코드체크
           function errorCodeCheck(){
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
		ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎ
	</body>
</html>