<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/submenu.css">
<nav>
    <div class="submenu_container">
        <div class="sub_menu">
            <ul>
                <li class="item" id="board">
                    <a href="<%=request.getContextPath() %>/reservation/AllReservationGo" class="btn"><i class="fa fa-user"></i>전체 </a>
                </li>
                <li class="item" id="tourboard">
                    <a href="<%=request.getContextPath() %>/reservation/ReservationExhibit" class="btn"><i class="fas fa-ticket-alt"></i>전시 | 관람 </a>
                </li>
                <li class="item" id="tourboard">
                    <a href="<%=request.getContextPath() %>/reservation/ReservationExperience" class="btn"><i class="fas fa-ticket-alt"></i>레저 | 체험 </a>
                </li>
            </ul>
        </div>
    </div>
</nav>