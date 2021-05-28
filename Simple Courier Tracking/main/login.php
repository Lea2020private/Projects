<!--- PHP CODE TO CHECK USERNAME AND PASSWORD ---->
<?php
session_start();

if(isset($_POST['login'])) 
{
    include 'db.php';
    $username = $_POST['uname'];
    $password = $_POST['password'];
    $username = stripcslashes($username);
    $password = stripcslashes($password);
    $sql="SELECT * FROM userdetails WHERE username='$username' and password='$password'";
   // $query="select freezed from college_info where c_code=$username";
    $result = $conn->query($sql);
    if($result->num_rows==1)
    {
          while($row=$result->fetch_assoc()){
          //gettig freezed details
             if($password == $row['password'])
              {
                  $_SESSION['designation'] = $row['designation'];
                  $_SESSION['username']=$row['username'];
                 // echo "password correct";
                  if($row['designation']==1)
                  {
                   header("Location:add.php");
                  }
                  else{
                     //echo $_SESSION['redirect_url'];
                    header("Location:update.php");
              } 
            }

              else {
              echo "<div  class='alert alert-warning alert-dismissible  show message' role='alert' style='color:red;text-align:center;font-size:20px;'>
              <strong>Incorrect password!</strong> Enter the correct values below.
              </div>";
          }
        }
    }
        else {
          echo "<div  class='alert alert-warning alert-dismissible show message' role='alert' style='color:red;text-align:center;font-size:20px;'>
          <strong>Incorrect Username!</strong> Enter the correct values below.
          </div>";
            }
        }
    ?>




<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<link rel="stylesheet" href="">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 </head>
<script>
function showsignup(){
    document.getElementById("signup").style.display = "block";
    document.getElementById("login").style.display = "none";
}
function signup(){
var uname=document.getElementById("uname").value;
var dname=document.getElementById("dname").value;
var pass=document.getElementById("pass").value;
var cpass=document.getElementById("cpass").value;
//alert(dname);
if(uname==''){
    document.getElementById("usermiss").style.display = "block";

}
if(dname==0){
    document.getElementById("demiss").style.display = "block";
   
}
if(pass==''){
    document.getElementById("passmiss").style.display = "block";
}
if(cpass==''){
    document.getElementById("cpassmiss").style.display = "block";
}
if(pass!=cpass && cpass!=''){
    document.getElementById("match").style.display = "block";
}
if(pass!='' && pass.length<8){
    document.getElementById("passval").style.display = "block";
}
if(uname!=''){
    document.getElementById("usermiss").style.display = "none";
}
if(dname!=0){
    document.getElementById("demiss").style.display = "none"; 
}
if(pass!=''){
    document.getElementById("passmiss").style.display = "none"; 
}
if(cpass!=''){
    document.getElementById("cpassmiss").style.display = "none"; 
}
if(pass==cpass){
    document.getElementById("match").style.display = "none"; 
}
if(pass!='' && pass.length>=8){
    document.getElementById("passval").style.display = "none";
}
if(uname!='' && dname!=0 && pass!='' && cpass!='' && pass==cpass && pass.length>=8){
    $.post("createacc.php",{
               username:uname,
               designame:dname,
               password:pass
          },function(data,status){
                //alert(data);
                if(data=="success")
                {
                  swal("ACCOUNT CREATED SUCCESSFULLY,LOGIN TO CONTINUE","",'success');
                  document.getElementById('login').style.display="block";
                  document.getElementById('signup').style.display="none";
                }
                else
                {
                  swal(data,"",'error');
    
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
    width: 350px;
    margin: 60px auto;
    padding: 10px;
}
.login-form form {
    color: #434343;
    border-radius: 3px;
    margin-bottom: 15px;
    background: #fff;
    border: 2px solid #f3f3f3;
    border-radius: 15px;
    box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.3);
    padding: 10px;
}
.login-form h4 {
    text-align: center;
    font-size: 22px;
    margin-bottom: 20px;
}
.login-form .avatar {
    color: #fff;
    margin: 0 auto 20px;
    text-align: center;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    z-index: 9;
    background: #4aba70;
    padding: 15px;
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}
.login-form .avatar i {
    font-size: 60px;
}
.login-form .form-group {
    margin-bottom: 20px;
}
.login-form .form-control, .login-form .btn {
    min-height: 40px;
    border-radius: 2px; 
    transition: all 0.5s;
}
.login-form .close {
    position: absolute;
    top: 15px;
    right: 15px;
}
.login-form .btn {
    background: #4aba6c;
    border-radius:20px;
    line-height: normal;
}
.login-form .btn:hover, .login-form .btn:focus {
    background: #42ae68;
}
.login-form .checkbox-inline {
    float: left;
}
.login-form input[type="checkbox"] {
    margin-top: 2px;
}
.login-form .forgot-link {
    float: right;
}
.login-form .small {
    font-size: 13px;
}
.login-form a {
    color: #4aba70;
}

</style>
<body>
<img src="t.jpg" style="width:100%;height:100px;">
<div id="login">
<div class="login-form">    
    <form method="post">
		<div class="avatar"><i class="material-icons">&#xE7FF;</i></div>
    	<h4 class="modal-title">Login to Your Account</h4>
        <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" class="form-control" placeholder="Username" name='uname' required="required">
        </div>
        <div class="form-group input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" class="form-control" placeholder="Password" name='password' required="required">
        </div>
        <!-- <div class="form-group small clearfix">
            <a href="#" class="forgot-link">Forgot Password?</a>
        </div>
      -->
        <input name='login' type="submit" id="btn" style="margin-left:105px" class="btn btn-primary" value="Login">              
    </form>			
    <div class="text-center small">Don't have an account? <a onclick="showsignup()" style="cursor:pointer;">Sign up</a></div>
</div>
</div>

<div id="signup" style="display:none">
<div class="login-form" >    
    <form action="logincheck.php" method="post">
		<div class="avatar"><i class="material-icons">&#xE7FF;</i></div>
        <h4 class="modal-title">Create a Account</h4>
        <p id="usermiss" style="color:red;display:none">*Username Required </p>
        <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" class="form-control" id="uname" placeholder="Username" required="required">
        </div>
        <p id="demiss" style="color:red;display:none">*Desigination Required </p>
       <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <select class="form-control" id="dname">
            <option value="0">Desigination</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
      </select>
        </div>
        <p id="passmiss" style="color:red;display:none">*Password Required </p>
        <p id="passval" style="color:red;display:none">*Password length must be 8 Required </p>
        <div class="form-group input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" class="form-control" id="pass" placeholder="Password" required="required">
        </div>
        <p id="cpassmiss" style="color:red;display:none">*Confirm Password Required </p>
        <div class="form-group input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" class="form-control" id="cpass" placeholder="Confirm Password" required="required">
        </div>
        <p id="match" style="color:red;display:none">*Password and Confirm Password Dosent Match </p>
        <input type="button" style="margin-left:100px" onclick="signup()"class="btn btn-primary btn-sm" value="SIGN UP">              
    </form>			
</div>

</div>

</body>
</html>       
  
  
  
  
  