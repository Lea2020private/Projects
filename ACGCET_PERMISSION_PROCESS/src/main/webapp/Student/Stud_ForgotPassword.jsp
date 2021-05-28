

 <%
response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires","0");

//delete all cookies
Cookie cookie=new Cookie("student_login_key","");
cookie.setPath(request.getContextPath());
cookie.setMaxAge(0);
response.addCookie(cookie);

Cookie cookie1=new Cookie("student_forgot_password_key","");
cookie1.setPath(request.getContextPath());
cookie1.setMaxAge(0);
response.addCookie(cookie1);

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FORGOT PASSWORD</title>

<link rel="stylesheet" href="">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 </head>
 <%
 response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
 response.setHeader("Pragma", "no-cache");
 response.setHeader("Expires","0");
 
 %>
 <script type="text/javascript">
 
 function ValidatePassword(){
 	//alert();
 	var password=document.getElementById("pass").value;
 	var confirmPassword=document.getElementById("cpass").value;
 	  var hasUpperLetter = 0;
 	  var hasLowerLetter = 0;
 	  var hasNumber  = 0;
 	  var hasSpecialChar = 0;
 	  var errors=0;
 	  if(password.length>=8){
 		 document.getElementById("passerr1").style.display="none";
 	    for (var i = 0; i < password.length; i++) {
 	      var charCode = password.charCodeAt(i);
 	      if(charCode > 47 && charCode < 58)
 	        hasNumber = 1;
 	      if(charCode > 64 && charCode < 91)
 	        hasUpperLetter = 1;
 	      if(charCode > 96 && charCode < 123)
 	        hasLowerLetter = 1;
 	      if((charCode > 32 && charCode < 48 )||(charCode > 57 && charCode < 65) || (charCode > 90 && charCode < 97) || (charCode > 122 && charCode < 127) )
 	        hasSpecialChar = 1;
 	    }
 	      
 	   if(hasNumber==0){
 		   document.getElementById("passerr4").style.display="block";
 		   errors++;
 	   }else{
 		   document.getElementById("passerr4").style.display="none";
 	   }
 	 
 	   if(hasUpperLetter==0){
 		   document.getElementById("passerr2").style.display="block";
 		  errors++;
 	   }else{
 		   document.getElementById("passerr2").style.display="none";
 	   }
 	   
 	   if(hasLowerLetter==0){
 		   document.getElementById("passerr3").style.display="block";
 		  errors++;
 	   }else{
 		   document.getElementById("passerr3").style.display="none";
 	   }
 	   if(hasSpecialChar==0){
 		   document.getElementById("passerr5").style.display="block";
 		   errors++;
 	   }else{
 		   document.getElementById("passerr5").style.display="none";
 	   }
 	   
 	  
 	   if(password==confirmPassword){
 		   document.getElementById("passerr6").style.display="none";
 		   
 	   }else{
 		   document.getElementById("passerr6").style.display="block";
 		   errors++;
 	   }
   
  }
  else{
 	 document.getElementById("passerr1").style.display="block";
 	 document.getElementById("passerr2").style.display="none";
 	 document.getElementById("passerr3").style.display="none";
 	 document.getElementById("passerr4").style.display="none";
 	 document.getElementById("passerr5").style.display="none";
 	 document.getElementById("passerr6").style.display="none";
 	errors++;
 	  }
 	
 if(errors==0){
	
	 
	  $.post("../StudentPassChange",{
       newpassword:password 
      },function(data,status){
    	 //alert(data);
      if(data=="changed_successfully"){
    	  
    	 alert("Password Changed Successfully , Login to continue");
    	 window.location.href="StudentLogin.jsp";
      } else{
    	  location.reload();
      }

    });
 }
 	  
 	  
 	  
 }

 function CheckAccExists(){
 	//alert("THAMIZH");
 	var uname=document.getElementById("uname").value;
 	var regno=document.getElementById("regno").value;
 	var securityqn=document.getElementById("securityqn").value;
 	var securityans=document.getElementById("securityans").value;
 	var errors=0;
 	// alert(uname);
 	
 	if(uname==""){
 		document.getElementById("unameerr").style.display="block";
 		errors++;
 	}else{
 		document.getElementById("unameerr").style.display="none";
 	}
 	
 	if(regno==''){
 		document.getElementById("regnoerr").style.display="block";
 		errors++;
 	}else{
 		document.getElementById("regnoerr").style.display="none";
 	}
 	
 	if(securityqn==''){
 		document.getElementById("sqnerr").style.display="block";
 		errors++;
 	}else{
 		document.getElementById("sqnerr").style.display="none";
 	}
 	if(securityans==''){
 		document.getElementById("sanserr").style.display="block";
 		errors++;
 	}else{
 		document.getElementById("sanserr").style.display="none";
 	}
 	
 	if(errors==0){
 		//alert(errors);
   //in this step check student acc exists or not
   
		  $.post("../StudentAccCheck",{
	          username :uname,
	          regno : regno,
	          securityqn : securityqn,
	          securityans: securityans
	        
          },function(data,status){
	    	 //alert(data);
	          if(data=="not_found"){
	        	  document.getElementById("validate_err1").style.display="block"; 
	        	  document.getElementById("validate_err2").style.display="none"; 
	        	  document.getElementById("validate_err3").style.display="none"; 
	        	  document.getElementById("validate_err4").style.display="none";
	        
	          }
	          //get a acc_open status
	          else if(data=="waiting"){
	        	  document.getElementById("validate_err1").style.display="none"; 
	        	  document.getElementById("validate_err2").style.display="none"; 
	        	  document.getElementById("validate_err3").style.display="block"; 
	        	  document.getElementById("validate_err4").style.display="none";
	     
	          }
	          else if(data=='exists'){
	        	  document.getElementById("forgotpass_1").style.display="none";
	        	  document.getElementById("forgotpass_2").style.display="block";
	          }else if(data=="mismatch"){

	        	  document.getElementById("validate_err1").style.display="none"; 
	        	  document.getElementById("validate_err2").style.display="block"; 
	        	  document.getElementById("validate_err3").style.display="none";
	        	  document.getElementById("validate_err4").style.display="none";
	        	   }else{
	        		   document.getElementById("validate_err1").style.display="none"; 
	 	        	   document.getElementById("validate_err2").style.display="none"; 
	 	        	   document.getElementById("validate_err3").style.display="none";
	 	        	   document.getElementById("validate_err4").style.display="block";
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

.validate_error{
border:2px solid;
border-radius:5px;
padding:10px;
text-align: center;
}

</style>

<body>
<img src="t.jpg" style="width:100%;height:100px;">
<div id="forgotpass_1">
<div class="login-form">    
    <form method="post">
    
		<p class="validate_error alert alert-danger" id="validate_err1" style="display:none;margin-top:15px;margin-bottom:5px;">These credentials do not match our records. !!!</p>
		
		<p class="validate_error alert alert-danger" id="validate_err2" style="display:none;margin-top:15px;margin-bottom:5px;">Security Question and Answer is wrong !!!</p>
		
		<p class="validate_error alert alert-warning" id="validate_err3" style="display:none;margin-top:15px;margin-bottom:5px;">Please Wait till your Account opening is to Verified Then you will be able to forgot your password !!!</p>
		
		<p class="validate_error alert alert-danger" id="validate_err4" style="display:none;margin-top:15px;margin-bottom:5px;">Your Account has Rejected because of Invalid data,Please try again with valid data!!!</p>
		<br>
		
		<h4 class="modal-title" style="margin-bottom:5px;background-color:black;color:white">Student</h4>
	
		<br>
    	<h4 class="modal-title" style="margin-bottom:5px;">CHANGE YOUR PASSWORD</h4>
    	
    	<br>
        <div class="form-group">
        <p>&nbsp; USER NAME</p>
            <input type="text" class="form-control" placeholder="Username" id="uname" name='uname' required="required">
             <p style="color:red;display:none" id="unameerr">*required </p>
        </div>
       
        <div class="form-group">
         <p>&nbsp; REGISTER NUMBER</p>
            <input type="text" class="form-control" name="regno" id="regno" placeholder="Enter your regno" required="required">
            <p style="color:red;display:none" id="regnoerr">*required </p>
        </div>
          <div class="form-group">
          <p>&nbsp; SECURITY QUESTION</p>
            <select class="form-control" id="securityqn" name="securityqn" required>
            <option value="none">NONE</option>
            <option value="1">WHICH IS YOUR FAVOURITE FOOD?</option>
            <option value="2">WHO IS YOUR FAVOURITE ACTOR?</option>
            <option value="3">WHO IS YOUR FAVOURITE CRICKETER?</option>
            <option value="4">WHAT IS YOUR FAVOURITE SUBJECT?</option>
          </select>
          <p style="color:red;display:none" id="sqnerr">*required </p>
        </div>
          <div class="form-group">
         <p>&nbsp; SECURITY ANSWER</p>
            <input type="text" class="form-control" name="securityans" id="securityans" placeholder="Enter your name" required="required">
            <p style="color:red;display:none" id="sanserr">*required </p>
        </div>
        
        <input type="button" style="margin-left:185px;border-radius:10px;" class="btn btn-primary" onclick="CheckAccExists()" value="PROCEED" >              
    </form>			
</div>
</div>

<div id="forgotpass_2" style="display:none">
<div class="login-form">    
    <form method="post">
		<br>
    	<h4 class="modal-title" style="margin-bottom:5px;">CHANGE YOUR PASSWORD</h4>
    	
    	<br>
          <div class="form-group">
         <p>&nbsp; PASSWORD</p>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter Password" required="required"><br>
            
            <p style="color:red;display:none" id="passerr1">*PASSWORD LENGTH MUST BE 8 </p>
            <p style="color:red;display:none" id="passerr2">*PASSWORD MUST CONTAIN UPPERCASE LETTER</p>
            <p style="color:red;display:none" id="passerr3">*PASSWORD MUST CONTAIN LOWERCASE LETTER</p>
             <p style="color:red;display:none" id="passerr4">*PASSWORD MUST CONTAIN ONE DIGIT</p>
            <p style="color:red;display:none" id="passerr5">*PASSWORD MUST CONTAIN SPECIAL CHARACTER </p>
           
        </div>
        <div class="form-group">
         <p>&nbsp; CONFIRM PASSWORD</p>
            <input type="password" class="form-control" id="cpass"  name="cpass" placeholder="Enter Confirm Password" required="required"><br>
            <p style="color:red;display:none" id="passerr6">*PASSWORD AND CONFIRM PASSWORD MUST BE SAME</p>
        </div>
        <input name='login' type="button" id="btn" style="margin-left:185px;border-radius:10px;" onclick="ValidatePassword()" class="btn btn-primary" value="PROCEED">              
    </form>			
</div>
</div>
</body>
</html>       
  
  
  
  
        
  
  
  
  
  
