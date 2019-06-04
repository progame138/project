<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>Title</title>
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		
		<script type="text/javascript" src="/resources/include/js/searchNotice.js"></script>
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
           <script type="text/javascript">
           var message="",btnkind="";
           $(function(){
        	   
               var no_no = ${detail.no_no};
               listAll(no_no);
               
               if(!$("#replyInsertBtn").attr("data-button")){
            	   $("#replyInsertBtn").attr("data-button", "insertBtn");
               }
               
               $("#replyInsertFormBtn").click(function(){
            	   setModal("댓글 등록", "insertBtn", "등록");
            	   dataReset();
            	   $('#replyModal').modal();
               });
               
               //글 입력을 위한 Ajax 연동 처리
               
               $(document).on("click", "button[data-button='insertBtn']", function(){
               	//작성자 이름에 대한 입력여부 검사
                  if(!checkForm("#re_content", "댓글 내용을")) return;
                  else{
                     var insertUrl = "/replies/replyInsert";
                     
                     //글 저장을 위한 Post방식의 Ajax 연동 처리
                     $.ajax({
                        url : insertUrl,   //전송 url
                        type : "post",   //전송시 method 방식
                        headers : {
                           "Content-Type" : "application/json",
                           "X-HTTP-Method-Override" : "POST"
                        },
                        dataType : "text",
                        data : JSON.stringify({ //서버측에 전달할 값은 json이다
                           no_no:no_no,
                           re_content:$("#re_content").val()
                        }),
                        error : function(){//실행 시 오류가 발생하였을 경우
                           alert("시스템 오류입니다. 관리자에게 문의하세요");
                        },
                        success : function(result){
                           if(result=="SUCCESS"){
                              alert("댓글 등록이 완료되었습니다.");
                              dataReset();
                              $('#replyModal').modal('hide');
                              listAll(no_no);
                           }
                        }
                     });
                  }
               });
               
            
          //댓글 수정 및 삭제 ajax 연동 처리
            $(document).on("click", "button[data-btn]", function(){
            	$(".btn").parents("div.panel .panel-heading .pwdArea").remove();
            	$(this).parents("div.panel .panel-heading").append(pwdView());
            	btnkind = $(this).attr("data-btn")
            	console.log("클릭 버튼 btnkind : " + btnkind);
            });
        
                 $(document).on("click", "button[data-button='updateBtn']", function(){
                   	 //console.log("수정버튼");
                   	 var re_no = $("input[name='re_no']").val();
                   	 if(!checkForm("#re_content", "댓글내용을"))return;
                   	 else{
                   		 $.ajax({
                                url:"/replies/" + no_no,
                                type:'put',
                                headers:{
                               	 "Content-Type":"application/json",
                                   "X-HTTP-Method-Override" : "PUT"},
                                data:JSON.stringify({
                               	 r_content:$("#r_content").val()
                               	 }),
                                   dataType:'text',
                                   error:function(){
                                   	alert('시스템 오류입니다. 관리자에게 문의하세요');
                                   },
                                   success:function(result){
                                   	console.log("result: " + result);
                                   	if(result == "SUCCESS"){
                                   		alert("수정이 완료되었습니다.")
                                   		$('#replyModal').modal('hide');
                                   		listAll(b_num);
                                   	}
                                   }
                                });
                   		 }
                    });

             
            });//최상위 $종료.
            
        	/* 글 삭제를 위한 ajax 연동 처리 */
       	 function deleteBtn(no_no, re_no){
       		 if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
                    $.ajax({
                       url:"/replies/" + re_no,
                       type:"delete",
                       headers:{
                          "X-HTTP-Method-Override" : "DELETE"
                       },
                       dataType:"text",
                       error:function(){
                          alert("시스템 오류입니다. 관리자에게 문의하세요");
                       },
                       success:function(result){
                          console.log("result : " + result);
                          if(result=="SUCCESS"){
                             alert("삭제되었습니다");
                             listAll(b_num);
                          }
                       }
                    });
                 }
            }
            
       	 /* 수정 폼 화면 구현 함수 */
         function updateForm(re_no){
        	 $.ajax({
              	  url : "/replies/"+re_no+".json",
                    type : "get",
                    dataType : "json",
                    error : function(){
                       alert("시스템 오류입니다. 관리자에게 문의하세요");
                    },
                    success : function(data){
                       $("#re_content").val(data.re_content);
                       
                       var num_input = $("<input>");
                       num_input.attr({"type":"hidden", "name":"re_no"});
                       num_input.val(re_no);
                       $("#comment_form").append(num_input);
                       
                       $("#replyModalLabel").html("댓글 수정");
                       $("#replyInsertBtn").attr("data-button", "updateBtn");
                       $("#replyInsertBtn").html("수정");  
                       setModal("댓글 수정", "updateBtn", "수정");
                       
                       $("#replyModal").modal();
                    }
                 });
         }
            
           
            //댓글목록을 보여주는 리스트함수
               function listAll(no_no){
                  $("#reviewList").html("");
        
                  var url = "/replies/all/"+no_no+".json";
                  
                  $.getJSON(url, function(data){
                     console.log("list count : "+data.length);
                     replyCnt = data.length;
                     $(data).each(function(){
                        var re_content = this.re_content;
                        re_content = re_content.replace(/(\r\n|\r|\n)/g, "<br/>");
                        addItem(re_content);
                     });
                  }).fail(function(){
                     alert("댓글 목록을 불러오는데 실패하였습니다.");
                  });
               }
            
               function addItem(r_content){
                   
                   //새로운 글이 추가될 div태그 객체
                   
                   var wrapper_div = $("<div>");
                   wrapper_div.attr("data-num", r_num);
                   wrapper_div.addClass("panel panel-default");
                   
                   var new_div = $("<div>");
                   new_div.addClass("panel-heading");
                   
                   //작성자 정보의 이름
                   var name_span = $("<span>");
                   name_span.addClass("name");
                   name_span.html(r_name + "님");
                   
                   //작성일시
                   var date_span = $("<span>");
                   date_span.html(" / " + r_date + " ");
                   
                   //수정하기 버튼
                  /*  var upBtn = $("<input>");
                   upBtn.attr({"type" : "button" , "value" : "수정하기"}); */
                   var upBtn = $("<button>");
                   upBtn.attr({"type" : "button"});
                   upBtn.attr("data-btn", "upBtn");
                   upBtn.addClass("btn btn-primary gap");
                   upBtn.html("수정하기");
                   
                   //삭제하기 버튼
                   /* var delBtn = $("<input>");
                   delBtn.attr({"type" : "button" , "value" : "삭제하기"}); */
                   var delBtn = $("<button>");
                   delBtn.attr({"type" : "button"});
                   delBtn.attr("data-btn", "delBtn");
                   delBtn.addClass("btn btn-primary gap");
                   delBtn.html("삭제하기");
                
                   
                   //내용
                   var content_div = $("<div>");
                   content_div.html(r_content);
                   content_div.addClass("panel-body");
                   
                   //조합하기
                   new_div.append(name_span).append(date_span).append(upBtn).append(delBtn);
                   wrapper_div.append(new_div).append(content_div);
                   $("#reviewList").append(wrapper_div);
                }
             
            
             //입력 폼 초기화
            function dataReset(){
               $("#re_content").val("");
               setModal("댓글 등록", "insertBtn", "등록");
            }
             
             
             function setModal(title, value, text){
           	  $("#replyModalLabel").html(title);
                 $("#replyInsertBtn").removeAttr("data-button");
                 $("#replyInsertBtn").attr("data-button", value);
                 $("#replyInsertBtn").html(text);
             }
             
            
      </script>
	</head>
	
	<body>
		<div id="replyContainer">
			<p class="tat">
				<button type="button" class="btn btn-primary" id="replyInsertFormBtn">댓글 등록</button>
				
		</div>
		
			<!-- 리스트 영역 -->
			<div id="reviewList"></div>
			
			<!-- 등록화면 영역(modal) -->
			<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="replyModalLabel">댓글등록</h4>
							
						</div>
						<div class="modal-body">
							<form id="comment_form" name="comment_form">
								<div class="form-group">
									<label for="recipient-name" class="control-label">댓글내용</label>
									<input type="text" class="form-control" id="re_content" name="re_content" maxlength="5">
									
								</div>
								<!-- 댓글입력하는 공간 -->
							</form>
						</div>
						<div class="modal-fotter">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="replyInsertBtn">등록</button>
						</div>
					</div>
				</div>
			</div>
	</body>
</html>