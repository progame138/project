<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로  html을 보여주도록 설정 -->
<meta name="viewport"
   content="width=device-width initial-scale=1.0,
      maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!-- viewport : 화면에 보이는 영역을 제어하는 기술.
      width는 device-width로 설정. initial-scale는 초기비율 -->
<!-- IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
<!-- 만약 lt IE 9보다 낮다면 script html5shiv.js를 읽어와 적용하라 -->
<!-- [if lt IE 9]>
         <script src="../js/html5shiv.js"></script>
      <![endif] -->
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />
<link rel="stylesheet"
   href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="/resources/include/dist/css/bootstrap-theme.min.css">
<!--모바일 웹 페이지 설정 끝 -->
  <link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
     <link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript"
   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(function() {
   		$("#insertFormBtn").click(function(){
   			location.href = "/cscenter/writeForm";
   		});
   });
</script>
<style>
	.required{color : blue;}
</style>
</head>
<body>
  <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">자주묻는질문</li>
              <li class="active"><a href="/cscenter/faqList?fc_no=1">-주문/결제</a></li>
              <li><a href="/cscenter/faqList?fc_no=2">-취소/반품</a></li>
              <li><a href="/cscenter/faqList?fc_no=3">-상품/배송</a></li>
              <li><a href="/cscenter/faqList?fc_no=4">-이벤트</a></li>
              <li><a href="/cscenter/faqList?fc_no=5">-기타</a><hr></li>
              <li class="nav-header"><a href="/cscenter/qnaBoard">1:1 게시판</a><hr></li>
              <li class="nav-header"><a href="/cscenter/provision?p_no=2">개인정보처리지침</a><hr></li>
              <li class="nav-header"><a href="/cscenter/provision?p_no=1">이용약관</a></li>
            </ul>
          </div>
        </div>
       <!-- faq리스트 -->
       
      <div class="container-fluid">
      <div class="row-fluid">
        <div class="span9">
          <!-- 리스트시작 -->
         <div id="boardList">
         <table summary="게시판리스트" class="table table-striped">
            <colgroup>
               <col width="10%" />
               <col width="62%" />
               <col width="15%" />
               <col width="13%" />
            </colgroup>
            <thead>
               <tr>
                  <th data-value="qna_ctgr" class="order">분류</th>
                  <th>글제목</th>
                  <th data-value="qna_date" class="order">작성일</th>
                  <th data-value="mem_name">작성자</th>
               </tr>
            </thead>
            <tbody id="list">
               <!-- 데이터 출력 -->
               <c:choose>
                  <c:when test="${not empty qnaList}">
                     <c:forEach var="qna" items="${qnaList}" varStatus="status">
                        <tr class="tac" data-num="${qna.qna_no}" data-num2="${qna.mem_no}">
                           <td>${qna.qna_ctgr}</td>
                           <td class="goDetail tal">${qna.qna_title}</td>          
                           <td>${qna.qna_date}</td>
                           <td class="name">${qna.mem_id}</td>
                        </tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <tr>
                        <td colspan="4" class="tac">등록된 게시물이 없습니다.</td>
                     </tr>
                  </c:otherwise>
               </c:choose>
            </tbody>
         </table>
      </div>
   </div>
      <div class="contentBtn text-right">
      		<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-primary">
  	  </div>
      <hr>
     </div> 
    </div><!--/.fluid-container-->
	</div>
	</div>
	
    
</body>
</html>