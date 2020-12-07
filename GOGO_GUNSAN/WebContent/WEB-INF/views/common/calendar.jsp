<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto:300,400,700'>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/calendar/calendar.css">
<!-- partial:index.partial.html -->
<div id="calendar"></div>
<!-- partial -->
<script src='https://npmcdn.com/react@15.3.0/dist/react.min.js'></script>
<script src='https://npmcdn.com/react-dom@15.3.0/dist/react-dom.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment-with-locales.min.js'></script>
<script src="<%=request.getContextPath()%>/js/calendar/calendar.js"></script>
