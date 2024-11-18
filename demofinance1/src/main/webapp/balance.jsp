<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="bg-light">
    <%@page import="maven.FinanceTracker.*" %>
    <%
       String mail=request.getParameter("email");
    String p=request.getParameter("p");
    String pass1=request.getParameter("pass1");
    String pass=request.getParameter("pass");
       hist h=new hist();
       //out.println(mail);
       int total=h.sumAll(mail);
       //out.println(pass1+" "+pass);
        session.setAttribute("total",total);
     if(p!=null && p.equals("save")){
    	 
    	 response.sendRedirect("http://localhost:8080/demofinance1/save.jsp");
     }
     else if(p!=null && p.equals("spend"))
    	 response.sendRedirect("http://localhost:8080/demofinance1/expense.jsp");
    
    else if(pass.equals(pass1)){
     out.println("<br/>");
     out.println("<br/>");
     out.println("<br/>");
     out.println("<br/>");
     out.println("<br/>");
     
       out.println("<center>");
        out.println("<div class='col-sm-4'>");
        out.println("<div class='card bg-success text-white'>");
        out.println("<div class=' w-100 h-60'>");
        out.println("<div class='card-header text-center'><h2 style=' font-family: 'Times New Roman', Times, serif;' align='center'>Available Balance</h2></div>");
        out.println("<div class='card bg-light text-dark'>");
        
        out.println("<div class='card-body text-center'><pre><h2>Rs."+total+"/-</h2></pre></div>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
        out.println("</center>");
     }
     else if(!pass1.equals(pass)){
    	  out.println("<br/>");
    	     out.println("<br/>");
    	     out.println("<br/>");
    	     out.println("<br/>");
    	     out.println("<br/>");
    	     
    	       out.println("<center>");
    	        out.println("<div class='col-sm-4'>");
    	        out.println("<div class='card bg-danger text-white'>");
    	        out.println("<div class=' w-100 h-60'>");
    	        out.println("<div class='card-header text-center'><h2 style=' font-family: 'Times New Roman', Times, serif;' align='center'>Incorrect Password</h2></div>");
    	        out.println("<div class='card bg-light text-dark'>");
    	        
    	        out.println("<div class='card-body text-center'><pre><h2>Try Again</h2></pre></div>");
    	        out.println("</div>");
    	        out.println("</div>");
    	        out.println("</div>");
    	        out.println("</div>");
    	        out.println("</center>");
     }
        %>
        
        
         </body>
        </html>