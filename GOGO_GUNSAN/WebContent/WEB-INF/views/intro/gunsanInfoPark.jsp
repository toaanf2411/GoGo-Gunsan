<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main/main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/intro/intro.css">
<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/intro_sidebar.jsp" %>

<div class="gunsan-wrapper">
	<div class="gunsan-page-title">
		            <nav id="topMenu" >
                    <ul>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoGo">전체</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoNature">자연</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoPark" style="background: #ee8342;">공원</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoTown">마을</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoMuseum">박물관/전시관</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoRuins">문화유적</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoLeisure">레저/체험</a></li>
                    </ul>
            </nav>
	</div>
	
        <div class="intro-container">
                <a href="<%=request.getContextPath()%>/intro/park/wolmyeongPark">
                    <div class="card shadow-2dp">
                            <div id="pic-container">
                                <img
                                    src="<%=request.getContextPath()%>/images/tour_image/공원/월명공원수시탑.jpg"
                                    alt="" />
                                <p id="title"></p>
                            </div>
                            <div id="caption">
                
                                <p id="description">월명공원</p>
                
                                <div class="description-info">
                                    <div>
                                        <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 해망동
                                    </div>
                                    <div>
                                        <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-454-3337
                                    </div>
                                </div>
                
                            </div>
                        </div>
                </a>
        
       </div>
                                
    </div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>			
