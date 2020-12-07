<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/tourService_res.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/service/tourServiceSelect.css">
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appkey=l7xx0833b81c69c546ec9c9ee870389b7cb9"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>
body {
  font-family: 'Montserrat', sans-serif;
  margin: 0;
  padding: 0;
}
.ticket {
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-align: center;
          align-items: center;
  width: 700px;
  margin: 20px auto;
}
.ticket .stub,
.ticket .check {
  box-sizing: border-box;
}
.stub {
  background: #ef5658;
  height: 250px;
  width: 250px;
  color: white;
  padding: 20px;
  position: relative;
}
.stub:before {
  content: '';
  position: absolute;
  top: 0;
  right: 0;
  border-top: 20px solid #dd3f3e;
  border-left: 20px solid #ef5658;
  width: 0;
}
.stub:after {
  content: '';
  position: absolute;
  bottom: 0;
  right: 0;
  border-bottom: 20px solid #dd3f3e;
  border-left: 20px solid #ef5658;
  width: 0;
}
.stub .top {
  display: -webkit-box;
  display: flex;
  -webkit-box-align: center;
          align-items: center;
  height: 40px;
  text-transform: uppercase;
}
.stub .top .line {
  display: block;
  background: #fff;
  height: 20px;
  width: 1px;
  margin: 0 20px;
}
.stub .top .num {
  font-size: 10px;
}
.stub .top .num span {
  color: #000;
}
.stub .number {
  position: absolute;
  left: 40px;
  top: 120px;
  font-size: 100px;
  color:white;
}
.stub .invite {
  position: absolute;
  left: 100px;
  bottom: 45px;
  color: white;
  text-align:left;
  top:205px;
  width: 120px;
}
.stub .invite:before {
  content: '';
  background: #fff;
  display: block;
  width: 40px;
  height: 1.5px;
  margin-bottom: 5px;
}
.check {
  background: #fbfbfb;
  height: 250px;
  width: 450px;
  padding: 40px;
  position: relative;
}
.check:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  border-top: 20px solid #dd3f3e;
  border-right: 20px solid #fff;
  width: 0;
}
.check:after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  border-bottom: 20px solid #dd3f3e;
  border-right: 20px solid #fff;
  width: 0;
}
.check .big {
  font-size: 40px;
  font-weight: 900;
  line-height: 0.8em;
  margin-top: 50px;
  text-align:left;
}
.check .number {
  position: absolute;
  top: 50px;
  right: 50px;
  color: #ef5658;
  font-size: 40px;
}
.check .info {
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: start;
  justify-content: flex-start;
  font-size: 12px;
  margin-top: 45px;
  width: 100%;
}
.check .info section {
  margin-right: 50px;
}
.check .info section:before {
    content: '';
    background: #dad7d7;
    display: block;
    width: 40px;
    height: 3px;
    margin: auto;
    margin-bottom: 5px;
}
.check .info section .title {
   width:100px;
  font-size: 15px;
  font-wight:900;
  text-transform: uppercase;
}
.admit, .num{
	color:white;
}

</style>

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	String type = (String)session.getAttribute("type");
	String startDay = (String)session.getAttribute("startDay");
	int cnt = (Integer)session.getAttribute("cnt");

%>

<div class="tm-section-2">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<h2 class="tm-section-title">군산에서 멋진 경험을 체험해 보세요.</h2>
				<p class="tm-color-white tm-section-subtitle">5분안이면 당신의 여행이 한눈에
				</p>
			</div>
		</div>
	</div>
</div>
<div class="tm-section tm-position-relative">
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"
		preserveAspectRatio="none" class="tm-section-down-arrow">
            <polygon fill="#EE5057" points="0,0  100,0  50,60"></polygon>
        </svg>
	<div class="container tm-pt-5 tm-pb-4">


		<form action="" id="" method="POST">
			<div class="row text-center ">
				<article class=" col-xl-12 ">
				<h3>저희 GOGO GUNSAN 맞춤 서비스를 이용해 주셔서 감사합니다.</h3>
					<div class="ticket">
						<div class="stub">
							<div class="number">1</div>
							<div class="invite">GoGo Gunsan</div>
						</div>
						<div class="check">
							<div class="big">GOGO Gunsan</div>
							<div class="number">#1</div>
							<div class="info">
								<section>
									<div class="title">출발일</div>
									<div><%=startDay%></div>
								</section>
								<section>
									<div class="title">여행기간</div>
									<div>
										<%if(cnt == 4){%>
									         당일
										<%}else if(cnt == 6){%>
											1박2일
										<%}else if(cnt == 8){%>
											2박3일 
										<%} %>
								    </div>
									
								</section>
								<section>
									<div class="title">여행테마</div>
									<div><%if("M".equals(type)){%>
										  	가족여행 
											<%}else if ("F".equals(type)){%>
											친구여행 
											<%}else if("C".equals(type)){ %>
											커플여행 
											<%}else if("S".equals(type)){%>
											나홀로 여행 
											<%}%>
									</div>
								</section>
							</div>
						</div>
					</div>
					<!-- 이동버튼  -->
					<%
					session.removeAttribute("type");
					session.removeAttribute("startDay");
					session.removeAttribute("cnt");
					%>
					<a href="<%=request.getContextPath()%>/" class="tm-color-primary tm-btn-white-bordered">메인화면</a>
					<a href="<%=request.getContextPath()%>/member/memberReservation" class="tm-color-primary tm-btn-white-bordered">예약현황</a>
				</article>

			</div>
		</form>
	</div>
</div>



<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>