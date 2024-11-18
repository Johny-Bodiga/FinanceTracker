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
<script type="text/javascript">
function sub(){
	var cat=document.getElementById("sel1").value;
	var month=document.getElementById("sel2").value;
	document.write(cat+" "+month);
	 var jspcall="history.jsp?sel1="+cat+"&sel2="+month;
    	window.location.href=jspcall;
}
</script>
  <%@page import="maven.FinanceTracker.*" %>
<%@page import="java.util.*" %>
<%
String mail=request.getParameter("email");

//String mail="s@gmail.com";
session.setAttribute("mail",mail);

out.println("<div class='container mt-3 '>");
out.println("<form >");
out.println("<label for='sel1' class='form-label'>Select Category</label>");
out.println("<select class='form-select' id='sel1'>");
out.println("<option>All</option>");
out.println("<option>Credited</option>");
out.println("<option>Savings</option>");
out.println("<option>Expenses</option>");
out.println("<option>Goals</option>");
out.println("</select>");

out.println("<br/>");




out.println("<label for='month' class='form-label'>Month</label>");
out.println("<select class='form-select' id='sel2'>");
out.println("<option>All</option>");
out.println("<option>January</option>");
out.println("<option>Februry</option>");
out.println("<option>March</option>");
out.println("<option>April</option>");
out.println("<option>May</option>");
out.println("<option>June</option>");
out.println("<option>July</option>");
out.println("<option>August</option>");
out.println("<option>September</option>");
out.println("<option>October</option>");
out.println("<option>November</option>");
out.println("<option>December</option>");
out.println("</select>");
out.println("<button type='submit' class='btn btn-primary mt-3' onclick='sub()' >Apply Filter</button>");
out.println("</form>");
out.println("</div>");




hist h=new hist();
List<history> hlist = new ArrayList<>();
hlist=h.details(mail);
int i=0;
//out.println(hlist.get(0).getId());
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