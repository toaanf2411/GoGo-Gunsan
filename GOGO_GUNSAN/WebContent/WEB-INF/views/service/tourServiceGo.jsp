<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/tourService.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/service/vegas.min.css">
<!-- javscript js -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/service/service.js"></script>
<script src="<%=request.getContextPath()%>/js/service/wow.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
function reservation(){
	//로그인 여부 검사
	if(<%=memberLoggedIn == null%>){
		alert("로그인후 이용하실 수 있습니다.");
		$(this).attr("href","<%=request.getContextPath()%>/service/tourServiceGo");
		return false;
	}
	return true;
};
</script>
<!-- home section -->
<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-sm-12">
				<div class="home-thumb">
					<h1 class="wow fadeInUp" data-wow-delay="0.4s">맞춤서비스</h1>
                <h3 class="wow fadeInUp" data-wow-delay="0.6s">바쁜 당신을 위해 저희 고고군산이 준비했습니다.</br>
                   <strong>한번의 클릭으로</strong>계획해 드립니다.</h3>
                   <form action ="<%=request.getContextPath()%>/service/tourServiceSelect" method="GET"
                   onsubmit="return reservation();"> 
          			<button  class="btn btn-lg btn-default smoothScroll wow fadeInUp hidden-xs" data-wow-delay="0.8s" >Let's begin</button>
                   </form>
				</div>
			</div>
		</div>
	</div>		
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
