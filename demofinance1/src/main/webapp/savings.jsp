<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="maven.FinanceTracker.*" %>
       <%     
           String amt=request.getParameter("amt");
           String fin=request.getParameter("fin");
           String text=request.getParameter("text");
           String email=request.getParameter("email");
           String text1=text.substring(0,25);
        /*   
          amt="2000";
           fin="add";
           type="cash";
           text="11-11-2024";
           email="bodiga@gmail.com";*/
           hist h=new hist();
           out.println(amt+" "+fin+" "+text1+" "+email);
          h.savings(amt,fin,text1,email);
          response.sendRedirect("http://localhost:8080/demofinance1/save.jsp");
        	 
           %>
</body>
</html>