

                                                  <!-- THIS IS STUDENT REGISTRATION HOME PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STUDENT REGISTRATION</title>

<link rel="stylesheet" href="">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
 
<script>

function ValidateForm(){
   
	//validate password
	var password=document.getElementById("pass").value;
	var confirmPassword=document.getElementById("cpass").value;
	  var hasUpperLetter = 0;
	  var hasLowerLetter = 0;
	  var hasNumber  = 0;
	  var hasSpecialChar = 0;
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
		   return false;
	   }else{
		   document.getElementById("passerr4").style.display="none";
	   }
	 
	   if(hasUpperLetter==0){
		   document.getElementById("passerr2").style.display="block";
		   return false;
	   }else{
		   document.getElementById("passerr2").style.display="none";
	   }
	   
	   if(hasLowerLetter==0){
		   document.getElementById("passerr3").style.display="block";
		   return false;
	   }else{
		   document.getElementById("passerr3").style.display="none";
	   }
	   if(hasSpecialChar==0){
		   document.getElementById("passerr5").style.display="block";
		   return false;
	   }else{
		   document.getElementById("passerr5").style.display="none";
	   }
	   
	  
	   if(password==confirmPassword){
		   document.getElementById("passerr6").style.display="none";
		   
	   }else{
		   document.getElementById("passerr6").style.display="block";
		   return false;
	   }
  
 }
 else{
	 document.getElementById("passerr1").style.display="block";
		  return false;
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
    border-radius: 5px; 
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

<div id="signup">
<div class="login-form" >    
    <form action="../InchargeRegistration_back" method="post" onsubmit="return ValidateForm()">
    
       		<p class="validate_error alert alert-danger" id="validate_error" style="margin-top:15px;margin-bottom:5px;">USERNAME/REGISTER NUMBER/EMAIL/MOBILE NUMBER is Already found in our database try with new one !!!</p>
    <br>
    
    <h4 class="modal-title" style="margin-bottom:5px;background-color:black;color:white">Incharge Registration</h4>
		<br>  
        <h4 class="modal-title">Create a Account</h4>
        <br>
       
        <div class="form-group">
         <p>&nbsp; NAME</p>
            <input type="text" class="form-control" name="name" id="name" placeholder="Enter your name" required="required">
        </div>
        
         <div class="form-group">
         <p>&nbsp; USER NAME</p>
            <input type="text" class="form-control" name="uname" id="uname" placeholder="Enter your username" required="required">
            </div>
       
       <div class="form-group">
          <p>&nbsp; DEPARTMENT</p>
            <select class="form-control" id="dept" name="dept" required>
            <option value="">NONE</option>
            <option value="civil">CIVIL</option>
            <option value="mech">MECH</option>
            <option value="eee">EEE</option>
            <option value="ece">ECE</option>
            <option value="cse">CSE</option>
      </select>
        </div>

        
         <div class="form-group">
         <p>&nbsp; MOBILE NUMBER</p>
            <input type="tel" class="form-control"  name="mobno" id="mobno" placeholder="format 98230XXXXX" pattern="[0-9]{10}" required>
           
        </div>
        
         <div class="form-group">
         <p>&nbsp; EMAIL</p>
           <input type="email" class="form-control" name="email" id="email" placeholder="Enter your mail id" required="required">
           
        </div>
        
           <div class="form-group">
          <p>&nbsp; ROLE/POSITION</p>
               <select class="form-control" id="position" name="position" required>
            <option value="">NONE</option>
            <option value="gallery_hall">GALLERY HALL INCHARGE</option>
            <option value="generator">GENERATOR ROOM INCHARGE </option>
           <!--  <option value="ground">GROUND INCHARGE</option>       -->
            <option value="drawing_hall">DRAWING HALL INCHARGE</option>
         <!--  <option value="minidrawing_hall">MINI DRAWING HALL INCHARGE</option> -->   
            <option value="murugappa_hall">MURUGAPPA HALL INCHARGE</option>
            <option value="sangamam_hall">SANGAMAM HALL INCHARGE</option>
        <!-- <option value="seminor_hall">DEPARTMENT SEMINOR HALL INCHARGE</option> -->
      </select>
          
        </div>

        
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
       
           <div class="form-group">
          <p>&nbsp; SECURITY QUESTION</p>
            <select class="form-control" id="securityqn" name="securityqn"  required>
            <option value="">NONE</option>
            <option value="1">WHICH IS YOUR FAVOURITE FOOD?</option>
            <option value="2">WHO IS YOUR FAVOURITE ACTOR?</option>
            <option value="3">WHO IS YOUR FAVOURITE CRICKETER?</option>
            <option value="4">WHAT IS YOUR FAVOURITE SUBJECT?</option>
          </select>
        </div>
        
          <div class="form-group">
         <p>&nbsp; SECURITY ANSWER</p>
            <input type="text" class="form-control" name="securityans" id="securityans" placeholder="Enter your name" required="required">
        </div>
        
         <div class="form-group">
                    <p>&nbsp; UPLOAD YOUR IDENTITY CARD PICTURE</p>
                   <input type="file" class="form-control" name="idcard" id="idcard" accept="image/*" required>
                  
                  </div> 
                  
           <div class="form-group">
                   <p>&nbsp; UPLOAD YOUR SIGNATURE</p>
                   <input type="file" class="form-control"  accept="image/*" name="signature" id="signature" required>
            </div>           
       
        <input type="submit" style="margin-left:170px" class="btn btn-primary btn-sm" value="SIGN UP">              
    </form>			
</div>

</div>

</body>
</html>       
  
  
  
  
  
