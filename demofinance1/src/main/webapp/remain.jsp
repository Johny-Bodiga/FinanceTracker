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
hist h=new hist();
List<history> hlist = new ArrayList<>();
hlist=h.rem(mail);
int i=0;
//out.println(hlist.get(0).getId());
out.println(" <br/>");
out.println("<center><b class='h1'>Todays Goal </b></center>");
out.println(" <br/>");
out.println(" <br/>");
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

for(i=0;i<hlist.size();i++){
	out.println(" <tr>");
out.println("<td>"+(i+1)+"</td>");
out.println("<td>"+hlist.get(i).getAmount()+"</td>");
out.println("<td>"+hlist.get(i).getPay()+"</td>");
out.println("<td>"+hlist.get(i).getPurpose()+"</td>");
out.println("<td>"+hlist.get(i).getOther()+"</td>");
out.println("<td>"+hlist.get(i).getDate().substring(0,10)+"</td>");
out.println("<td>"+hlist.get(i).getFin()+"</td>");
out.println(" </tr>");
}
   
    out.println("</tbody>");
    out.println(" </table>");
    out.println("</div>");

%>
</body>
</html>