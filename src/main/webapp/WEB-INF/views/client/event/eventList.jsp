<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>

<link rel="stylesheet" href="/resources/include/css/eventList.css" >
<script type="text/javascript" src="/resources/include/js/eventList.js" ></script>

<script type="text/javascript">
	/* function(){
		eventThumbnailList()
	}
	*/
// 캐러셀
//섬네일 틀 생성 함수																	//index 생략 가능
	function eventThumbnailList(ev_no, ev_title) {
		// body안에 있는 요소 접근 $("div") || 요소 생성 $("<div>")
																							
		var column = $("<div>");
		column.attr("data-num", ev_no);
		column.addClass("col-sm-6 col-md-4");
			
		var thumbnail = $("<div>");
		thumbnail.addClass("eventThumbnail");
			
			
		var img = $("<img>");
		img.attr("src", "/shoestarStorage/event/thumbnail/"+ev_thumb);
		
			
		// 조립하기
		column.append(thumbnail.append(img));
			
		$("#rowEventArea").append(column);
	} // thumbnailList 끝

</script>

</head>
<body>
	<div id="Container">
	
	
		<div id="EvcontainerTitle"><h2 id="EvconTitle">이벤트</h2></div>
		
		<div id="EventList">
			<form id="EventListform" name="EventListform">
				<div id="EventTable">
					<table id="EvnetViewTable">
						<tr>
							<!-- 이벤트 제목인  event_tab_A~D를 hover하면 그 제목에 해당하는 이미지로 뜬다. -->
							<td rowspan="5" class="Event_td">
								<div id="EventImage">
									<img id="EviewImage" alt="이미지 슬라이드 쇼 = 이미지가 안나오면 이벤트 제목이 나온다.">
								</div>
								
							</td>
						</tr>
					
						<!-- 이벤트 4개 선택하면 그 항목 보이고 선택 안하면 최신별4개 ex: -->
						<c:forEach var="evt" items="${eventList}" varStatus="status" end="3">
							<tr>
								
								<td class="Event_td">
									<a href="#" class="EventTitle">
											
											${evt.ev_title}
										
									</a>
									
								</td>
							</tr>
						</c:forEach>
						
					</table>
					
<!-- 					
					<table id="table2">
						<tr>
							<td id="tableB"><img alt="즉시 할인 상품 바로 보기" src="">즉시 할인 상품 바로 보기</td>
						</tr>
					</table>
		 -->
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