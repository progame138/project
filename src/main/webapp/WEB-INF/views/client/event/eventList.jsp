<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 브랜드</title>

<link rel="stylesheet" type="text/css" href="/resources/include/css/eventList.css" />
<script type="text/javascript" src="/resources/include/js/eventList.js" ></script>

</head>
<body>
	<div id="container">
		<div id="eventList">
			<form id="form" name="form d">
				<div id="table">
					<table>
						<tr>
							<!-- 이벤트 제목인  event_tab_A~D를 hover하면 그 제목에 해당하는 이미지로 뜬다. -->
							<td rowspan="4" class="event_Img"><a></a></td>
						</tr>
						<tr>
							<!-- 이벤트 4개 선택하면 그 항목 보이고 선택 안하면 최신별4개 ex: -->
							<td><p><a id="event_tab_A">슈즈스타 혜택 상세보기</a></p></td>
						</tr>
						<tr>
							<td><a id="event_tab_B">출석 체크 이벤트</a></td>
						</tr>
						<tr>
							<td><a id="event_tab_C">성년의 날! 00년생 할인 이벤트</a></td>
						</tr>
						<tr>
							<td><a id="event_tab_D">신규 가입자 혜택 상세보기</a></td>
						</tr>
					</table>
					
					
					<table id="table2">
						<tr>
							<td id="tableB"> <img alt="즉시 할인 상품 바로 보기" src=""> </td>
						</tr>
					</table>
		
					<!-- 
						동적 생성할 event 리스트  : 생성 할 때마다 추가됨. -->
					<%-- 이벤트 리스트 영역 --%>
					<div class="row" id="rowEventArea"></div>
					
				</div>
			</form>
		</div>
	</div>
</body>
</html>