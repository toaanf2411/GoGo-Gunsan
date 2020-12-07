<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main/main.css">

<!-- 헤더 선언!!-->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 사이드메뉴 선언!  -->
<%@ include file="/WEB-INF/views/common/course_sidebar.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/course/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course/117.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/course/118.css" />
<style>
#course-container {
	width: 100%;
	max-width: 1050px;
	text-align: center;
	padding-right: 15%;
	padding-left: 5%;
}

.title {
	background-color: #c6c6c6;
}
div#img-course {
    padding-right: 20%;
}
.navigation{
	bottom: 520px !important;
    left: 26% !important;
}


</style>
<div class="gunsan-wrapper">
	<div id="course-container">
		<div class="slidershow ">
			<div class="title">
				<div class="cimage" style="float: left;" width="50%">
					<img
						src="<%=request.getContextPath()%>/images/photos/courseicon.jpg"
						alt=""></<img>
				</div>
				<div class="ctitle" style="float: left;" width="50%";>자전거</div>
				<span id="span-title">소요시간 : 12시간</span>
				<div class="slides">
					<input type="radio" name="r" id="r1" checked> <input
						type="radio" name="r" id="r2"> <input type="radio"
						name="r" id="r3"> <input type="radio" name="r" id="r4">
					<input type="radio" name="r" id="r5">
					<div class="slide s1">
						<img
							src="<%=request.getContextPath()%>/images/photos/나포생태문화탐방로.jpg"
							alt="나포생태문화탐방로">
					</div>
					<div class="slide">
						<img src="<%=request.getContextPath()%>/images/photos/축산제.jpg"
							alt="축산제">
					</div>
				<div class="detail">
					<div class="navigation">
						<label for="r1" class="sbar"></label> <label for="r2" class="bar"></label>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div id="img-course">
		<img src="<%=request.getContextPath()%>/images/course/자전거코스.png"
			alt="">
		<img width="700px" src="<%=request.getContextPath()%>/images/course/자전거코스지도.jpg"
			alt="">
		</div>
	</div>
</div>


<!-- 풋터 선언!!-->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>