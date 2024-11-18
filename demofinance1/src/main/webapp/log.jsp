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
String mail=request.getParameter("email");
String pass=request.getParameter("password");

/*mail="shiva@gmail.com";
pass="1234567890";
*/

regis r=new regis();
int res=r.log(mail,pass);
if(res==1){
	response.sendRedirect("http://localhost:8080/demofinance1/reminder.jsp?mail="+mail);
}
else
{
	
	out.println("<h1>Account Not Found!</h1>");
	 out.println("Click Here For Login Again <a href='login.html'>Login</a>");
	
}


%>
</body>
</html>