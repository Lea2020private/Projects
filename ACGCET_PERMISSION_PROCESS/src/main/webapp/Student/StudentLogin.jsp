
<%
//check and erase all the cookies
  
        Cookie cookie=new Cookie("student_login_key","");
        cookie.setPath(request.getContextPath());
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	    
	    Cookie cookie1=new Cookie("student_forgot_password_key","");
	    cookie1.setPath(request.getContextPath());
	    cookie1.setMaxAge(0);
	    response.addCookie(cookie1);
	    
	/*  Cookie cookie2=new Cookie("incharge_login_key","");
        cookie2.setPath(request.getContextPath());
	    cookie2.setMaxAge(0);
	    response.addCookie(cookie2);
	    
	    Cookie cookie3=new Cookie("incharge_forgot_password_key","");
        cookie3.setPath(request.getContextPath());
	    cookie3.setMaxAge(0);
	    response.addCookie(cookie3);    */
	    
	    
  response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires","0");
	    
	    
%>
                                                  <!-- THIS IS STUDENT LOGIN HOME PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STUDENT LOGIN</title>

<link rel="stylesheet" href="">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

 </head>
<script>
function LoginCheck(){
	
	var uname=document.getElementById("uname").value;
	var pass=document.getElementById("pass").value;
	var error=0;
	if(uname==""){
		document.getElementById("unameerr").style.display="block";
		error++;
	}else{
		document.getElementById("unameerr").style.display="none";
	}
	if(pass==""){
		document.getElementById("passerr1").style.display="block";
		error++;
	}else{
		document.getElementById("passerr1").style.display="none";
		if(pass.length>=8){
			document.getElementById("passerr2").style.display="none";
		
		}else{
			document.getElementById("passerr2").style.display="block";
			error++;
		}
	}
	if(error==0){
		
		  $.post("../StudentLoginVerify",{
	          username:uname,
	          password:pass
	     },function(data,status){
	    	 //alert(data);
	          if(data=="not_found"){
	        	  document.getElementById("validate_err1").style.display="block"; 
	        	  document.getElementById("validate_err2").style.display="none"; 
	        	  document.getElementById("validate_err3").style.display="none"; 
	          }
	          //get a acc_open status
	          else if(data=='0'){
	        	  document.getElementById("validate_err1").style.display="none"; 
	        	  document.getElementById("validate_err2").style.display="block"; 
	        	  document.getElementById("validate_err3").style.display="none"; 
	          }
	          else if(data=='1'){
	        	  window.location.href="StudentPortal.jsp";
	          }else if(data=='2'){
	        	  document.getElementById("validate_err1").style.display="none";  
	        	  document.getElementById("validate_err2").style.display="none"; 
	        	  document.getElementById("validate_err3").style.display="block";
	          }
	     
	     });

		
	   }
	}
function showpassword(){
	  var password = document.getElementById("pass");
	  if (password.type === "password") {
	    password.type = "text";
	  } else {
	    password.type = "password";
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
.form-control:focus {
    border-color: #4aba70; 
}
.login-form {
    width: 500px;
    margin:55px auto;
   
}
.login-form form {
    color: #434343;
    border-radius: 3px;
    margin-bottom: 15px;
    background: #fff;
    border: 2px solid #f3f3f3;
    border-radius: 10px;
    box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.3);
    padding:10px;
}
.login-form h4 {
    text-align: center;
    font-size: 25px;
    margin-bottom: 20px;
}

.login-form .form-group {
    margin-bottom: 20px;
}
.login-form .form-control, .login-form .btn {
    min-height: 40px;
    border-radius: 2px; 
    transition: all 0.5s;
}

.login-form .btn:hover, .login-form .btn:focus {
    background: #42ae68;
}
.login-form input {
   padding:10px;
}
.login-form .forgot-link {
    float: right;
}

.validate_err{
border:2px solid;
border-radius:5px;
padding:10px;
text-align: center;
}
</style>
<body>
<img src="t.jpg" style="width:100%;height:100px;">
<div id="login">
<div class="login-form">    
    <form method="post">
    
		<p class="validate_err alert alert-danger" id="validate_err1" style="display:none;margin-top:15px;margin-bottom:5px;">These credentials do not match our records. !!!</p>
		
		<p class="validate_err alert alert-success" id="validate_err2" style="display:none;margin-top:15px;margin-bottom:5px;">Please wait till our Administrator verification,Once verified you will notified . !!!</p>
	
		<p class="validate_err alert alert-danger" id="validate_err3" style="display:none;margin-top:15px;margin-bottom:5px;">Your Account opening request was rejected because of invalid details,So you are not able to login!!!</p>
		<br>
		
		<h4 class="modal-title" style="margin-bottom:5px;background-color:black;color:white">Student Login</h4>
		<br>
		
    	<h4 class="modal-title" style="margin-bottom:5px;">Login to Your Account</h4>
    	
    	<br>

    	 <p>USER NAME</p>
    	 <p style="color:red;display:none;float:right" id="unameerr">*required </p>
 
        <div class="form-group input-group">
            
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" class="form-control" placeholder="Username" id='uname' name='uname' required="required">
        </div>
        <p>PASSWORD</p>
         <p style="color:red;display:none;float:right" id="passerr1">*required </p>
         <p style="color:red;display:none;" id="passerr2">*password length must be 8 </p>
        <div class="form-group input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" class="form-control" placeholder="Password" id="pass" name='password' required="required">
           
        </div>
        <div style="margin-left:20px;">
         <input type="checkbox" onclick="showpassword()">&nbsp; Show Password
         </div>
        <div class="form-group small clearfix">
            <a href="Stud_ForgotPassword.jsp" class="forgot-link">Forgot Password?</a>
        </div>
      
        <input name='login' type="button" id="btn" style="margin-left:185px;border-radius:10px;" onclick="LoginCheck()" class="btn btn-primary" value="Login">              
    </form>			
    <div class="text-center small">Don't have an account? <a href="StudentRegistration.jsp" style="cursor:pointer;">Sign up</a></div>
    <div class="text-center small">Return back to Home page <a href="../index.jsp" style="cursor:pointer;">click here</a></div>
</div>
</div>

</body>
</html>       
  
  
  
  
  
