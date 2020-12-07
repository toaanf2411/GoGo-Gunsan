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
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoGo" style="background: #ee8342;">전체</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoNature">자연</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoPark">공원</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoTown">마을</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoMuseum">박물관/전시관</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoRuins">문화유적</a></li>
                            <li><a class="menuLink" href="<%=request.getContextPath() %>/intro/GunsInfoLeisure">레저/체험</a></li>
                    </ul>
            </nav>
	</div>
	<div class="intro-container">
        <a href="<%=request.getContextPath()%>/intro/nature/wolmyeongLake">
            <div class="card shadow-2dp">
                <div id="pic-container">
                    <img
                        src="<%=request.getContextPath()%>/images/tour_image/자연/월명호수.jpg"
                        alt="" />
                    <p id="title"></p>
                </div>
                <div id="caption">
    
                    <p id="description">월명호수</p>
    
                    <div class="description-info">
                        <div>
                            <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산시 소룡동 1071-3 (소룡동)
                        </div>
                        <div>
                            <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-453-4986
                        </div>
                    </div>
    
                </div>
            </div>
        </a>
        
        <a href="<%=request.getContextPath()%>/intro/nature/csMountain">
            <div class="card shadow-2dp">
                    <div id="pic-container">
                        <img
                            src="<%=request.getContextPath()%>/images/tour_image/자연/축성산.jpg"
                            alt="" />
                        <p id="title"></p>
                    </div>
                    <div id="caption">
        
                        <p id="description">축성산</p>
        
                        <div class="description-info">
                            <div>
                                <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산시 나포면 부곡리 
                            </div>
                            <div>
                                <i class="fa fa-mobile-phone" style="font-size:16px"></i>
                            </div>
                        </div>
        
                    </div>
                </div>
        </a>

        <a href="<%=request.getContextPath()%>/intro/nature/seaCave">
            <div class="card shadow-2dp">
                    <div id="pic-container">
                        <img
                            src="<%=request.getContextPath()%>/images/tour_image/자연/해망굴.jpg"
                            alt="" />
                        <p id="title"></p>
                    </div>
                    <div id="caption">
        
                        <p id="description">해망굴</p>
        
                        <div class="description-info">
                            <div>
                                <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산시 해망동
                            </div>
                            <div>
                                <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-454-3337
                            </div>
                        </div>
        
                    </div>
                </div>
        </a>


        <a href="<%=request.getContextPath()%>/intro/nature/reservoir">
            <div class="card shadow-2dp">
                    <div id="pic-container">
                        <img
                            src="<%=request.getContextPath()%>/images/tour_image/자연/옥구저수지.jpg"
                            alt="" />
                        <p id="title"></p>
                    </div>
                    <div id="caption">
        
                        <p id="description">옥구저수지</p>
        
                        <div class="description-info">
                            <div>
                                <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산시 옥구읍 어은리
                            </div>
                            <div>
                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i>
                            </div>
                        </div>
        
                    </div>
                </div>
        </a>
        </div>

        <div class="intro-container">
            <a href="<%=request.getContextPath()%>/intro/nature/mhMountain">
                <div class="card shadow-2dp">
                    <div id="pic-container">
                        <img
                            src="<%=request.getContextPath()%>/images/tour_image/자연/망해산.jpg"
                            alt="" />
                        <p id="title"></p>
                    </div>
                    <div id="caption">
        
                        <p id="description">망해산</p>
        
                        <div class="description-info">
                            <div>
                                <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 나포면 옥곤리
                            </div>
                            <div>
                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i>
                            </div>
                        </div>
        
                    </div>
                </div>
            </a>
                
            <a href="<%=request.getContextPath()%>/intro/nature/seonyudo">
                <div class="card shadow-2dp">
                        <div id="pic-container">
                            <img
                                src="<%=request.getContextPath()%>/images/tour_image/자연/선유도.jpg"
                                alt="" />
                            <p id="title"></p>
                        </div>
                        <div id="caption">
            
                            <p id="description">선유도</p>
            
                            <div class="description-info">
                                <div>
                                    <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 옥도면 선유남길 34-22
                                </div>
                                <div>
                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-465-5166
                                </div>
                            </div>
            
                        </div>
                    </div>
            </a>
        
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
        
        
                <a href="<%=request.getContextPath()%>/intro/town/tropicalVillage">
                    <div class="card shadow-2dp">
                            <div id="pic-container">
                                <img
                                    src="<%=request.getContextPath()%>/images/tour_image/마을/열대자마을.jpg"
                                    alt="" />
                                <p id="title"></p>
                            </div>
                            <div id="caption">
                
                                <p id="description">열대자 마을</p>
                
                                <div class="description-info">
                                    <div>
                                        <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 미성동
                                    </div>
                                    <div>
                                            <i class="fa fa-mobile-phone" style="font-size:16px"></i>
                                    </div>
                                </div>
                
                            </div>
                        </div>
                </a>
                </div>

                <div class="intro-container">
                    <a href="<%=request.getContextPath()%>/intro/town/railroadVillage">
                        <div class="card shadow-2dp">
                            <div id="pic-container">
                                <img
                                    src="<%=request.getContextPath()%>/images/tour_image/마을/경암동철길마을.jpg"
                                    alt="" />
                                <p id="title"></p>
                            </div>
                            <div id="caption">
                
                                <p id="description">경암동 철길마을</p>
                
                                <div class="description-info">
                                    <div>
                                        <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 경촌4길 14
                                    </div>
                                    <div>
                                        <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-453-4986
                                    </div>
                                </div>
                
                            </div>
                        </div>
                    </a>
                        
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
                
                </div>
                        <div class="intro-container">
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
                        
                                
                            <a href="<%=request.getContextPath()%>/intro/ruins/temple">
                                <div class="card shadow-2dp">
                                        <div id="pic-container">
                                            <img
                                                src="<%=request.getContextPath()%>/images/tour_image/문화유적/동국사.jpg"
                                                alt="" />
                                            <p id="title"></p>
                                        </div>
                                        <div id="caption">
                            
                                            <p id="description">동국사</p>
                            
                                            <div class="description-info">
                                                <div>
                                                    <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 동국사길 16 동국사
                                                </div>
                                                <div>
                                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-462-5366
                                                </div>
                                            </div>
                            
                                        </div>
                                    </div>
                            </a>




                            <a href="<%=request.getContextPath()%>/intro/ruins/japaneseHouse">
                                <div class="card shadow-2dp">
                                        <div id="pic-container">
                                            <img
                                                src="<%=request.getContextPath()%>/images/tour_image/문화유적/히로쓰가옥.jpg"
                                                alt="" />
                                            <p id="title"></p>
                                        </div>
                                        <div id="caption">
                            
                                            <p id="description">신흥동일본식가옥</p>
                            
                                            <div class="description-info">
                                                <div>
                                                    <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 신흥동
                                                </div>
                                                <div>
                                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-454-3313
                                                </div>
                                            </div>
                            
                                        </div>
                                    </div>
                            </a>
                    </div>
                        <div class="intro-container">
                            <a href="<%=request.getContextPath()%>/intro/ruins/leeYoungChun">
                                <div class="card shadow-2dp">
                                    <div id="pic-container">
                                        <img
                                            src="<%=request.getContextPath()%>/images/tour_image/문화유적/이영춘가옥.jpg"
                                            alt="" />
                                        <p id="title"></p>
                                    </div>
                                    <div id="caption">
                        
                                        <p id="description">이영춘 가옥</p>
                        
                                        <div class="description-info">
                                            <div>
                                                <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 개정동
                                            </div>
                                            <div>
                                                <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-452-8884
                                            </div>
                                        </div>
                        
                                    </div>
                                </div>
                            </a>

                            <a href="<%=request.getContextPath()%>/intro/ruins/bujangyo">
                                <div class="card shadow-2dp">
                                        <div id="pic-container">
                                            <img
                                                src="<%=request.getContextPath()%>/images/tour_image/문화유적/부잔교.jpg"
                                                alt="" />
                                            <p id="title"></p>
                                        </div>
                                        <div id="caption">
                            
                                            <p id="description">부잔교</p>
                            
                                            <div class="description-info">
                                                <div>
                                                    <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 장미동
                                                </div>
                                                <div>
                                                        <i class="fa fa-mobile-phone" style="font-size:16px"></i>
                                                </div>
                                            </div>
                            
                                        </div>
                                    </div>

                            </a>


                            <a href="<%=request.getContextPath()%>/intro/leisure/zipLine">
                                            <div class="card shadow-2dp">
                                                    <div id="pic-container">
                                                        <img
                                                            src="<%=request.getContextPath()%>/images/tour_image/레저체험/짚라인.jpg"
                                                            alt="" />
                                                        <p id="title"></p>
                                                    </div>
                                                    <div id="caption">
                                        
                                                        <p id="description">선유스카이 SUN라인</p>
                                        
                                                        <div class="description-info">
                                                            <div>
                                                                <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 옥도면 선유도리 산56-36
                                                            </div>
                                                            <div>
                                                                <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-463-8602
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </a>

                            <a href="<%=request.getContextPath()%>/intro/leisure/clam">
                                <div class="card shadow-2dp">
                                        <div id="pic-container">
                                            <img
                                                src="<%=request.getContextPath()%>/images/tour_image/레저체험/바지락캐기.jpg"
                                                alt="" />
                                            <p id="title"></p>
                                        </div>
                                        <div id="caption">
                            
                                            <p id="description">신시도(바지락캐기)</p>
                            
                                            <div class="description-info">
                                                <div>
                                                    <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 옥도면 신시도리 120
                                                </div>
                                                <div>
                                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-463-7088
                                                </div>
                                            </div>
                            
                                        </div>
                                    </div>
                            </a>
                      </div>
                            <div class="intro-container">
                                <a href="<%=request.getContextPath()%>/intro/leisure/fishing">
                                    <div class="card shadow-2dp">
                                        <div id="pic-container">
                                            <img
                                                src="<%=request.getContextPath()%>/images/tour_image/레저체험/낚시체험.jpg"
                                                alt="" />
                                            <p id="title"></p>
                                        </div>
                                        <div id="caption">
                            
                                            <p id="description">신시도(낚시 체험)</p>
                            
                                            <div class="description-info">
                                                <div>
                                                    <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 옥도면 신시도리 120
                                                </div>
                                                <div>
                                                    <i class="fa fa-mobile-phone" style="font-size:16px"></i>  063-463-7088 
                                                </div>
                                            </div>
                            
                                        </div>
                                    </div>
                                </a>
                                                

                                <a href="<%=request.getContextPath()%>/intro/leisure/lotus">
                                    <div class="card shadow-2dp">
                                            <div id="pic-container">
                                                <img
                                                    src="<%=request.getContextPath()%>/images/tour_image/레저체험/연꽃재배.jpg"
                                                    alt="" />
                                                <p id="title"></p>
                                            </div>
                                            <div id="caption">
                                
                                                <p id="description">오산마을(연꽃재배)</p>
                                
                                                <div class="description-info">
                                                    <div>
                                                        <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 옥구읍 선제리
                                                    </div>
                                                    <div>
                                                        <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-464-8587
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </a>
                                        
                                <a href="<%=request.getContextPath()%>/intro/leisure/native">
                                    <div class="card shadow-2dp">
                                            <div id="pic-container">
                                                <img
                                                    src="<%=request.getContextPath()%>/images/tour_image/레저체험/토속음식체험.jpg"
                                                    alt="" />
                                                <p id="title"></p>
                                            </div>
                                            <div id="caption">
                                
                                                <p id="description">오산마을(토속체험)</p>
                                
                                                <div class="description-info">
                                                    <div>
                                                        <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 옥구읍 선제리
                                                    </div>
                                                    <div>
                                                        <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-464-8587
                                                    </div>
                                                </div>
                                
                                            </div>
                                        </div>
                                </a>


                                <a href="<%=request.getContextPath()%>/intro/leisure/riding">
                                    <div class="card shadow-2dp">
                                            <div id="pic-container">
                                                <img
                                                    src="<%=request.getContextPath()%>/images/tour_image/레저체험/승마체험.jpg"
                                                    alt="" />
                                                <p id="title"></p>
                                            </div>
                                            <div id="caption">
                                
                                                <p id="description">승마체험</p>
                                
                                                <div class="description-info">
                                                    <div>
                                                        <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 성산면 고봉리 147-1
                                                    </div>
                                                    <div>
                                                        <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-453-9971
                                                    </div>
                                                </div>
                                
                                            </div>
                                        </div>
                                </a>
                            </div>
                                    <div class="intro-container">
                                        <a href="<%=request.getContextPath()%>/intro/leisure/paragliding">
                                            <div class="card shadow-2dp">
                                                <div id="pic-container">
                                                    <img
                                                        src="<%=request.getContextPath()%>/images/tour_image/레저체험/패러글라이딩.jpg"
                                                        alt="" />
                                                    <p id="title"></p>
                                                </div>
                                                <div id="caption">
                                    
                                                    <p id="description">패러글라이딩</p>
                                    
                                                    <div class="description-info">
                                                        <div>
                                                            <i class="fa fa-map-marker" style="font-size:16px"></i> 전북 군산 성산면 십자들로 43
                                                        </div>
                                                        <div>
                                                            <i class="fa fa-mobile-phone" style="font-size:16px"></i> 063-451-9848
                                                        </div>
                                                    </div>
                                    
                                                </div>
                                            </div>
                                        </a>

                             

                                 </div>
    </div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>			
