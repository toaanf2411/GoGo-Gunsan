<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/submenu.css">
<nav>
    <div class="submenu_container">
        <div class="sub_menu">
            <ul>
                <li class="item" id="profile">
                    <a href="#profile" class="btn"><i class="fa fa-user"></i> 프로필</a>
                    <div class="smenu">
                        <a href="">내 정보보기</a>
                    </div>
                </li>
                <li class="item" id="messages">
                    <a href="#messages" class="btn"><i class="fas fa-ticket-alt"></i> 예약현황</a>
                    <div class="smenu">
                        <a href="<%=request.getContextPath()%>/member/memberReservation">내 예약보기</a>
                     </div>
                </li>
                 <li class="item">
                    <a href="<%=request.getContextPath() %>/member/MemberDeleteGo" class="btn"><i class="fa fa-sign-out-alt"></i> 회원탈퇴</a>
                </li>
                <li class="item">
                    <a href="<%=request.getContextPath()%>/member/memberLogout" class="btn"><i class="fa fa-sign-out-alt"></i> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>