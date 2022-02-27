
function loginCheck(){
	if(document.frm.userid.value==""){
		alert("아이디를 써주세요");
		frm.userid.focus();			// 마우스 커서가 아이디 입력 상자에 놓이도록
		return false;
	}
	if(document.frm.pwd.value==""){
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	return true;
}