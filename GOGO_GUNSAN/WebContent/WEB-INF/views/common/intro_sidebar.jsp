<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common/submenu.css">
<nav>
    <div class="submenu_container">
        <div class="sub_menu">
            <ul>
                <li class="item" id="profile">
                    <a href="<%=request.getContextPath() %>/intro/GunsanManinIntroGo" class="btn"><i class="fa fa-user"></i> 군산시 소개</a>
                </li>
                <li class="item" id="messages"> 
                    <a href="#messages" class="btn"><i class="fas fa-ticket-alt"></i> 관광명소</a>
                    <div class="smenu">
                         <a href=" <%=request.getContextPath() %>/intro/GunsInfoGo">전체</a>
                         <a href="<%=request.getContextPath() %>/intro/GunsInfoNature">자연</a>
                        <a href="<%=request.getContextPath() %>/intro/GunsInfoPark">공원</a>
                        <a href="<%=request.getContextPath() %>/intro/GunsInfoTown">마을</a>
                        <a href="<%=request.getContextPath() %>/intro/GunsInfoMuseum">박물관 | 전시관</a>
                        <a href="<%=request.getContextPath() %>/intro/GunsInfoRuins">문화유적</a>
                        <a href="<%=request.getContextPath() %>/intro/GunsInfoLeisure">레저 | 체험</a>
                    </div>
                </li>
                
            </ul>
        </div>
    </div>
</nav>