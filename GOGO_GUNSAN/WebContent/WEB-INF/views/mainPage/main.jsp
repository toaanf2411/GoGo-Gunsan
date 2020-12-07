<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%---인덱스 시작 --%>
<link href="<%=request.getContextPath()%>/css/index/indexStyle.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<script src="https://kit.fontawesome.com/cdc1d1e325.js" crossorigin="anonymous"></script>


<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
	
<!-- Animate.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainPage/animate.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainPage/bootstrap.css">
<!-- Flexslider  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainPage/flexslider.css">

<!-- Theme style  -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainPage/mainStyle.css">   


<!-- Modernizr JS -->
<script src="<%=request.getContextPath() %>/js/mainPage/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
<script src="js/respond.min.js"></script>
<![endif]-->

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainPage/mainSlider.css">   

<style>
.container-bottom{
	margin-right: auto;
    margin-left: auto;
    padding-left: 15px;
    padding-right: 15px;
    background-size: 1500px 900px;
    background-image: url('<%=request.getContextPath()%>/images/mainPage/mainService.jpg');
}

  .slide:nth-of-type(1) {
	background-size: 100% 100%;
    background-image: url('<%=request.getContextPath()%>/images/index/gunsanmain1.gif');
  }
  
  .slide:nth-of-type(2) {
  	background-size: 100% 100%;
      background-image: url('<%=request.getContextPath()%>/images/index/은파호수공원슬라이드.gif');
  }
  
  .slide:nth-of-type(3) {
  	background-size: 100% 100%;
     background-image: url('<%=request.getContextPath()%>/images/index/초원사진관.jpg');
  }
  
  .slide:nth-of-type(4) {
 	 background-size: 100% 100%;
     background-image: url('<%=request.getContextPath()%>/images/index/월명공원슬라이드.gif');
  }

</style>

	<!-- partial:index.partial.html -->
<div id="slider-wrapper" >
<div class="slider">
  <div class="slide_viewer">
     <div class="slide_group">
      <div class="slide">
        <div class="slide-center">
   			<h1>근대 역사와 해양중심의 도시</h1>
   			<h3>명품관광 군산으로 오세요!</h3>
			<p>군산군도</p>
        </div>
      </div>
      <div class="slide">
      	<div class="slide-center">
    		<h1>근대 역사와 해양중심의 도시</h1>
    		<h3>명품관광 군산으로 오세요!</h3>
			<p>은파호수공원</p>
		</div>
      </div>
      <div class="slide">
      	<div class="slide-center">
      		<h1>근대 역사와 해양중심의 도시</h1>
			<h3>명품관광 군산으로 오세요!</h3>
			<p>초원사진관</p>
      	</div>
      </div>
      <div class="slide">
	      <div class="slide-center">
     		<h1>근대 역사와 해양중심의 도시</h1>
			<h3>명품관광 군산으로 오세요!</h3>
			<p>월명공원</p>
    	  </div>
      </div>
    </div>
	<div class="slide_buttons"></div>
  </div>
</div><!-- End // .slider -->


<div class="directional_nav">
  <div class="previous_btn" title="Previous">
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="65px" height="65px" viewBox="-11 -11.5 65 66">
 	
      <g>
        <g>
          <path fill="#474544" d="M-10.5,22.118C-10.5,4.132,4.133-10.5,22.118-10.5S54.736,4.132,54.736,22.118
			c0,17.985-14.633,32.618-32.618,32.618S-10.5,40.103-10.5,22.118z M-8.288,22.118c0,16.766,13.639,30.406,30.406,30.406 c16.765,0,30.405-13.641,30.405-30.406c0-16.766-13.641-30.406-30.405-30.406C5.35-8.288-8.288,5.352-8.288,22.118z"/>
          <path fill="#474544" d="M25.43,33.243L14.628,22.429c-0.433-0.432-0.433-1.132,0-1.564L25.43,10.051c0.432-0.432,1.132-0.432,1.563,0	c0.431,0.431,0.431,1.132,0,1.564L16.972,21.647l10.021,10.035c0.432,0.433,0.432,1.134,0,1.564	c-0.215,0.218-0.498,0.323-0.78,0.323C25.929,33.569,25.646,33.464,25.43,33.243z"/>
        </g>
      </g>
    </svg>
  </div>
  <div class="next_btn" title="Next">
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="65px" height="65px" viewBox="-11 -11.5 65 66">
      <g>
        <g>
          <path fill="#474544" d="M22.118,54.736C4.132,54.736-10.5,40.103-10.5,22.118C-10.5,4.132,4.132-10.5,22.118-10.5	c17.985,0,32.618,14.632,32.618,32.618C54.736,40.103,40.103,54.736,22.118,54.736z M22.118-8.288	c-16.765,0-30.406,13.64-30.406,30.406c0,16.766,13.641,30.406,30.406,30.406c16.768,0,30.406-13.641,30.406-30.406 C52.524,5.352,38.885-8.288,22.118-8.288z"/>
          <path fill="#474544" d="M18.022,33.569c 0.282,0-0.566-0.105-0.781-0.323c-0.432-0.431-0.432-1.132,0-1.564l10.022-10.035 			L17.241,11.615c 0.431-0.432-0.431-1.133,0-1.564c0.432-0.432,1.132-0.432,1.564,0l10.803,10.814c0.433,0.432,0.433,1.132,0,1.564 L18.805,33.243C18.59,33.464,18.306,33.569,18.022,33.569z"/>
        </g>
      </g>
    </svg>
  </div>
</div><!-- End // .directional_nav -->

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- partial -->
  <script  src="<%=request.getContextPath() %>/js/mainPage/mainSlider.js"></script>
		<!---//End-da-slider----->
	

	<div id="fh5co-wireframe">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>시민과 함께하는 자립도시 군산</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-7 animate-box">
						<iframe width="560" height="315" src="https://www.youtube.com/embed/2TFH2H6LLg4?autoplay=1&loop=1;playlist=2TFH2H6LLg4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
				<div class="col-md-5 animate-box">
					<div class="feature-copy">
						<img src="<%=request.getContextPath() %>/images/logo/helloModern.jpg" alt="" />	
						<p>군산은 일제 강점기 생활상이 그대로 간직된 근대 문화의 도시이자 미식의 도시입니다. 생생한 역사의 체험학습장으로 여행객들에게 인기가 많으며 낯스선 과거의 풍경과 줄지은 맛집으로 데이트 코로도 추천하는 곳입니다. </p>
				
						<p><a href="<%=request.getContextPath() %>/intro/GunsanManinIntroGo">GoGo GUNSAN <i class="fas fa-long-arrow-alt-right"></i></a></p>
					</div>
				
					</div>
				</div>
			</div>
		</div>

	<div id="fh5co-features">
			<div class="container">
				<div class="services-padding">
					<div class="row">
						<div class="col-md-4 animate-box">
							<div class="feature-left">
								<span class="icon">
									<i><img src="<%=request.getContextPath()%>/images/mainPage/binoculars.svg" width="38px" alt="" /></i>
								</span>
								<div class="feature-copy">
									<h3>문화유적</h3>
									<p>군산의 아름다운 문화 유적을 소개해 드립니다.</p>
									<p><a href="<%=request.getContextPath()%>/intro/GunsInfoRuins" >GoGo GUNSAN <i class="fas fa-long-arrow-alt-right"></i></a></p>
								</div>
							</div>
						</div>
	
						<div class="col-md-4 animate-box">
							<div class="feature-left">
								<span class="icon">
									<i><img src="<%=request.getContextPath()%>/images/mainPage/university.svg" width="30px" alt="" /></i>
								</span>
								<div class="feature-copy">
									<h3>박물관/전시관</h3>
									<p>군산의 역사가 가득한 지역박물관으로서 방문객들이 군산의 역사와 문화를 체험할 수있는 공간을 제공하고 있습니다.</p>
									<p><a href="<%=request.getContextPath()%>/intro/GunsInfoMuseum">GoGo GUNSAN <i class="fas fa-long-arrow-alt-right"></i></a></p>
								</div>
							</div>
	
						</div>
						<div class="col-md-4 animate-box">
							<div class="feature-left">
								<span class="icon">
							        <i><img src="<%=request.getContextPath()%>/images/mainPage/cycling-alt.svg" width="32px" alt="" /></i>
								</span>
								<div class="feature-copy">
									<h3>레저/체험</h3>
									<p>재미있는 군산에서 잊지 못할 추억을 경험해 보세요.</p>
									<p><a href="<%=request.getContextPath()%>/intro/GunsInfoLeisure" >GoGo GUNSAN <i class="fas fa-long-arrow-alt-right"></i></a></p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	<div id="fh5co-blog">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>추천코스</h2>
					<p>원하시는 주제별로 군산시를 여행하세요!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-bg" style="background-image: url(<%=request.getContextPath()%>/images/tour_image/문화유적/히로쓰가옥.jpg);"></a>
						<div class="blog-text">
							<h3><a href="#">근대문화유산코스</a></h3>
							<h5>군산의 역사를 직접 체험 하자!</h5>
							<p>일제강점기에 수탈이 극심했던 군산 지역 근대사의 특징을 잘 드러나며, 일제에 의한 우리민족의 관련된 건물을 볼 수 있는 역사적 여행을 해보세요!</p>
							<ul class="stuff">
								<li><p><a href="<%=request.getContextPath()%>/course/museumCourseGo">GoGo GUNSAN<i class="fas fa-long-arrow-alt-right"></i></a></p></li>
							</ul>
						</div> 
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-bg" style="background-image: url(<%=request.getContextPath()%>/images/tour_image/마을/경암동철길마을.jpg);"></a>
						<div class="blog-text">
							<h3><a href="#">감성코스</a></h3>
							<h5>아름다운 나의 감성을 군산과 함께</h5>
							<p>지친 일상에 쉼표가 필요할 때 나만의 감성에 맞게 여행을 떠나보세요</p>
							<ul class="stuff">
								<li><p><a href="<%=request.getContextPath()%>/course/gamsungCourseGo">GoGo GUNSAN<i class="fas fa-long-arrow-alt-right"></i></a></p></li>
							</ul>
						</div> 
					</div>
				</div>
				<div class="col-md-3">
					<div class="fh5co-blog animate-box">
						<a href="#" class="blog-bg" style="background-image: url(<%=request.getContextPath()%>/images/tour_image/레저체험/패러글라이딩.jpg);"></a>
						<div class="blog-text">
							<h3><a href="#">액티비티코스</a></h3>
							<h5>신나는 여행을 더욱더 재미있게 즐기자!</h5>
							<p>군산에서 잊을 수 없는 추억을 남기고 싶고, 충분히 짜릿한 액티비티를 즐길 수 있는 군산으로 오세요!</p>
							<ul class="stuff">
								<li><p><a href="<%=request.getContextPath() %>/course/activityCourseGo">GoGo GUNSAN<i class="fas fa-long-arrow-alt-right"></i></a></p></li>
							</ul>
						</div> 
					</div>
				</div>
				<div class="col-md-3">
						<div class="fh5co-blog animate-box">
							<a href="#" class="blog-bg" style="background-image: url(<%=request.getContextPath()%>/images/tour_image/자연/옥구저수지.jpg);"></a>
							<div class="blog-text">
								<h3><a href="#">자전거코스</a></h3>
								<h5>아름다운 자연을 자전거와 함께</h5>
								<p>구석구석 우리 땅 곳곳에 문화와 물자를 실어나르던 물결 핏줄이 생명체에 활력을 불어 넣듯, 대지의 만물을 살리며 영혼을 두고 흐른 금강의 숨결을 찾아 자전거를 타고 떠나 본다.</p>
								<ul class="stuff">
									<li><p><a href="<%=request.getContextPath()%>/course/bicycleCourseGo">GoGo GUNSAN<i class="fas fa-long-arrow-alt-right"></i></a></p></li>
								</ul>
							</div> 
						</div>
					</div>
			</div>
		</div>
	</div>
	

	<div id="fh5co-bottom" >
		<div class="overlay"></div>
		<div class="container-bottom" >
			<div class="row animate-box  js-fullheight">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading  display-tc js-fullheight animate-box" data-animate-effect="fadeIn">
					<h1 class="white">맞춤서비스</h1>
					<p>바쁜 현대인들을 위해 gogo 군산이 준비했습니다.<br><a href="" style="font-weight: 700;">단, 5분만</a>에 당신만의 완벽한 여행을 계획해 보세요.</p>
					<p><a class="btn btn-primary btn-lg btn-learn" href="<%=request.getContextPath()%>/service/TourServiceGo">Click!</a></p>
				</div>
			</div>
		</div>
	</div>



	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="fas fa-angle-double-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="<%=request.getContextPath() %>/js/mainPage/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="<%=request.getContextPath() %>/js/mainPage/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="<%=request.getContextPath() %>/js/mainPage/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=request.getContextPath() %>/js/mainPage/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="<%=request.getContextPath() %>/js/mainPage/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="<%=request.getContextPath() %>/js/mainPage/main.js"></script>

