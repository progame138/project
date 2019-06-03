var loginUserId ="";
$(function(){
	codeCheck();
	emailCheck();
	
	var message = ["기존 비밀번호를 입력해 주세요",
		"영문 숫자 특수문자만 가능합니다(8~16자)",
		"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다",
		"'-'포함하여 입력해 주세요"];
	$('.error').each(function(index){
		$('.error').eq(index).html(message[index]);
	});
	
	$("#oldUserPwd, #mem_pwd, #mem_pwdCheck, #mem_phone").bind("focus", function(){ 
		var mem_no = $("#oldUserPwd, #mem_pwd, #mem_pwdCheck, #mem_phone").index(this);
		//console.log("대상: "+ mem_no):
		$(this).parents(".form-group").find(".error").html(message[mem_no]);
	});
	
	//확인버튼 클릭시 처리 이벤트
	$("#modify").click(function(){
		//입력값 체크
		if(!formCheck($('#oldUserPwd').$('error:eq(0)'), "기존 비밀번호를")) return;
		else if(!inputVerify(1, '#oldUserPwd', '.error:eq(0)')) return;
		else if(!formCheck($('#mem_phone'),$('.error:eq(3)'), "전화번호를")) return;
		else if(!inputVerify(2, '#mem_phone', '.error:eq(3)')) return;
		else if(!formCheck($('#mem_email'), $('.error:eq(4)'), "이메일주소를")) return;
		else {
				if($('#mem_pwd').val()!="") {
					if(!inputVerify(1, '#mem_pwd', '.error:eq(1)')) return;
					if(!idPwdCheck()) return;
				}
				if($('#mem_pwdCheck').val()!="") {
					if(!inputVerify(1, '#mem_pwdCheck', '.error:eq(2)')) return;
				}
				if($('#mem_pwd').val()!="" && $('#mem_pwdCheck').val()!="") {
					if(!passwordCheck()) return;
				}
				$("#mem_email").val($("#mem_email").val()+"@"+$("emailDomain").val());
				$("#memberForm").attr({
					"method":"post",
					"action":"/member/modify"
				});
				$("#memberForm").submit();
		}
	});
	
	$("#modifyReset").click(function(){
		$("#memberForm").each(function(){
			this.reset();
		});
	});
	
	$("#modifyCancel").click(function(){
		location.href="/member/login";
	});
});

function passwordCheck() {
	if($("#mem_pwd").val()!=$("#mem_pwdCheck").val()) {
		alert("패스워드 입력이 일치하지 않습니다");
		$("mem_pwd").val("");
		$("#mem_pwdCheck").val("");
		$("#mem_pwd").focus();
		return false;
	}
	return true;
}

function idPwdCheck() {
	var mem_id = loginUserId;
	var mem_pwd = $("#mem_pwd").val();
	if(mem_pwd.indexOf(mem_id)>-1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다");
		$("#mem_pwd").val("");
		$("#mem_pwd").focus();
		return false;
	}else {
		return true;
	}
}
