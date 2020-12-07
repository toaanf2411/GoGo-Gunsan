<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/submenu.css">
<nav>
    <div class="submenu_container">
        <div class="sub_menu">
            <ul>
                <li class="item" id="board">
                    <a href="<%=request.getContextPath() %>/board/admin_board/adminBoardList" class="btn"><i class="fa fa-user"></i>공지사항</a>
                </li>
                <li class="item" id="tourboard">
                    <a href="<%=request.getContextPath() %>/board/staff_board/staff_BoardList" class="btn"><i class="fas fa-ticket-alt"></i>관광지 공지사항</a>
                </li>
                <li class="item">
                    <a href="<%=request.getContextPath() %>/board/askBoardList" class="btn"><i class="fa fa-sign-out-alt"></i> 자주 묻는 질문</a>
                </li>
                <li class="item">
                    <a href="<%=request.getContextPath() %>/board/free_board/freeBoardList" class="btn"><i class="fa fa-sign-out-alt"></i> 자유 게시판</a>
                </li>
            </ul>
        </div>
    </div>
</nav>