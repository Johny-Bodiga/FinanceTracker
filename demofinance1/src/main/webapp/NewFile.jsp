<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
       
<!--script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body class="bg-light">
     <%@page import="maven.FinanceTracker.regis" %>
           <%@page import="java.lang.*" %>
       <%
           String fn=request.getParameter("amt");
           String ln=request.getParameter("ln");
           String pw=request.getParameter("pw1");
           String mb=request.getParameter("mb");
           String mail=request.getParameter("mail");
           
        //   out.println(fn);
         
          
         
      /*   fn="Harsha";
          ln="M";
          pw="123456789";
          mb="9110537608";
          mail="hams@gmail.com";*/
          
          
           int res=0;
         regis r=new regis();
        	 res=r.sh(fn,ln,pw,mb,mail);
        	 if(res==1){
        		 //out.println("<h1>Email has used!</h1>");
        	  response.sendRedirect("http://localhost:8080/demofinance1/login.html");
        	 }
        	 else{
        		 out.println("<h1>Email has already used!</h1>");
        		 out.println("Click Here For Fresh <a href='reg.html'>Registration</a>");
        		
        	 }
           
           out.println(res);
           %>
           <script type="text/javascript">
           localStorage.setItem("res", <%=res%>); 
           </script>
    </body>
</html>