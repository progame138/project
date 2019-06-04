<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>공지사항 페이지에 오신것을 환영합니다.</title>
		<!-- 3. 공지사항 페이지 -->
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		<link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
		
    	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      	<script type="text/javascript" src="/resources/include/js/searchNotice.js"></script>
      	
      	<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
     	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<style>
		
				/*사이드 바 */
			body {
			  margin: 0;
			  font-family: "Lato", sans-serif;
			}
			
			.sidebar {
			  margin-left: -240px;
			  padding: 0px;
			  width: 200px;
			  background-color: #f1f1f1;
			  position: fixed;
			  height: 100%;
			  overflow: auto;
			}
			
			.sidebar a {
			  display: block;
			  color: black;
			  padding: 16px;
			  text-decoration: none;
			}
			 
			.sidebar a.active {
			  background-color: #4CAF50;
			  color: white;
			}
			
			.sidebar a:hover:not(.active) {
			  background-color: #555;
			  color: white;
			}
				
				table{
					line-height:1.8;
					font-size:17px;
					width:100%;
					margin:50px 70px;
				}
				#insertFormBtn{
					float:right;}
					.cnt{color:red;}
				h3{
					text-align: center;
				}
				th{
					text-align: center;
				}
					
				#boardsearch{
					float:right;}
				.required{
					color:red;}
				
				
				.noticeList{
					margin-left: 50px;
				}
			</style>
		
		<script type="text/javascript">
			$(function () {
				
				//제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트
				$(".goDetail").click(function(){
					var no_no = $(this).parents("tr").attr("data-num")
					$("#no_no").val(no_no);
					console.log("글번호 : "+no_no);
					//상세 페이지로 이동하기 위해 form추가 (id=detailForm)
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/brand/noticeDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
	    		$("#searchData").click(function(){
	    			if($("#search").val()!="all"){
	    				if($("#keyword").val().replace(/\s/g,"")==""){
	    					alert("검색어를 입력해 주세요.");
	    					$("#keyword").val("");
	    					$("#keyword").focus();
	    				}
	    					return false;
	    			}
	    			goPage();
	    		});
				
	    		/* 검색대상이 변경될 때마다 처리 이벤트 */
	    		$("#search").change(function(){
	    			if($("#search").val()=="all"){
	    				$("#keyword").val("전체 데이터 조회합니다.");
	    			}else if($("#searh").val()!="all"){
	    				$("#keyword").val("");
	    				$("#keyword").focus();
	    			}
	    		});
	    		
	    		/* 검색 버튼 클릭 시 처리 이벤트 */
	    		$("#searchData").click(function(){
	    			if($("#search").val()=="all"){
	    				if(!chkData("#keyword","검색어를")) return;
	    			}
	    			return;
	    		});
	    		
	    		/* 검색을 위한 실질적 처리 함수 */
    	    	function goPage(){
    	    		if($("#search").val()=="all"){
    	    			$("#keyword").val("");
    	    		}
    	    		$("#f_search").attr({
    	    			"method":"get",
    	    			"action":"/brand/noticeList"
    	    		});
    	    		$("#f_search").submit();
    	    	}
				
			}); /* 최상위 fun 종료*/
				
				
		</script>
		
	</head>
	
	<body>
		<div class="contentContainer container">
		<!-- 사이드 바  -->
			<div class="sidebar">
			  <a class="active" href="/brand/brandMain">메인</a>
			  <div class="dropdown">
			    <button class="dropbtn">브랜드 소개 </button>
			    <div class="dropdown-content">
			      <a href="#">브랜드 가치</a>
			      <a href="#">브랜드 기능</a>
			      <a href="#">브랜드 뉴스</a>
			    </div>
			  </div>
			  
			  <a href="/brand/collectionIntro">컬렉션 소개</a>
			  <a href="/brand/noticeList">공지사항</a>
			</div>
			<div class="contentTit"><h3>공지사항</h3></div>
			
			<form id="detailForm">
				<input type="hidden" id="no_no" name="no_no"/>
				<!-- 상세페이지에서 리스트 이동시 보던 전 페이지로 이동하기 -->
				<%--<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">--%> <!-- (pageDTO) 글번호 가져오기 -->
				<%--<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">--%>
			</form>
			
			<!-- 검색기능 시작 -->
			<div id="boardsearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline"> 
					<%-- <input type="hidden" name="pageNum" value="${pageMaker.nvo.pageNum}"> <!-- (pageDTO) 글번호 가져오기 -->
					<input type="hidden" name="amount" value="${pageMaker.nvo.amount}"> --%>
						<div class="form-group">
							<label style="font-size:16px">검색조건</label>
							<select id="search" name="search" class="form-control">
								<option value="all" id="goDetail">전체</option>
								<option value="b_title" id="goDetail">제목</option>
								<option value="b_content" id="goDetail">내용</option>
								<option value="b_name" id="goDetail">말머리</option>
							</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요"  class="form-control" width="5px">
						<button type="button" id="searchData"class="btn btn-success">검색</button>
					</div>
				</form>
			</div>
			
			<%--==================리스트 시작=================== --%>	
			<div id="noticeList">
			<table class="table-striped" summary="게시판 리스트">
				<thead>
					<tr>
						<th data-value="no_no" class="order"> 번호</th>
						<th>말머리</th>
						<th data-value="no_subject" class="order">제목</th>
						<th class="borcle">내용</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				
				<tbody id="list">
					<!-- 데이터출력 -->
					<c:choose>
						<c:when test="${not empty notice}">
							<c:forEach var="notice" items="${notice}" varStatus="status">
								<tr class="tac" data-num="${notice.no_no}">
									<td>${notice.no_no}</td>
									<td>${notice.no_kind}</td>
									<td class="goDetail tal" id="goDetail">${notice.no_subject}</td>
									<td id="goDetail" class="goDetail">${notice.no_content}</td>
									<td id="goDetail" class="goDetail">${notice.adm_no}</td>
									<td class="name" id="goDetail">${notice.no_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac"> 등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</div>
		</div>
	</body>
</html>