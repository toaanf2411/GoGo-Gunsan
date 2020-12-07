<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member/mypage.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/submenu.css">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/mypage_sidebar.jsp" %>
<div class="gunsan-wrapper">
 <div class="update-container" id="update-container">

            <div class="update-form-container member-update-container">
                <form class="member-form" action="<%=request.getContextPath()%>/member/MemberUpdate()"
                		id="memberFrm" onsubmit="return validate();">
                
                        <h1>회원정보수정</h1>
                    <table>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input class="update-input-box" type="email" name="memberEmail" 
                                id="email" value="<%=memberLoggedIn.getMemberEmail()%>"
                                 onblur="emailValidate();" required/>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        	<span class="error" id="errorEmail"></span>
                        	</td>
                        </tr>
                           
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input class="update-input-box"  type="password" name="memberPassword" 
                                id="password_" value=""  
                                onblur="pwValidate();"
                                required/>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                       			<span class="error" id="errorPw"></span>
                       		</td>
                        </tr>
                        <tr>
                            <th>비밀번호 확인</th>
                            <td>
                                <input class="update-input-box"  
                                type="password" name="memberPassword" 
                                id="password_2" 
                                value=""  
                                 onblur="isEqualPwd();" required/>
                            </td>
                        </tr>
                      	<tr>
                      		<td colspan="2">
                      			<span class="error" id="errorPwChk"></span>
                      		</td>
                      	</tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                <input class="update-input-box"
                                  type="text" name="memberName" 
                                   value="<%=memberLoggedIn.getMemberName()%>"
                                   id="memberName"
                                   required/>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<span class="error" id="errorName"></span>
                        	</td>
                        <tr>
                    
                        <tr>
                            <th>생년월일</th>
                            <td>
                                <input type="date" class="update-input-box" 
                                name="birthDay" id="birthDay" value="<%=memberLoggedIn.getBirthDay()%>" required/>
                            </td>
                        </tr>
           
                        <tr>
                            <th>휴대폰</th>
                            <td>
                                <input type="tel" class="update-input-box" 
                                name="phone" id="phone" maxlength="11"
                                 value="<%=memberLoggedIn.getPhone()%>" 
                                  required>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<span class="error"  id="errorPhone"></span>
                       
                        	</td>
                        </tr>
                    </table>
                    <input type="submit" id="update-button"class="update-button" value="수정하기"/>
                </form>
            </div>
        </div>
      </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
//아이디 사용여부
	$("#email").keyup(function(e){
		let email = $(this).val().trim();
		$.ajax({
			url: "<%=request.getContextPath()%>/member/chekckIdDuplicate.do",
			data: {email: email},
			dataType : "text",
			success: function(data){
				//입력한 이메일이 DB에 있는지 없는지에 따른 결과를 출력한다.
				if(data==0){
					$("#errorEmail").html("사용가능한 이메일입니다.");
				}else{
					$("#errorEmail").html("<font color='red'>사용중인 이메일입니다.</font>");
				}
			},
			error: function(){
				alert("에러가 발생했습니다. 관리자에게 문의 하세요");
			}
			
		});
		
	});
</script>
<script src="<%=request.getContextPath()%>/js/member/member.js"></script>


