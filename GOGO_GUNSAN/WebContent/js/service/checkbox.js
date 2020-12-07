//여행기간 체크를 하나만 체크 가능할 수 있음
function periodCheck(chk) {
	var obj = document.getElementsByName("period");
	for (var i = 0; i < obj.length; i++) {
		if (obj[i] != chk) {
			obj[i].checked = false;
		}
	}
}
// 여행테마 체크를 하나만 체크 가능할 수 있음
function themaCheck(chk) {
	var obj = document.getElementsByName("thema");
	for (var i = 0; i < obj.length; i++) {
		if (obj[i] != chk) {
			obj[i].checked = false;
		}
	}
}
// 여행기간과 여행테마 체크 둘다 했는지 확인하는 함수
function checked() {
	var period = document.getElementsByName("period").length;
	var thema = document.getElementsByName("thema").length;
	console.log(period);
	console.log(thema);
	var pCheck = false;
	var tCheck = false;
	// 여행기간 체크박스가 하나라도 체크가 되어있으면 pCheck는 true
	for (var i = 0; i < period; i++) {
		if (document.getElementsByName("period")[i].checked == true) {
			console.log("실행");
			console.log(period);
			pCheck = true;
		}
	}
	// 여행테마 체크박스가 하나라도 체크가 되어있으면 tCheck는 true
	for (var j = 0; j < thema; j++) {
		if (document.getElementsByName("thema")[j].checked == true) {
			console.log("실행");
			console.log(thema);
			tCheck = true;
		}
	}
	// 여행기간과 여행테마가 하나라도 false면 false를 반환하여 다음 화면 못넘어가게 함
	if (pCheck != tCheck) {
		console.log(pCheck);
		console.log(tCheck);
		alert("여행기간 또는 여행테마를 체크하셨는지 확인해주세요");
		return false;
	}
	return ture;
}