<%@page import="member.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member updatedMember = (Member) request.getAttribute("updateMember");
	String pageBar = (String) request.getAttribute("pageBar");
%>
<%@ include file="/WEB-INF/views/admin/common/adminHeader.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/searchbox.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/memberUpdate.css" />

<style>
div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
}

div#search-memberEmail {
	display: inline-block;
}

div#search-memberName {
	display: none;
}

div#search-memberNo {
	display: none;
}
</style>
<script>
	$(function() {
		let $memberEmail = $("#search-memberEmail");
		let $memberName = $("#search-memberName");
		let $memberNo = $("#search-memberNo");
		console.log($memberName);
		console.log($memberNo);
		$("#searchType").change(function() {
			$memberEmail.hide();
			$memberName.hide();
			$memberNo.hide();

			let selected = $(this).val();
			console.log(selected);
			$("#search-" + selected).css("display", "inline-block");
		});
	});
	
	function validate(){
        var pwd = document.getElementById("memberPassword");
        var email = document.getElementById("memberEmail");
        
        console.log("함수 실행!");
        console.log(pwd.value);
        console.log(email.value);


        //2.비밀번호 확인 검사
        //숫자/문자 포함 형태의 8~15자리 이내의 암호 정규식 
        var regExp6 = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/g;

        if(!regExpTest(regExp6, pwd, "비밀번호는 8~15자리 숫자/문자를 포함해야합니다.")){
                return false;
        }
        

        //5.이메일 검사
        // 4글자 이상(\w = [a-zA-Z0-9_], [\w-\.]) @가 나오고
        // 1글자 이상(주소). 글자 가 1~3번 반복됨
        if(!regExpTest(/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/, email, "이메일 형식에 어긋납니다.")){
                return false;        	
        }
        console.log("통과!");
        return true;
    };

    function regExpTest(regExp, el, msg){
        if(regExp.test(el.value))
            return true;
        //적합한 문자열이 아닌 경우
        alert(msg);
        el.value="";
        el.focus();
        return false;
    }

    //패스워드 유효성
    function isEqualPwd() {
    //패스워드 값 저장
    let password = document.getElementById("memberPassword").value;
    let passwordChk = document.getElementById("memberPassword_2").value;
    //패스워드, 패스워드 확인 비교
    if (password != passwordChk) {
    	alert("입력한 비밀번호가 다릅니다.");
        document.getElementById("memberPassword").focus();
    }
    };

	//이메일 유효성 (입력하지 않은 경우)
	function emailValidate() {
	    let userEmailVal = memberEmail.value.trim();
	    console.log(userEmailVal);
	    if (userEmailVal.length == 0) {
	    	alert("이메일를 입력하지 않았습니다.");
	    	memberEmail.focus();
	    }
	    
	};
	//패스워드 유효성 (입력하지 않은 경우)
	function pwValidate() {
	    let userPwVal = password_.value.trim();
	    if (userPwVal.length == 0) {
	    	alert("비밀번호를 입력하지 않았습니다.");
	    	memberPassword.focus();
	    }
	};
</script>
<!-- ============================================================== -->
<!-- wrapper  -->
<!-- ============================================================== -->
<div class="dashboard-wrapper">

	<%--테이블 시작 --%>
	<div class="update-container" id="update-container">
		<div class="update-form-container member-update-container">
			<form action="<%=request.getContextPath()%>/gogo-admin/memberUpdateEnd" class="member-form" onsubmit="return validate();">
				<h1>회원정보수정</h1>
				<table>
					<tr>
						<th>회원번호</th>
						<td><input class="update-input-box" type="text"
							name="memberNo" id="memberNo" style="background-color: white;"
							value="<%=updatedMember.getMemberNo()%>" readonly /></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="update-input-box" type="email"
							name="memberEmail" id="memberEmail"
							style="background-color: white;"
							value="<%=updatedMember.getMemberEmail()%>"  readonly /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input class="update-input-box" type="test"
							name="memberPassword" id="memberPassword"
							value="" onblur="pwValidate();" required/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input class="update-input-box" type="text"
							name="memberPassword" id="memberPassword_2"  onblur="isEqualPwd();" required /></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input class="update-input-box" type="text"
							name="memberName" value="<%=updatedMember.getMemberName()%>"
							required /></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" class="update-input-box"
							name="birthDay" id="birthDay"
							value="<%=updatedMember.getBirthDay()%>" required /></td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td><input type="tel" class="update-input-box" name="phone"
							id="phone" maxlength="11" value="<%=updatedMember.getPhone()%>"
							required></td>
					</tr>
					<tr>
						<th>회원등급</th>
						<td><input type="text" class="update-input-box" name="grade"
							id="grade" value="<%=updatedMember.getGrade()%>" required>

						</td>
					</tr>

				</table>
				<input type="submit" class="update-button" value="수정하기" />
			</form>
		</div>
	</div>
	<%--테이블 끝 --%>

</div>
<%@ include file="/WEB-INF/views/admin/common/adminFooter.jsp"%>