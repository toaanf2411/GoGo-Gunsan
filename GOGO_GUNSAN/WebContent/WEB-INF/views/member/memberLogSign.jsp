<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* String saveId = (String)request.getParameter("saveId"); */

	//쿠키확인
	Cookie[] cookies = request.getCookies();
	boolean saveIdChecked = false;
	String memberId = "";
	
	if(cookies != null){
		//System.out.println("cookies@header.jsp");
		//System.out.println("===================================");
		for(Cookie c : cookies){
			String name = c.getName();
			String value = c.getValue();
			//System.out.println(name + " = " + value);
			
			if("saveId".equals(name)){
				saveIdChecked = true;
				memberId = value;
			}
		}
		//System.out.println("===================================");
		
	}


%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/member/login.css" />
    <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
    <style>
    input#saveId {
    margin: 2px;
	}
    </style>
</head>
	<body>
        <img src="/gunsan_project/images/gogo.png" alt="" width="300px" style="margin-bottom: 30px;">
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="<%=request.getContextPath() %>/member/memeberEnroll" method="POST" onsubmit="return validate();">
                    <h1>회원가입</h1>
                    <div class="social-container">
                
                    </div>
                    <input type="email" placeholder="Email" id="email" name="email" onblur="emailValidate();" required/>
                    <span class="error" id="errorEmail"></span>
                    <input type="password" name="password" id="password_" placeholder="Password" onblur="pwValidate();" required />
                    <span class="error" id="errorPw"></span>
                    <input type="password" id="password_2" placeholder="Confirm Password" onblur="isEqualPwd();" required>
                    <span class="error" id="errorPwChk"></span>
                    <input type="text" name="memberName" id="memberName"  placeholder="Name"required>
                    <span class="error" id="errorName"></span>
                    <input type="tel" placeholder="Phone Number(-없이)"name="phone" id="phone" maxlength="11" required>
                    <span class="error" id="errorPhone"></span>
                    <input type="date" name="birthday" id="brithday" required>
                    <button type="submit">회원가입</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="<%=request.getContextPath()%>/member/memeberLogin" method="get">
                    <h1>로그인</h1>
                    <div class="social-container">
                    
                    </div>
                    <input type="email" placeholder="Email" name="loginEmail" id="loginEmail" />
                    <input type="password" placeholder="Password" name="loginPassword" id="loginPassword" />
                    <p><input type="checkbox"  style="float: left; width: 20px;"  name="saveId" id="saveId" <%=saveIdChecked?"checked":"" %>/>
					<label for="saveId" style="float: left; font-size: 15px;" >아이디 저장</label> </p>
                    <!-- 아이디/비밀번호 찾기 페이지 -->
                    <a href="<%=request.getContextPath()%>/member/memeberFind">아이디/비밀번호 찾기</a>
                    <button>로그인</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Join Gunsan</h1>
                        <p></p>
                        <button class="ghost" id="signIn">로그인</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Gunsan</h1>
                        <p>고고 군산에 오신 것을 환영합니다.</p>
                        <button class="ghost" id="signUp" >회원가입</button>
                    </div>
                </div>
            </div>
        </div>
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
</body>
</html>