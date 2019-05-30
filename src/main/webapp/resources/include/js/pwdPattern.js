/** 배열: 유효성 체크시 필요한 정규식으로 배열 초기화
 *  pattern: [아이디, 비번, 휴대폰번호}
 *  함수명: inputVerify{배열 인덱스번호, 비교할 값, 출력영역}
 */ 
var pattern = [
		"((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
		"((?=.*[a-zA-Z])(?=.*[0-9@#$%^&]).{8,12})",
		"^\\d{3}-\\d{3,4}=\\d{4}"];

function inputVerify(index, data, printarea) {
	var data_regExp = new RegExp(pattern[index]);
	var match = data_regExp.exec($(data).val());
	if(match==null) {
		$(printarea).html("입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$(data).val("");
		return false;
	}else {
		return true;
	}
}

/*함수명: chkData(유효성 체크 대상, 메시지 내용)*/
/*출력영역: alert로*/
/*예시: if(!chkData("#keyword", "검색어를")) return*/
function chkData(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert(msg+" 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	}else{
		return true;
	}
}	


/*formCheck(유효성 체크 대상, 출력영역, 메시지 내용)*/
function formCheck(main, item, msg){
	if($(main).val().replace(/\s/g,"")==""){
		item.html(msg+" 입력해 주세요");
		$(main).val("");
		return false;
	}else{
		return true;
	}
}

/*함수명: checkForm(유효성 체크 대상, 메시지 내용)
출력 영역: placeholder
예시: if(!checkForm("#keyword", "검색어를"))return;*/
function checkForm(item, msg){
    var message = "";
    if($(item).val().replace(/\s/g,"")==""){
       message = msg + " 입력해 주세요.";
       $(item).attr("placeholder",message);
       return false;
    }else{
       return true;
    }
}



	function checkPassword(id,password){

		if(!/^[a-zA-Z0-9]{10,15}$/.test(password)){
		alert('숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
		return false;
		}

		var checkNumber = password.search(/[0-9]/g);
		var checkEnglish = password.search(/[a-z]/ig);

		if(checkNumber <0 || checkEnglish <0){
		alert("숫자와 영문자를 혼용하여야 합니다.");
		return false;
}

		if(/(\w)\1\1\1/.test(password)){
		alert('444같은 문자를 4번 이상 사용하실 수 없습니다.');
		return false;
		}

		if(password.search(id) > -1){
		alert("비밀번호에 아이디가 포함되었습니다.");
		return false;
		}

		return true;

		}
	