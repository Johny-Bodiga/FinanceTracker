<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<!--script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<link href="card.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
<%
     int n=Integer.parseInt(request.getParameter("n"));
     
%>
	<br />
	<br />
	<span class="h1" style="font-family: 'Times New Roman', Times, serif;"><center>Finance Tracker</center></span>
	<pre>                                                                                                                                                                     <a href="remain.jsp" class="icon-link"><i class="bi bi-bell fs-1" ></i></a><span id="badge1" class="badge bg-danger"></span></pre>
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="card bg-light w-90 h-60 border border-3">
					<div class="card-header text-center">
						<h2 style="font-family: 'Times New Roman', Times, serif;"
							align="center">Add Money</h2>
					</div>
					<div class="card-body text-center ">
						<a href="money.html"><button type="button"
								class="btn btn-primary">ADD</button></a>
					</div>
				</div>

			</div>

			<div class="col-sm-4">
				<div class="card bg-light w-70 h-60 border border-3">
					<div class="card-header text-center">
						<h2 style="font-family: 'Times New Roman', Times, serif;"
							align="center">Savings</h2>
					</div>
					<div class="card-body text-center">
						<button type="button" class="btn btn-primary" onclick="save()">SAVE</button>
					</div>
				</div>

			</div>

			<div class="col-sm-4">
				<div class="card bg-light w-100 h-60 border border-3">
					<div class="card-header text-center">
						<h2 style="font-family: 'Times New Roman', Times, serif;"
							align="center">Expenses</h2>
					</div>
					<div class="card-body text-center">
						<button type="button" class="btn btn-primary" onclick="spend()">SPEND</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="card bg-light w-100 h-60 border border-3">
					<div class="card-header text-center">
						<h2 style="font-family: 'Times New Roman', Times, serif;"
							align="center">Goals</h2>
					</div>
					<div class="card-body text-center">
						<a href="goal.html"><button type="button"
								class="btn btn-primary">ADD</button></a>
					</div>
				</div>

			</div>

			<div class="col-sm-4">
				<div class="card bg-light w-100 h-60 border border-3">
					<div class="card-header text-center">
						<h2 style="font-family: 'Times New Roman', Times, serif;"
							align="center">Intrest Calculator</h2>
					</div>
					<div class="card-body text-center">
						<a href="calci.html"><button type="button"
								class="btn btn-primary">CALCULATE</button></a>
					</div>
				</div>

			</div>

			<div class="col-sm-4">
				<div class="card bg-light w-100 h-60 border border-3">
					<div class="card-header text-center">
						<h2 style="font-family: 'Times New Roman', Times, serif;"
							align="center">Available Balance</h2>
					</div>
					<div class="card-body text-center">
						<a href="bal.html"><button type="button"
								class="btn btn-primary">CHECK</button></a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br />
	<br />
	<center>
		<button type="button" class="btn btn-primary btn-lg" onclick="hi()">History</button>
	</center>
	<script>
	       var n1=<%=n%>;
	       if(n1!=null)
	       document.getElementById("badge1").innerHTML = n1;
             function hi(){
            	 var email = localStorage.getItem("mail");
            	 var jspcall="details.jsp?email="+email;
               	window.location.href=jspcall;
             }
              function save(){
            	  var email = localStorage.getItem("mail");
            	  var p="save";
             	 var jspcall="balance.jsp?email="+email+"&p="+p;
                	window.location.href=jspcall;
                  }
              function spend(){
            	  var email = localStorage.getItem("mail");
            	  var p="spend";
             	 var jspcall="balance.jsp?email="+email+"&p="+p;
                	window.location.href=jspcall;
                  }

   </script>
</body>
</html>