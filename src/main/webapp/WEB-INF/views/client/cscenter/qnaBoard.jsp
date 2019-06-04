<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
   			alert("확인");
   			//location.href = "/cscenter/writeForm";
   		});
   		$(".goDetail").click(function(){
   			alert("확인2");
   			//location.href = "/cscenter/qnaDetail";
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
                           <td class="name">${qna.mem_name}</td>
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