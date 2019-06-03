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
		
		$(".AventPreviewBtn").click(function() {
			   var ev_no = $(this).parents("tr").attr("data-num");
		         $("#ev_no").val(ev_no);
		
		         $("#AventListForm").attr({
		            "method" : "get",
		            "action" : "/event/detail"
		         });
		         $("#AventListForm").submit();
	      });
	});
	
	
	
</script>

</head>
<body>
	관리자 이벤트 조회 입니다~
	
	<div class="Aventcontainer">
		<div class="Avent_header"><h4 id="AEvconTitle">이벤트 검색/조회</h4> <hr /></div>
			
		<div id="AventSearchDiv" class="">	
			<form id="AventSearchForm" >
				<table id="AvnetViewTable" class="table" >
					<caption class="Acaption">이벤트 검색</caption>
					<tr>
						<td class="Avent_td">이벤트명</td>
						<td id="Avent_td_input" class="Avent_tdInput"><input type="text" id="cp_name" placeholder="쿠폰명을 입력하세요" /></td>
						<td class="Avent_td">등록일</td>
						<td id="Avent_td_input" class="Avent_tdInput"><input type="date" id="ev_date" placeholder="쿠폰명을 입력하세요" /></td>
					</tr>
				</table>
				
				<button type="button" id="AventSearchBtn">검색</button>
			</form>
		</div>
		
		<div id="AventList" class="">
			<form id="AventListForm">
				<input type="hidden" name="ev_no" id="ev_no" />
				
				<table id="AventListTable" class="table">
					<caption class="Acation">이벤트 목록</caption>
						<tr>
							<td class="Avent_td">이벤트 번호</td>
							<td class="Avent_td">이벤트명</td>
							<td class="Avent_td">이벤트 내용</td>
							<td class="Avent_td">이벤트 시작일</td>
							<td class="Avent_td">이벤트 종료일</td>
							<td class="Avent_td">이벤트 상태</td>
							<td class="Avent_td">미리 보기</td>
							<td class="Avent_td">수정</td>
						</tr>
						<c:forEach var="evt" items="${AdmineventList}" varStatus="status">
							<tr data-num="${evt.ev_no}">
								<td class="Avent_td">${evt.ev_no}</td>
								<td class="Avent_td">${evt.ev_title}</td>
								<td class="Avent_td">${evt.ev_content}</td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${evt.ev_date}" /></td>
								<td class="Avent_td"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${evt.ev_edate}" /></td>
								<td class="Avent_td">
									<div id="AventSituation">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now}" var="Ave_date"/>
										<fmt:parseNumber var="day" value="${(now.time - evt.ev_edate.time) / (1000*60*60*24) }" integerOnly="true" /> 
										 <c:choose>
											<c:when test="${evt.ev_edate == null}" >
												진행중 | ${day}
											</c:when>
										 	<c:when test="${day < 0 }">
										 		진행 | ${day}
										 	</c:when>
											<c:when test="${day >= 0}">
												끝 | ${day}
											</c:when>
										  </c:choose>	
									</div>
								</td>
								<td class="Avent_td">
									<button type="button" class="AventPreviewBtn">미리보기</button>
								</td>
								<td class="Avent_td">
									<button type="button" class="AventUpdateBtn">수정</button>
							</tr>
							
						</c:forEach>
					
				</table>
			</form>
		
		</div>
		
	</div>
</body>
</html>