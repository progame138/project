<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세 페이지</title>

<style type="text/css">
	#htitle{text-align: center;}
	.gray{color: gray;}
	.Dinline{display: inline;}
	.Dblock{display: inline-block;}
	#ev_title{font-size: 20px; font-weight: bold;}
	#EDetail_title{margin-bottom: 10px; margin-top: 20px;}
	.Eventimage{width: 80%; height: 80%;}
	
	#Event_note{ }
	#Event_note_title{font-size: 20px; font-weight: bold;}
	#Event_note_title:{}
	#ev_img{size: 500px;}
	hr {color: black; width: 70%; float: left;}
	#ev_content{float: left;}
</style>

<script type="text/javascript">
	$(function() {
		$("#ev_content").hide();
		
		
		$("#Event_note_title").click(function(){
			$("#ev_content").toggle();
		});
		
		var img = $("<img>");
			img.attr({"src":"/shoestarStorage/event/${detail.ev_img}",
					  "alt":"${detail.ev_title}"});
			img.addClass("Eventimage");
			$("#ev_img").append(img);
	});
</script>
</head>
<body>
	<div id="container">
		<div id="title">
			<h1 id="htitle">이벤트</h1>
		<div id="EDetail_title">
			<div id="ev_title" class="Dinline">
				${detail.ev_title}
			</div>
				 <span class="gray" style="font-size: 20px">|</span> 
			<div id="ev_date" class="Dinline">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${detail.ev_date}" />
			</div>
				 ~ 
			<div id="ev_edate" class="Dblock">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${detail.ev_edate}" />
			</div>
		</div>
		</div>
		
		
		<div id="ev_img">
		
		</div>
		
		<br />
		
		<div id="Event_note">
			<div id="Event_note_title">
				유의 사항
			</div>
			
			<hr />
			<br />
			<div id="ev_content">
					${detail.ev_content}
			</div>
			
		</div>
		
	
	</div>
</body>
</html>