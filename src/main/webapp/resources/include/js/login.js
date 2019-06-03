$(function(){
			codeCheck(); 
        		$('#mem_id, #mem_pwd').bind("keyup", function(){
        			$(this).parents("div").find(".error").html("");
        		});
        		//로그인 버튼 클릭시 처리 이벤트
        		$("#loginBtn").click(function(){
        			if(!formCheck($('#mem_id'), $('.error:eq(0)'), "아이디를")) return;
        			else if(!inputVerify(0,'#mem_id','.error:eq(0)')) return;
        			else if(!formCheck($('#mem_pwd'),$('.error:eq(1)'), "비밀번호를")) return;
        			else if(!inputVerify(1,'#mem_pwd', '.error:eq(1)')) return;
        			else{
        				$("#loginForm").attr({
        					"method":"POST",
        					"action":"/member/login"
        				});
        				$("#loginForm").submit();
        			}
        		});
        		
        	 	//회원가입 버튼 클릭시 처리 이벤트
        		$("#joinBtn").click(function(){
        			location.href="/member/join";
        		}); 
        	});