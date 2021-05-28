

                                                  <!-- THIS IS STUDENT ACCOUNT STATUS TRACK HOME PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ACCOUNT OPENING STATUS CHECK</title>

<link rel="stylesheet" href="">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 </head>
<script>
function Get_StudentAcc_Status(){

	var userid=document.getElementById("userid").value;
	if(userid==""){
		document.getElementById("appnoerr").style.display="block";	
	}else{
		document.getElementById("appnoerr").style.display="none";	
		
		  $.post("../GetStudentAcc_status",{
		       userId:userid 
		      },function(data,status){
		    	 //alert(data);
		    	 if(data=="0"){
		    		 document.getElementById("login-form").style.display="block";
		    		 document.getElementById("status_0").style.display="block";
		    		 document.getElementById("status_1").style.display="none";
		    		 document.getElementById("status_2").style.display="none";
		    		 document.getElementById("notfound").style.display="none";
		    		 
		    	 }
		    	 if(data=="1"){
		    		 document.getElementById("login-form").style.display="block";
		    		 document.getElementById("status_1").style.display="block";
		    		 document.getElementById("status_0").style.display="none";
		    		 document.getElementById("notfound").style.display="none";
		    		 document.getElementById("status_2").style.display="none";
		    	 }
		    	 if(data=="2"){
		    		 document.getElementById("login-form").style.display="block";
		    		 document.getElementById("status_1").style.display="none";
		    		 document.getElementById("status_0").style.display="none";
		    		 document.getElementById("status_2").style.display="block";
		    		 document.getElementById("notfound").style.display="none";
		    	 }
		    	 
		    	 if(data=="notfound"){
		    		 document.getElementById("login-form").style.display="block";
		    		 document.getElementById("status_1").style.display="none";
		    		 document.getElementById("status_0").style.display="none";
		    		 document.getElementById("status_2").style.display="none";
		    		 document.getElementById("notfound").style.display="block";
		    	 }
		    	 
		      });
		
	}
}

</script>
<style>
body {
    color: #999;
    background: #f5f5f5;
    font-family: 'Varela Round', sans-serif;
}
.form-control {
    border-color: #ddd;
}
.login-form {
    width: 500px;
    margin:55px auto;
   
}
.login-form {
    color: #434343;
    border-radius: 3px;
    margin-bottom: 15px;
    background: #fff;
    border: 2px solid #f3f3f3;
    border-radius: 10px;
    box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.3);
    padding:40px;
}
.login-form h4 {
    text-align: center;
    font-size: 25px;
    margin-bottom: 20px;
}
h5{
  text-align: center;
}
.login-form .forgot-link {
    float: right;
}
</style>

   <!-- java code -->
<%

response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires","0");
%>
<body>
<img src="t.jpg" style="width:100%;height:100px;">

<br>
<br>
<br>
<br>
  <form>
  
  <div  class="col-sm-4">
        </div>
  <div  class="col-md-4" style="">
        <input type="text" class="form-control" id="userid" placeholder="Enter Your Application id..">
        <p style="color:red;display:none" id="appnoerr">&nbsp; *required </p>
        <br>
        <div style="text-align:center">
        <button type="button" class="btn btn-success" onclick="Get_StudentAcc_Status()">CHECK YOUR STATUS</button>
        </div>
        </div>
  </form>
  <br>
  <br> 
  <br> 
 <div class="login-form" id="login-form" style="display:none">   
	
    	<div id="status_0"  style="display:none">
    	<h4>Your User id <span style="font-size:17px;text-decoration:underline"> <%%> </span>is under verfication!,Please Wait till our Administrator Approval ,once Your Account is verfied you will get notified &#128512;</h4>
        <h5>Return to HomePage  <a href="../index.jsp"> click here </a></h5>
        </div>
        
        <div id="status_1" style="display:none">
    	<h4>Your User id <span style="font-size:17px;text-decoration:underline"> <%%> </span>is Verified and Approved Successsfully &#128512; &#128512;</h4>
        <h5>Login to your account  <a href="StudentLogin.jsp">here </a></h5>
        </div>
        
         <div id="status_2" style="display:none">
    	<h4>Your User id <span style="font-size:17px;text-decoration:underline"> <%%> </span>is Rejected because of,The details given by you was Invalid !! Please try again with valid details..</h4>
        <h5>Return to HomePage  <a href="../index.jsp"> click here </a></h5>
        </div>
        
        
        <div id="notfound" style="display:none">
     	<h4>Entered  User id <span style="font-size:17px;text-decoration:underline"> <%%> </span>is Not found in our Database,Please Enter Valid Application id !!</h4>
      <h5>Return to HomePage  <a href="../index.jsp"> click here </a></h5>
        </div>
        
    </div>         	
    
 
    	

</body>
</html>       
  
  
  
  
  
