<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>고객센터</title>

    <!-- 스타일 -->
    <link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
    
    
    <script ></script>
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
      img{width:140px; height:140px; }
      a{text-decoration: none;}
    </style>
    <link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- IE6~8에서 HTML5 태그를 지원하기위한 HTML5 shim -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
  </head>

  <body>
  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">ShoeStar</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              <a href="#" class="navbar-link"></a> 로그인됨
            </p>
            <ul class="nav">
              <li class="active"><a href="#">남자</a></li>
              <li><a href="#about">여자</a></li>
              <li><a href="#contact">고객센터</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">자주묻는질문</li>
              <li class="active"><a href="#">-주문/결제</a></li>
              <li><a href="#">-취소/반품</a></li>
              <li><a href="#">-상품/배송</a></li>
              <li><a href="#">-이벤트</a></li>
              <li><a href="#">-기타</a><hr></li>
              <li class="nav-header">1:1 게시판<hr></li>
              <li class="nav-header">개인정보처리지침<hr></li>
              <li class="nav-header">이용약관</li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">
          <div>
           	<figure>
           		<img src="/resources/images/cscenter/notice.png" class="img-polaroid"/>
           		<figcaption><a href="#">공지사항</a></figcaption>
           	</figure>
          	
          </div>
          
          <!-- <div class="entry">
   				<figure><img src="image2/print-02.jpg" alt="Passiflora" />
   					<figcaption>시계꽃<span>(Passiflora)</span></figcaption>
   				</figure>
   			</div>
           	 -->
          <div>	
          	<img src="/resources/images/cscenter/event.png" class="img-polaroid">
          	<a href="#">이벤트</a>
          </div>
          <div>	
           	<img src="/resources/images/cscenter/delivery.png" class="img-polaroid">
          	<a href="#">주문/배송현황</a>
          </div>
          <div>	
           	<img src="/resources/images/cscenter/one_one.png" class="img-polaroid">
          	<a href="#">1:1문의</a>
          </div> 	
           	
          </div>
          <div id="boardList">
          	<h2 style="font-weight:lighter;">공지사항</h2><hr>
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
               
            </tbody>
         </table>
      </div>
   </div>
        </div><!--/span-->
      </div><!--/row-->
	
  </body>
</html>
