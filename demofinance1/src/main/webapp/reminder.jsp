<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="card.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@page import="maven.FinanceTracker.*" %>
<%@page import="java.util.*" %>
<%
   hist h=new hist();
String mail=request.getParameter("mail");
//out.println(mail);
List<history> hlist = new ArrayList<>();
hlist=h.rem(mail);
session.setAttribute("mail",mail);
int n=hlist.size();
response.sendRedirect("http://localhost:8080/demofinance1/main.jsp?n="+n);

%>
</body>
</html>