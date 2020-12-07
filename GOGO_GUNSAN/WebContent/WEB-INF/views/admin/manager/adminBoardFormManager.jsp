<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/admin/common/adminHeader.jsp" %>


		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
		
	    <script>
        function boardValidate(){
        	var boardTitle = document.getElementById("boardTitle").value.trim();
        	var boardContent = document.getElementById("boardContent").value.trim();
        	
        	if(boardTitle.length == 0){
        		alert("제목을 입력해주세요")
        		document.getElementById("boardTitle").focus();
        		return false;
        	}  	
        	if(boardContent.length == 0){
        		alert("내용을 입력해주세요")
        		document.getElementById("boardContent").focus();
        		return false;        	
        	}
        	return true;
        };
        
        </script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board/boardForm.css">
        <section id="boardForm">
        
        <div id="board-view">
                <form action="<%=request.getContextPath() %>/board/admin_boardCommon/adminBoardFormEndCommon" method="post"
                        enctype="multipart/form-data"> <!-- 반드시 선언해야 입출력이 가능하다.  -->
                <table id="tbl-board-view">
                <tr>
                    <td colspan="2" id="title">
                        게시물등록
                    </td>
                </tr> 
                <tr>
                    <td>
                        <table id="tbl-board-content">
                                <tr>
                                        <th>제 목</th>
                                        <td><input type="text" name="boardTitle" id="boardTitle" required></td>
                                    </tr>
                                    <tr>
                                        <th>작성자</th>
                                        <td>
                                            <input type="text" name="boardWriterView" value="<%=memberLoggedIn.getMemberName() %>" readonly/>
                                        	<input type="hidden" name="boardWriter" value="<%=memberLoggedIn.getMemberNo()%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>첨부파일</th>
                                        <td>			
                                            <input type="file" name="upFile">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>내 용</th>
                                        <td><textarea rows="5" cols="50" name="boardContent" id="boardContent"></textarea></td>
                                    </tr>
                        </table>


                    </td>
                </tr>
                <tr>
                    <th colspan="2" id="footer">
                            <button class="w3-button w3-white w3-border w3-round-large" onclick="return boardValidate();">등록하기</button>
                    </th>
                </tr>   
                
            </table>
            </form>
       </div>
        </section>
		</div>
<%@ include file="/WEB-INF/views/admin/common/adminFooter.jsp" %>
	