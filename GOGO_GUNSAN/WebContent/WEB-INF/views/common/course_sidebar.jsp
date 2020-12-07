<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/submenu.css">
<nav>
    <div class="submenu_container">
        <div class="sub_menu">
            <ul>
                <li class="item" id="board">
                    <a href="<%=request.getContextPath()%>/course/museumCourseGo" class="btn"><i class="fa fa-user"></i>근대문화유산 코스 </a>
                </li>
                <li class="item" id="tourboard">
                    <a href="<%=request.getContextPath()%>/course/gamsungCourseGo" class="btn"><i class="fas fa-ticket-alt"></i>감성코스  </a>
                </li>
                <li class="item" id="tourboard">
                    <a href="<%=request.getContextPath() %>/course/activityCourseGo" class="btn"><i class="fas fa-ticket-alt"></i>엑티비티 코스  </a>
                </li>
                <li class="item" id="tourboard">
                    <a href="<%=request.getContextPath()%>/course/bicycleCourseGo" class="btn"><i class="fas fa-ticket-alt"></i>자전거 코스 </a>
                </li>
            </ul>
        </div>
    </div>
</nav>