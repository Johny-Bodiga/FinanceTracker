<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-light">
<%@page import="maven.FinanceTracker.*" %>
<%@page import="java.util.*" %>
<%
String mail= (String) session.getAttribute("mail");
String sel=request.getParameter("sel1");
String month=request.getParameter("sel2");
hist h=new hist();
//out.print(mail+" "+sel+" "+month);
List<history> hlist = new ArrayList<>();
if(sel.equals("All") && month.equals("All"))
	response.sendRedirect("http://localhost:8080/demofinance1/details.jsp?email="+mail);
else if(!month.equals("All"))
	hlist=h.month2(mail, sel, month);
else if(month.equals("All"))
	hlist=h.month1(mail,sel);

int i=0;
//out.println(hlist.get(0).getId());
out.println("<div class='container mt-3'>");
out.println("<table class='table table-striped'>");
out.println("<thead>");
out.println("<tr class='table-success'>");
out.println("<th>Mail</th>");
out.println("<th>Category</th>");
out.println("<th>Month</th>");
out.println("</tr>");
out.println("</thead>");
out.println("<tbody>");
out.println(" <tr class='table-info'>");
out.println("<td>"+mail+"</td>");
out.println("<td>"+sel+"</td>");
out.println("<td>"+month+"</td>");
out.println(" <tr>");
out.println("</tbody>");
out.println(" </table>");
out.println("</div>");

out.println("<br/>");
out.println("<br/>");


out.println("<div class='container mt-3'>");
out.println("<table class='table table-striped'>");
out.println("<thead>");
out.println("<tr>");
out.println("<th>Sno</th>");
out.println("<th>Amount</th>");
out.println("<th>Payment</th>");
out.println("<th>Purpose</th>");
out.println("<th>Others</th>");
out.println("<th>Date</th>");
out.println("<th>Category</th>");
out.println("</tr>");
out.println("</thead>");
out.println("<tbody>");

for(i=hlist.size()-1;i>=0;i--){
	out.println(" <tr>");
out.println("<td>"+(hlist.size()-i)+"</td>");
out.println("<td>"+hlist.get(i).getAmount()+"</td>");
out.println("<td>"+hlist.get(i).getPay()+"</td>");
out.println("<td>"+hlist.get(i).getPurpose()+"</td>");
out.println("<td>"+hlist.get(i).getOther()+"</td>");
if(hlist.get(i).getFin().equals("Goals"))
out.println("<td>"+hlist.get(i).getDate().substring(0,10)+"</td>");
else
	out.println("<td>"+hlist.get(i).getDate()+"</td>");
out.println("<td>"+hlist.get(i).getFin()+"</td>");
out.println(" </tr>");
}
 
  out.println("</tbody>");
  out.println(" </table>");
  out.println("</div>");
%>
</body>
</html>