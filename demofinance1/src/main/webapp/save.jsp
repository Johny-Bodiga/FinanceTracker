<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!--script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body class="bg-light">
     <%
           int total= (int) session.getAttribute("total");
      %>
        <center>
            <br/><br/>
            <form class="was-validated" novalidate>
            <div class="form-floating mb-3 mt-3 w-50">
                <input type="number" class="form-control" id="amt" placeholder="Enter amt" name="amt" required>
                <label for="amt">Amount(in Rs.)</label>
                <div id="amount" class="invalid-feedback">
                    Please provide Amount.
                  </div>
              </div>
              <br/>

             
              <br/>
              <pre><button type="button" class="btn btn-primary btn-lg" onclick="valid()">Save</button>                                               <button type="reset" class="btn btn-danger btn-lg" onclick="clo()">Cancel</button></pre>
              </form>
              <br/>
              <button type="button" class="btn btn-primary btn" onclick="click1()">Back</button>
              
              <div class="modal" id="myModal">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">

      <!-- Modal body -->
      <div class="modal-body">
        <br/>
        <h2>Saved Successfully</h2>
        <br/>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="cl()">Close</button>
      </div>
                  </div>
                </div>
              </div>
              
          <div class="modal" id="myModal1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">

      <!-- Modal body -->
      <div class="modal-body">
        <br/>
        <h2>Insufficient Balance</h2>
        <br/>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="clos()">Close</button>
      </div>
                  </div>
                </div>
              </div>

        </center>
        <script>
        function click1(){
       	 var mail = localStorage.getItem("mail"); 
       	 var jspcall="reminder.jsp?mail="+mail;
         	window.location.href=jspcall;
           }
           function clo(){
            const diva=document.querySelector("#amount");
            diva.style.display="block";
          }
          function cl(){
        	  var amt=document.getElementById("amt").value;
              var fin="Savings";
        	  const d = new Date();
              let text = d.toString();
              var email = localStorage.getItem("mail"); 
             // document.write(text);
              
             var jspcall="savings.jsp?amt="+amt+"&fin="+fin+"&text="+text+"&email="+email;
             	window.location.href=jspcall;
            
        $("#myModal").modal("hide");
       }
          function clos(){
        	  $("#myModal1").modal("hide");
              }
        function valid(){
          var amt=document.getElementById("amt").value;
          const diva=document.querySelector("#amount");
          
          var c=0,i=0,c1=0;
          for(i=0;i<amt.length;i++){
          if(amt.charAt(i)==="e" )
          c1=1;
          }
          if(amt.length==0)
          c1=1;
          amt=parseInt(amt);

          if(amt<=0 || c1==1)
        {
          c=1;
          diva.style.display="block";
        }
        else{
          c=0;
          diva.style.display="none";
        }
          
          var total='${total}';
          console.log(total);
          if(total <amt)
          	$("#myModal1").modal({backdrop:false});
        	
          else if(c==0 && c1==0)
        $("#myModal").modal({backdrop:false});
        }
        
      </script>
     
    </body>
</html>