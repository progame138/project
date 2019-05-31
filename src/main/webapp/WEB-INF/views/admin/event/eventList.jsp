<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 조회</title>

<link rel="stylesheet" href="/resources/include/css/eventList.css" >

</head>
<body>
	관리자 이벤트 조회 입니다~
	
	<div class="Aventcontainer">
		<div class="Avent_header"><h4 id="AEvconTitle">이벤트 검색/조회</h4> <hr /></div>
			
		<div id="AventSearchDiv" class="">	
			<form class="AventSearchForm" >
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
			<form class="AventListForm">
				<table id="AventListTable" class="table">
					<caption class="Acation">이벤트 목록</caption>
						<!--   ev_no, ev_title, ev_content, -- ev_img,  
    ev_date, ev_edate, ev_thumb -->
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
						<c:forEach var="evt" items="${eventList}" varStatus="status">
							<tr>
								<td class="Avent_td">${evt.ev_no}</td>
								<td class="Avent_td">${evt.ev_title}</td>
								<td class="Avent_td">${evt.ev_content}</td>
								<td class="Avent_td">${evt.ev_date}</td>
								<td class="Avent_td">
								
								<%-- <c:if test="evt.ev_date = null And evt.ev_date = ''"></c:if> --%>
										${evt.ev_edate}
								<!-- </td> -->
							</tr>
						</c:forEach>
					
				</table>
			</form>
		
		</div>
		
	</div>
</body>
</html>