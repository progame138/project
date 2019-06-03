//비밀번호와 비밀번호 확인 일치여부
function passwordCheck() {
	if($("#mem_pwd").val() != $("#mem_pwdCheck").val()) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#mem_pwdCheck").focus();
		$("#mem_pwdCheck").val("");
		return false;
	}else {
		return true;
	}
}

//아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var mem_id = $("#userId").val();
	var mem_pwd = $("#mem_pwd").val();
	if(mem_pwd.indexOf(mem_id) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#mem_pwd").val("");
		$("#mem_pwd").focus();
		return false;
	}else {
		return true;
	}
}

var idConfirm = -1;
$(function(){
	codeCheck();
	//사용자에게 요구사항에 대한 문자열로 배열 초기화
	var message = ["영문, 숫자만 가능. 6~12자로 입력해주세요",
					"영문, 숫자, 특수문자만 가능합니다. 8~15자로 입력해주세요.",
					"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
					"- 를 포함하여 입력해주세요. ex)010-1234-5678"];
	
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});
	
	$('#mem_id, #mem_pwd, #mem_pwdCheck, #phone').bind("focus", function(){
		var idx = $("#mem_id, #mem_pwd, #mem_pwdCheck, #phone").index(this);
		//console.log("대상 : " + dix);
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});
	
	$("#idConfirmBtn").click(function(){
		if(!formCheck($('#mem_id'), $('.error:eq(0)'), "아이디를"))  return;
		else if(!inputVerify(0,'#mem_id', '.error:eq(0)')) return;
		else {
			$.ajax({
				 	url: "/member/userIdConfirm",
				 	type: "post",
				 	data: "mem_id="+$("#mem_id").val(),
				 	error: function(){
				 		alert('사이트 접속문제로 정상접속이 되지 않았습니다.\n잠시 후 다시 시도해 주세요~');
				 	},
				 	success: function(resultData){
				 		console.log("resultDataL "+ resultData);
				 		if(resultData=="1") {
				 			$("#userId").parents(".form-group").find(".error").html("현재 사용중인 아이디입니다.");
				 		}else if(resultData=="2") {
				 			$("#mem_id").parents("form-group").find(".error").html("사용 가능한 아이디입니다.");
				 			idConfirm = 2;
				 		}
				 	}
			});
		}
	});
	
	//회원수정 테스트
	$("#modifyBtn").click(function(){
		location.href="/modify/modify";
	}); 
	
	//확인 버튼 클릭 시 처리 이벤트
	$("#joinInsert").click(function(){
		//입력값 체크
		if(!formCheck($('#mem_id'), $('.error:eq(0)'), "아이디를")) return;
		else if(!inputVerify(0, '#mem_id', '.error:eq(0)')) return;
		else if(!formCheck($('#mem_pwd'), $('.error:eq(1)'), "비밀번호를")) return;
		else if(!inputVerify(1, '#mem_pwd', '.error:eq(1)')) return;
		else if(!idPwdCheck()) return;
		
		else if(!formCheck($('#userPwdCheck'), $('.error:eq(2)'), "비밀번호 확인을")) return;
		else if(!inputVerify(1, '#userPwdCheck', '.error:eq(2)')) return;
		else if(!passwordCheck()) return;
		
		else if(!formCheck($('#phone'), $('.error:eq(3)'), "전화번호를")) return;
		else if(!inputVerify(2, '#phone', '.error:eq(3)')) return;
		else if(!formCheck($('#userName'), $('.error:eq(5)'), "이름을")) return;
		else if(!formCheck($('#emailName'), $('.error:eq(6)'), "이름을")) return;
		else if(idConfirm!=2) {
			alert("아이디 중복 체크를 해주세요");
			return;
		}else {
			$("#mem_email").val($("#emailName").val()+"@"+$("#emailDomain").val());
			$("#pinno").val($("#mem_birth").val()+"-"+$("#gender").val());
			$("#memberForm").attr({
				"method":"post",
				"action":"/member/join"
			});
			$("#memberForm").submit();
		}
	});
	
	$("#joinCancel").click(function(){
		location.href-"/member/login";
	});
	
	$("#joinReset").click(function(){
		$("#memberForm").each(function(){
			this.reset();
		});
	});
});