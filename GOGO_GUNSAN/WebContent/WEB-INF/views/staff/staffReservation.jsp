<%@page import="reservation.model.vo.ReservationView"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/staff/common/staffHeader.jsp" %>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/reservation/reservationTable.css">   
<%
	List<ReservationView> list = (List<ReservationView>)request.getAttribute("list");

%>    


		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
				
<div class="container">
        <h2>예약 현황</small></h2>
        <ul class="responsive-table">
            <li class="table-header">
                <div class="col col-1">예약번호</div>
                <div class="col col-2">예약일</div>
                <div class="col col-3">관광지명</div>
                <div class="col col-4">예약자</div>
                <div class="col col-5">전화번호</div>
                <div class="col col-6">어른 인원</div>
                <div class="col col-7">어린이 인원</div>
                <div class="col col-8">총가격</div>
                <div class="col col-9">예약 날짜</div>
            </li>
            <%if (list == null || list.isEmpty()) {%>
            <li class="table-row">
            	<div class=error>검색결과가 없습니다.</div>
            </li>
            <%
            	} else {
				for (ReservationView rv : list) { %>
            <li class="table-row">
                <div class="col col-1" data-label="Job Id"><%=rv.getReservationId() %></div>
                <div class="col col-2" data-label="Customer Name"><%=rv.getReservationDate() %></div>
                <div class="col col-3" data-label="Amount"><%=rv.getTourInfoName() %></div>
                <div class="col col-4" data-label="Payment Status"><%=rv.getMemberName() %></div>
                <div class="col col-5" data-label="Payment Status"><%=rv.getMemberPhone() %></div>
                <div class="col col-6" data-label="Payment Status"><%=rv.getAdultAmount() %></div>
                <div class="col col-7" data-label="Payment Status"><%=rv.getChildAmount() %></div>
                <div class="col col-8" data-label="Payment Status"><%=rv.getTotalPrice() %>원</div>
                <div class="col col-9" data-label="Payment Status"><%=rv.getTourDateTime() %></div>
            </li>				
				<%} 
				}%>
           
        </ul>
    </div>    
		
		</div>
<%@ include file="/WEB-INF/views/staff/common/staffFooter.jsp" %>