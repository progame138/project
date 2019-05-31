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
<script type="text/javascript"
   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(function() {
	   
	  //검색후 검색 대상과 검색 단어 출력
	   var word= "<c:out value='${data.keyword}'/>";
	      var value = "";
	      if(word!=""){
	         $("#keyword").val("<c:out value='${data.keyword}'/>");
	         $("#search").val("<c:out value='${data.search}'/>");
	         
	         if($("#search").val()!='b_content'){
	            //contains()는 특정 텍스트를 포함한 요소 반환
	            if($("#search").val()=='b_title') value = "#list tr td.goDetail";
	            else if($("#search").val()=='b_name') value = "#list tr td.name";
	            $(value+":contains('"+word+"')").each(function() {
	               //정규표현식
	               var regex = new RegExp(word,'gi');
	               $(this).html($(this).html().replace(regex,
	                     "<span class='required'>"+word+"</span>"))
	            });
	         } 
	    }
	   
      $("#insertFormBtn").click(function() {
         location.href = "/board/writeForm";
      });
	 
      $(".goDetail").click(function() {
         var b_num = $(this).parents("tr").attr("data-num");
         $("#b_num").val(b_num);

         $("#boardList").attr({
            "method" : "get",
            "action" : "/board/boardDetail"
         });
         $("#boardList").submit();
      });
      
      $("#searchData").click(function() {
         if($("#search").val()!="all"){
            if(!chkData("#keyword","검색어를")) return
         }
         $("#f_search").find("input[name='pageNum']").val("1");
         goPage();
      });
      
      $(".paginate_button a").click(function(e){
    	 e.preventDefault();
    	 $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
    	 goPage();
      });
   });
   function goPage() {
      if($("#search").val()=="all"){
         $("#keyword").val("");
      }
      $("#search").attr({
         "method" : "get",
         "action" : "/board/boardList"
      });
      $("#f_search").submit();
   }
   
</script>
<style>
	.required{color : blue;}
</style>
</head>
<body>
   <div class="contentContainer">
      <div class="contentTit text-center">
         <h1>게시판 리스트</h1>
      </div>
      <form id="qnaList">
        
      </form>
      <%--검색 div 시작 --%>
      <div id=qnaSearch" class="text-right">
         <form id="f_search" name="f_search" class="form-inline">
           	<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
           	<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
            <div class="form-group">
               <label>검색조건  </label>
               <select id="search" name="search" class="form-control">
                  <option value="mem_name">작성자</option>
               </select> 
               <input type="text" placeholder="검색어를 입력해주세요" id="keyword"
                  name="keyword" class="form-control"> 
               <input type="button"
                  value="검색" class="btn btn-primary" id="searchData">
            </div>
         </form>
      </div>
      <%--============리스트 시작=========== --%>
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
                  <th data-value="b_num" class="order">글번호</th>
                  <th>글제목</th>
                  <th data-value="b_date" class="order">작성일</th>
                  <th class="borcle">작성자</th>
               </tr>
            </thead>
            <tbody id="list">
               <!-- 데이터 출력 -->
               <c:choose>
                  <c:when test="${not empty boardList}">
                     <c:forEach var="board" items="${boardList}" varStatus="status">
                        <tr class="tac" data-num="${board.b_num}">
                           <td>${board.b_num}</td>
                           <td class="goDetail tal">${board.b_title}&nbsp;<c:if
                                 test="${board.r_cnt>0}">
                                 <span>[${board.r_cnt}]</span>
                              </c:if></td>
                           <td>${board.b_date}</td>
                           <td class="name">${board.b_name}</td>
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
   <%--============================리스트 종료========================== --%>
	
   <%-- 페이징 처리 --%>
   <div class="text-center">
   		<ul class="pagination">
   			<c:if test="${pageMaker.prev}">
   				<li class="paginate_button" previous>
   					<a href="${pageMaker.startPage -1}">Previous</a>
   				</li>
   			</c:if>
   			
   			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
   				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
   					<a href="${num}">${num}</a>
   				</li>
   			</c:forEach>
   			
   			<c:if test="${pageMaker.next}">
   				<li class="paginate_button next">
   					<a href="${pageMaker.endPage +1}">Next</a>
   				</li>
   			</c:if>
   		</ul>
   </div>
   <%--=========================글쓰기 버튼 출력 시작========================= --%>
   <div class="contentBtn">
      <input type="button" value="글쓰기" id="insertFormBtn"
         class="btn btn-primary">
   </div>
   <%--=========================글쓰기 버튼 출력 종료========================= --%>
</body>
</html>