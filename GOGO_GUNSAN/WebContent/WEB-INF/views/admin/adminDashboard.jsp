<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tour_info.model.vo.TourInfo"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/admin/common/adminHeader.jsp" %>
<%
   List<Reservation> reservationAll = (List<Reservation>)request.getAttribute("reservationListAll");
   List<TourInfo>   t = (List<TourInfo>)request.getAttribute("tourInfoHasTicket");
   DecimalFormat frm = new DecimalFormat("###,###,###");

    int totalAmount = 0;
    int totalPrice = 0;
    List<Integer> tAmount= new ArrayList<>();
    List<Integer> tPrice= new ArrayList<>();
    List<Integer> ratio= new ArrayList<>();
 
    if( !reservationAll.isEmpty() || reservationAll !=null ){
	   for(Reservation r : reservationAll ){
		   totalAmount += r.getChildAmount()+ r.getAdultAmount();
		   totalPrice += Integer.parseInt(r.getTotalPrice());
		
	   }
    }
       for(int i=0; i<t.size();i++){
		int amount = 0;
		int price = 0 ;
         for(Reservation r : reservationAll){
	  	if(t.get(i).getTourInfoId().equals(r.getTourInfoId())){
		  amount += r.getChildAmount()+ r.getAdultAmount();
			System.out.println("t.get(i).getTourInfoId()=="+t.get(i).getTourInfoId());
		  price +=  Integer.parseInt(r.getTotalPrice());
	  	 }
    	}
		System.out.println(t.get(i).getTourInfoId()+"="+amount );
	   	tAmount.add(amount);
	   	tPrice.add(price);  
    		
    }

    int idx=0;
 	for(Integer a : tAmount ){
 		int r = (int)(((double)tAmount.get(idx)/(double)totalAmount)*100);
 		System.out.println(t.get(idx).getTourInfoName()+"=" +r);
 		idx++;
 		ratio.add(r);
 	 }
    
   
    
    
   System.out.println("totalAmount="+totalAmount);
   System.out.println("totaltotalPrice="+totalPrice);

          

%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '관광지명');
        data.addColumn('string', '예약건');
        data.addColumn('string', '금액');
        data.addColumn('string', '비율');
        data.addRows([
          ['<%=t.get(0).getTourInfoName() %>',   '<%= tAmount.get(0)%>',  '<%=frm.format(tPrice.get(0))%>원', '<%=ratio.get(0)%>%' ],
          ['<%=t.get(1).getTourInfoName() %>',   '<%=tAmount.get(1)%>'  ,    '<%=frm.format(tPrice.get(1))%>원',  '<%=ratio.get(1)%>%'],
          ['<%=t.get(2).getTourInfoName() %>', '<%=tAmount.get(2)%>' , '<%=frm.format(tPrice.get(2))%>원', '<%=ratio.get(2)%>%'],
          ['<%=t.get(3).getTourInfoName() %>',    '<%=tAmount.get(3)%>',   '<%=frm.format(tPrice.get(3))%>원', '<%=ratio.get(3)%>%'],
          ['<%=t.get(4).getTourInfoName() %>',    '<%=tAmount.get(4)%>',   '<%=frm.format(tPrice.get(4))%>원',  '<%=ratio.get(4)%>%'],
          ['<%=t.get(5).getTourInfoName() %>',    '<%=tAmount.get(5)%>',   '<%=frm.format(tPrice.get(5))%>원',  '<%=ratio.get(5)%>%'],
          ['<%=t.get(6).getTourInfoName() %>',    '<%=tAmount.get(6)%>',   '<%=frm.format(tPrice.get(6))%>원', '<%=ratio.get(6)%>%'],
          ['<%=t.get(7).getTourInfoName() %>',    '<%=tAmount.get(7)%>',   '<%=frm.format(tPrice.get(7))%>원',  '<%=ratio.get(7)%>%'],
          ['<%=t.get(8).getTourInfoName() %>',    '<%=tAmount.get(8)%>',   '<%=frm.format(tPrice.get(8))%>원', '<%=ratio.get(8)%>%'],
          ['<%=t.get(9).getTourInfoName() %>',    '<%=tAmount.get(9)%>',   '<%=frm.format(tPrice.get(9))%>원',  '<%=ratio.get(9)%>%'],
          ['<%=t.get(10).getTourInfoName() %>',    '<%=tAmount.get(10)%>',   '<%=frm.format(tPrice.get(10))%>원',  '<%=ratio.get(10)%>%'],
          ['<%=t.get(11).getTourInfoName() %>',    '<%=tAmount.get(11)%>',   '<%=frm.format(tPrice.get(11))%>원',  '<%=ratio.get(11)%>%']

        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
      }
    </script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],
            ['<%=t.get(0).getTourInfoName() %>',   <%=ratio.get(0)%>],
            ['<%=t.get(1).getTourInfoName() %>',   <%=ratio.get(1)%>],
            ['<%=t.get(2).getTourInfoName() %>',  <%=ratio.get(2)%>],
            ['<%=t.get(3).getTourInfoName() %>', <%=ratio.get(3)%>],
            ['<%=t.get(4).getTourInfoName() %>', <%=ratio.get(4)%>],
            ['<%=t.get(5).getTourInfoName() %>', <%=ratio.get(5)%>],
            ['<%=t.get(6).getTourInfoName() %>', <%=ratio.get(6)%>],
            ['<%=t.get(7).getTourInfoName() %>', <%=ratio.get(7)%>],
            ['<%=t.get(8).getTourInfoName() %>', <%=ratio.get(8)%>],
            ['<%=t.get(9).getTourInfoName() %>', <%=ratio.get(9)%>],
            ['<%=t.get(10).getTourInfoName() %>', <%=ratio.get(10)%>],
            ['<%=t.get(11).getTourInfoName() %>', <%=ratio.get(11)%>]
        ]);

        var options = {
          title: '관광지별 예약 현황'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>

 <style>
 .dashboard-container{
  width: 100%;
  margin: 6%;
  text-align: center;
 
 }
 
 </style>

		<!-- ============================================================== -->
		<!-- wrapper  -->
		<!-- ============================================================== -->
		<div class="dashboard-wrapper">
			<div class= "dashboard-container">
		   <span style=" float: left; "><b>총 예약건:<%=totalAmount %>건&nbsp;&nbsp;</b></span>
		   <span style=" float: left; "><b>총 금액:<%=frm.format(totalPrice) %>원 </b></span>
		   </br>
		  <div id="table_div"  style="width: 520px; float: left;  padding-top: 20px;"></div>
		   <div id="piechart" style="width: 400px; height: 250px; float: left;"></div>

			 </div>

		
		</div>
		
		 
<%@ include file="/WEB-INF/views/admin/common/adminFooter.jsp" %>
	