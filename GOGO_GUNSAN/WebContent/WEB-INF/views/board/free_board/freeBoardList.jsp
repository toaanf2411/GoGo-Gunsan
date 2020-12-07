<%@page import="board.free_board.model.vo.FreeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/board.css" />
<%
	String pageBar = (String)request.getAttribute("pageBar");
	List<FreeBoard> list = (List<FreeBoard>)request.getAttribute("list");
	Integer cPage = (Integer)request.getAttribute("cPage");
	System.out.println(cPage+"durl");
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>


<%@include file="/WEB-INF/views/common/board_sidebar.jsp" %>

<div class="gunsan-wrapper">
        <section id="board-container">
        <h1>자유게시판</h1>
          <table id="tbl-list">
          <tr><td>
        <%if(memberLoggedIn != null){ %>
			<input type="button" value="글쓰기" id="btn-add"
			onclick="location.href='<%=request.getContextPath() %>/board/free_board/freeBoardForm'"/>
		<%} %>
          </td>
          </tr>
	        <tr id ="tbl-th-list">
				<th id="board-no">글번호</th>
				<th id="board-title">제목</th>
				<th id="board-file">첨부</th>
				<th id="board-writer">작성자</th>
				<th id="board-date">작성일</th>
	            <th id="board-readCount">조회수</th>
	        </tr>
        <% if(list==null || list.isEmpty()){ %>
            <tr>
                <td colspan="10" align="center"> 검색 결과가 없습니다. </td>
            </tr>
        <% 
            } 
            else {
                for(FreeBoard b : list){ 
        %>
            <tr>
                <td><%=b.getFreeBoardNo()%></td>
                <td>
                	<a href="<%=request.getContextPath()%>/board/free_board/freeBoardView?boardNo=<%=b.getFreeBoardNo()%>&cPage=<%=cPage %>">
                	<%=b.getFreeBoardTitle()%>                
                	</a>
                </td>
                <td><%=b.getFreeOriginalFileName()!= null?"<img src='"+request.getContextPath()+"/images/board/file.png' width='16px'/>":"" %></td>
				<td><%=b.getFreeBoardWriter()%></td>
                <td><%=b.getFreeBoardDate()%></td>
                <td><%=b.getFreeReadCount()%></td>
            </tr>		
        <%		} 
            }
        %>
    </table>
    <div id='pageBar'><%=pageBar %></div>
   </section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>			