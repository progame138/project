<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
									
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 조회</title>

<link rel="stylesheet" href="/resources/include/css/eventList.css" >
<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>


<script type="text/javascript">
	$(function() {
		  //검색후 검색 대상과 검색 단어 출력
		   //var word= "<c:out value='${data.keyword}'/>";
		  // var value = "";
		  // if(word!=""){
		//	  $("#keyword").val("<c:out value='${data.keyword}'/>");
		//	  $("#search").val("<c:out value='${data.search}'/>");
		//	 
	 	// }
		
		
		// 미리보기 선택
		$(".AventPreviewBtn").click(function() {
			   var ev_no = $(this).parents("tr").attr("data-num");
		         $("#ev_no").val(ev_no);
		
		         $("#AventListForm").attr({
		            "method" : "get",
		            "action" : "/event/detail"
		         });
		         $("#AventListForm").submit();
	      });
		
		// 수정하기 선택 (미완)
		$(".AventUpdateBtn").click(function() {
			 var ev_no = $(this).parents("tr").attr("data-num");
	         $("#ev_no").val(ev_no);
	
	         $("#AventListForm").attr({
	            "method" : "get",
	            "action" : "/admin/event/update"
	         });
	         $("#AventListForm").submit();
		});
		
	      $("#insertFormBtn").click(function() {
		         location.href = "/admin/event/writeForm";
		      });
		
	}); // function
	
	 /* 검색을 위한 실질적인 처리 함수 */
	   function goPage() {
	      if($("#search").val()=="all"){
	         $("#keyword").val("");
	      }
	      $("#search").attr({
	         "method" : "get",
	         "action" : "/admin/event/eventList"
	      });
	      $("#AventSearchForm").submit();
	   }
	   
	
	
	
</script>

</head>
<body>
	<div class="Aventcontainer">
		<div class="Avent_header"><h2 id="AEvconTitle">이벤트 관리
		<input type="button" value="새로 만들기" id="insertFormBtn" /> 
		</h2>
				
		 <hr /></div>
			
		<!-- 검색 기능 -->
		<div id="AventSearchDiv" class="">	
			<form id="AventSearchForm" >
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
           		<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
           		
           		
      			<table id="AvnetViewTable" class="table" >
					<caption class="Acaption">이벤트 검색</caption>
					<tr>
						<td class="Avent_td gray" id="Aev_no">이벤트 번호</td>
						<td class="Avent_tdInput"><input type="text" id="no_text" class="keyword" placeholder="이벤트번호을 입력하세요" size="50" /></td>
					</tr>
					<tr>
						<td class="Avent_td gray" id="Aev_title">이벤트명</td>
						<td class="Avent_tdInput"><input type="text" id="name_text" class="keyword" placeholder="이벤트명을 입력하세요" size="50" /></td>
					</tr>
					<tr>	
						<td class="Avent_td gray" id="Aev_date">등록일</td>
						<td class="Avent_tdInput"><input type="date" id="date_text" class="keyword" placeholder="이벤트 등록날짜를 입력하세요" /></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="button" id="searchData" value="검색" />
						</td>
					</tr>
				</table>
      		
			</form>
			 </div>
		
		
		<div id="AventList" class="">
			<form id="AventListForm">
				<input type="hidden" name="ev_no" id="ev_no" />
				
				<table id="AventListTable" class="table">
					<caption class="Acaption">이벤트 목록</caption>
						<tr>
							<td class="Avent_td bgray tdW">번호</td>
							<td class="Avent_td bgray">이벤트명</td>
							<td class="Avent_td bgray">이벤트 내용</td>
							<td class="Avent_td bgray">이벤트 시작일</td>
							<td class="Avent_td bgray">이벤트 종료일</td>
							<td class="Avent_td bgray tdW">상태</td>
							<td class="Avent_td bgray tdW">미리 보기</td>
							<td class="Avent_td bgray tdW">수정</td>
						</tr>
						<c:forEach var="evt" items="${AdmineventList}" varStatus="status">
							<tr class="daNum" data-num="${evt.ev_no}">
								<td class="Avent_td tdW">${evt.ev_no}</td>
								<td class="Avent_td">${evt.ev_title}</td>
								<td class="Avent_td">${evt.ev_content}</td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${evt.ev_date}" /></td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${evt.ev_edate}" /></td>
								<td class="Avent_td tdW">
									<div id="AventSituation" class="tdW">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now}" var="Ave_date"/>
										<fmt:parseNumber var="day" value="${(now.time - evt.ev_edate.time) / (1000*60*60*24) }" integerOnly="true" /> 
										 <c:choose>
											<c:when test="${evt.ev_edate == null}" >
												&nbsp;진행중<%--  | ${day} --%>&nbsp;
											</c:when>
										 	<c:when test="${day < 0 }">
										 		&nbsp;진행중<%--  | ${day} --%>&nbsp;
										 	</c:when>
											<c:when test="${day >= 0}">
												&nbsp;끝<%--  | ${day} --%>&nbsp;
											</c:when>
										  </c:choose>	
									</div>
								</td>
								<td class="Avent_td">
									<button type="button" class="AventPreviewBtn tdW">미리보기</button>
								</td>
								<td class="Avent_td">
									<button type="button" class="AventUpdateBtn tdW">수정</button>
							</tr>
							
						</c:forEach>
						
				</table>
			</form>
		
		</div>
			
	</div>
</body>
</html>