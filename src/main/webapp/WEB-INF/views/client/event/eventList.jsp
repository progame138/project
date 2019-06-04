<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>이벤트</title>


      
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	  <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

	  <link rel="stylesheet" href="/resources/include/css/eventList.css" >
	  <script type="text/javascript" src="/resources/include/js/eventList.js" ></script>

	  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js" ></script>
      <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>


	<style type="text/css">
		img{width: 500px; height: 400px;}
		li{list-style: none; }
	</style>

	<script type="text/javascript">
		 $(function(){
			
			$(".EventTitle").click(function() {
				   var ev_no = $(this).parents("tr").attr("data-num");
					
			         $("#ev_no").val(ev_no);
			
			         $("#EventListform").attr({
			            "method" : "get",
			            "action" : "/event/detail"
			         });
			         $("#EventListform").submit();
		      });
			
			$(".EventTitle").hover(function(){
				var ss = $(this).attr("data-thumb");
				//console.log(ss);
				var uThumb = "/shoestarStorage/event/"+ss;
				
				$(this).parents().find(".item").find("img").attr("src",uThumb);
				
				$("li").css("list-style","none");
				
				$(this).parent().css("list-style","disc");
			});
		
		}); // function 종료
	
		 
		/*  function listData(){
			 $(${eventList}).each(function() {
					var ev_title = this.ev_title;
					var ev_content = this.ev_content;
					var ev_thumb = this.ev_thumb;
					var ev_file = this.ev_file;
					var ev_date = this.ev_date;
					var ev_edate = this.ev_edate;
   			
   				
   				thumbnailList(ev_no, ev_title, ev_content, ev_thumb, ev_file, ev_date, ev_edate);

   			});
   			
   		}).fail(function() {
   			alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
   		});
		 */
		 
		   // 섬네일 틀 생성 함수			// 카페서 작업 ★★														
		 function thumbnailList(ev_no, ev_title, ev_content, ev_thumb, ev_file, ev_date, ev_edate) {
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
		  	}  // thumbnailList 끝
			
	
	</script>

	</head>
<body>
	<div id="Container">
	
	
		<div id="EvcontainerTitle"><h2 id="EvconTitle">이벤트</h2></div>
		
		<div id="EventList">
			<form id="EventListform" name="EventListform">
				<div id="EventTable">
					
				<input type="hidden" name="ev_no" id="ev_no" />
					
					<table id="EvnetViewTable">
						<tr>
							
							<!-- 시작 -->
							
							<!-- 이벤트 제목인  event_tab_A~D를 hover하면 그 제목에 해당하는 이미지로 뜬다. -->
							<td rowspan="5" class="Event_td">

									<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
									
									  <ol class="carousel-indicators">
									    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
									  </ol>
							
									  <div class="carousel-inner" role="listbox">
									  	
									  	
										<c:forEach var="evt" items="${eventList}" varStatus="status" end="3">
									  
									  	  <c:choose>
										  		<c:when test="${evt.ev_no == 2}">
											    <div class="item">
												      <a class="EventImage" href="/event/detail?ev_no=${evt.ev_no}">
												      		<img src="/shoestarStorage/event/${evt.ev_thumb}" alt="...">
												      </a>
											    </div>
											    </c:when>
											    
											    <c:otherwise>
											    <div class="item active">
											      <a class="EventImage" href="/event/detail?ev_no=${evt.ev_no}">
											      		<img src="/shoestarStorage/event/${evt.ev_thumb}" alt="...">
											      </a>
											    </div>
										    	</c:otherwise>
									    	</c:choose>
										 </c:forEach>
																			   	
									  </div>
									
									 
									  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
									    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									    <span class="sr-only">Previous</span>
									  </a>
									  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
									    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									    <span class="sr-only">Next</span>
									  </a>
									</div>									
					
							
							<!-- 끝 -->
							</td>
						</tr>
					
						<!-- 이벤트 4개 선택하면 그 항목 보이고 선택 안하면 최신별4개 ex: -->
						<c:forEach var="evt" items="${eventList}" varStatus="status" end="3">
							<tr class="evtno" data-num="${evt.ev_no}">
								
								<td class="Event_td">
									<ul>
										<li>
											<a class="EventTitle" data-thumb="${evt.ev_thumb}">
													${evt.ev_title}							
											</a>
										</li>
									</ul>
									
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
		 
				</div>
			</form>
		</div>
		
		 			<%-- 페이징 처리를 위한 FORM --%>
					<form  name="f_search" id="f_search"></form>
					<!-- 
						동적 생성할 event 리스트  : 생성 할 때마다 추가됨. -->
					<%-- 이벤트 리스트 영역 --%>
					<div class="row" id="rowEventArea"></div>
	</div>
</body>
</html>