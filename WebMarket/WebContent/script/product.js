/**
 * 
 */
var count=0;

function inputCheck(){
	if(document.frm.code.value==""){
		alert("제품 코드를 입력해 주세요");
		return false;
	}
	if(document.frm.name.value==""){
		alert("제품명을 입력해 주세요");
		return false;
	}
	return true;
}

function clickButton(){
	count++;
	//alert(count + "회 클릭하셨습니다.");
	return true;
}

function getCount() {
	document.write(count);
	return true;
}

