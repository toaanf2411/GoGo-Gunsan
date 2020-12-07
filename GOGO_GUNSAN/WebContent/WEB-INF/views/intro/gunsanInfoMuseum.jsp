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
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoPark">공원</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoTown">마을</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoMuseum" style="background: #ee8342;">박물관/전시관</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoRuins">문화유적</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoLeisure">레저/체험</a></li>
                    </ul>
            </nav>
	</div>
	

                <div class="intro-container">
                         
                    <a href="<%=request.getContextPath()%>/intro/museum/modernMuseum">
                        <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/근대역사박물관.jpg"
                                        alt="" />
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                    
                                    <p id="description">군산 근대역사 박물관</p>
                    
                                    <div class="description-info">
                                        <div>
                                            <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 해망로 240
                                        </div>
                                        <div>
                                            <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-454-7870
                                        </div>
                                    </div>
                    
                                </div>
                            </div>
                    </a>
                
                        
                    <a href="<%=request.getContextPath()%>/intro/museum/customsMuseum">
                        <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/호남관세박물관.jpg"
                                        alt="" />
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                    
                                    <p id="description">호남 관세 박물관</p>
                    
                                    <div class="description-info">
                                        <div>
                                            <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 해망로 244-7
                                        </div>
                                        <div>
                                            <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-730-8715
                                        </div>
                                    </div>
                    
                                </div>
                            </div>
                    </a>
                
                
                    <a href="<%=request.getContextPath()%>/intro/museum/modernArchitecture">
                        <div class="card shadow-2dp">
                                <div id="pic-container">
                                    <img
                                        src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/근대건축관.jpg"
                                        alt="" />
                                    <p id="title"></p>
                                </div>
                                <div id="caption">
                    
                                    <p id="description">근대건축관</p>
                    
                                    <div class="description-info">
                                        <div>
                                            <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산시 장미동
                                        </div>
                                        <div>
                                                <i class="fa fa-mobile-phone" style="font-size:16px"></i>
                                        </div>
                                    </div>
                    
                                </div>
                            </div>
                    </a>
                    <a href="<%=request.getContextPath()%>/intro/museum/modernArt">
                                <div class="card shadow-2dp">
                                    <div id="pic-container">
                                        <img
                                            src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/군산근대미술관.jpg"
                                            alt="" />
                                        <p id="title"></p>
                                    </div>
                                    <div id="caption">
                        
                                        <p id="description">군산 근대 미술관</p>
                        
                                        <div class="description-info">
                                            <div>
                                                <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 해망로 230 장기16은행
                                            </div>
                                            <div>
                                                <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-446-9812
                                            </div>
                                        </div>
                        
                                    </div>
                                </div>
                            </a>
                
                </div>
                        <div class="intro-container">
                          <a href="<%=request.getContextPath()%>/intro/museum/memorialHall">
                                <div class="card shadow-2dp">
                                        <div id="pic-container">
                                            <img
                                                src="<%=request.getContextPath()%>/images/tour_image/박물관전시관/31기념관.jpg"
                                                alt="" />
                                            <p id="title"></p>
                                        </div>
                                        <div id="caption">
                            
                                            <p id="description">군산3·1운동기념관</p>
                            
                                            <div class="description-info">
                                                <div>
                                                    <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 영명길 15
                                                </div>
                                                <div>
                                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-454-5940
                                                </div>
                                            </div>
                            
                                        </div>
                                    </div>
                            </a>
                        
                           
                    </div>
                       
    </div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>			
