





<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HOME</title>

<link rel="stylesheet" href="">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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

Cookie cookie=new Cookie("incharge_login_key","");
cookie.setPath(request.getContextPath());
cookie.setMaxAge(0);
response.addCookie(cookie);

Cookie cookie1=new Cookie("incharge_forgot_password_key","");
cookie1.setPath(request.getContextPath());
cookie1.setMaxAge(0);
response.addCookie(cookie1);

Cookie cookie2=new Cookie("student_login_key","");
cookie2.setPath(request.getContextPath());
cookie2.setMaxAge(0);
response.addCookie(cookie2);

Cookie cookie3=new Cookie("student_forgot_password_key","");
cookie3.setPath(request.getContextPath());
cookie3.setMaxAge(0);
response.addCookie(cookie3);

%>
 
<style>
body{
  color: #999;
    background: #f5f5f5;
    font-family: 'Varela Round', sans-serif;
}
.card{
margin:55px auto;
width:500px;
height:500px;
padding:10px;
border:2px solid;
border-radius:10px;
 box-shadow: 5px 5px 5px 10px rgba(0, 0, 5, 0.3);
}

h3{
text-align: center;
    font-size: 25px;
    color:blue;
}
.track_status{
 box-shadow: 0px 2px 2px 3px rgba(0, 0, 5, 0.3);
cursor:pointer;
padding:8px;
border-radius:10px;
width:140px;
text-align:center;
float:right;
}

.dropdown-menu a {
  float: none;
  color: black;
  padding: 12px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-menu a:hover {
  background-color:lightblue;
}

.student_login{
margin:40px 100px;
margin-bottom:30px;
}

button {
  border-radius: 10px;
  background-color: #f5f5f5;
  border: none;
  text-align: center;
  font-size: 18px;
  padding: 15px;
  transition: all 0.5s;
  cursor: pointer;
  width:300px;
  box-shadow: 0 10px 20px -8px rgba(0, 0, 0,.7);
}

button{
  cursor: pointer;
  display: inline;
  position: relative;
  transition: 0.5s;
}

button:after {
  content: '»';
  position: absolute;
  opacity: 0;  
  top: 14px;
  right: -20px;
  transition: 0.5s;
}

button:hover{
  padding-right: 24px;
  padding-left:8px;
}

button:hover:after {
  opacity: 1;
  right: 10px;
}
.incharge_login{
margin:0px 100px;
}
</style>
<body>
<img src="t.jpg" style="width:100%;height:100px;">
 <div class="dropdown">
    <h5  style="font-size:20px;margin-right:40px;width:200px;" class="track_status dropdown-toggle" data-toggle="dropdown">
      TRACK STATUS
    </h5>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="Student/StudAcc_StatusTrack.jsp" style="font-size:15px;text-align:center">STUDENT ACCOUNT OPENING</a><br>
      <a class="dropdown-item" href="Incharge/InchargeAcc_StatusTrack.jsp" style="font-size:15px;text-align:center">INCHARGE ACCOUNT OPENING</a>
    </div>
  </div>
  <br><br>
<div class="card">
<h3>WELCOME !</h3>
<div class="student_login">
<a href="Student/StudentLogin.jsp"><button><span>LOGIN AS A STUDENT</span></button></a>
</div>
<div class="incharge_login">
<a href="Incharge/InchargeLogin.jsp"><button><span>LOGIN AS A INCHARGE</span></button></a>
</div>
<br>
<br>
<h4 style="color:black;margin-left:140px">DON'T HAVE A ACCOUNT </h4>
 <div class="dropdown">
    <h5 class="track_status dropdown-toggle" data-toggle="dropdown">
      SIGN UP
    </h5>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="Student/StudentRegistration.jsp" style="font-size:15px;text-align:center">AS A STUDENT</a><br>
      <a class="dropdown-item" href="Incharge/InchargeRegistration.jsp" style="font-size:15px;text-align:center">AS A INCHARGE</a>
    </div>
  </div>
  </div>
 
  

</body>
</html>       
  
  
  
  
  
