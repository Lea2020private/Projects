

                                                  <!-- THIS IS INCHARGE HOME PAGE -->
                                                  
 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>INCHARGE HOME</title>

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
    width: 800px;
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
    font-size: 30px;
    margin-bottom: 20px;
}

.login-form .form-group {
    margin-bottom: 20px;
}
.login-form .form-control, .login-form .btn {
    border-radius: 2px; 
    transition: all 0.5s;
}

.login-form .btn:hover, .login-form .btn:focus {
    background: #42ae68;
}
.login-form input {
   padding:10px;
}

.validate_err{
border:2px solid;
border-radius:5px;
padding:10px;
text-align: center;
}
#btn{
margin-left:40px;
border-radius:10px;
font-size:15px;
padding:10px;
width:200px;
}
table,th,td{
padding:20px;
}
</style>
<body>
<%@ page import="java.sql.*,com.zoho.*" %>  
<%

response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires","0");

String login_key="";

//create a obj for EncryptDecrypt class for decryption

EncryptDecrypt obj=new EncryptDecrypt();
//get cookies
Cookie cookies[]=request.getCookies();
for(Cookie c:cookies){
	if(c.getName().equals("incharge_login_key")){
		login_key=c.getValue();
	}
}


String name="";
String mobno="";
String email="";
String inchargeFor="";
String dept="";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
	PreparedStatement stmt=con.prepareStatement("select * from incharge_details where login_key=?");
	//System.out.println(applicationId);
	stmt.setString(1,login_key);
	ResultSet rs=stmt.executeQuery(); 
	if(rs.next()){
	 name=rs.getString("name");
	 mobno=rs.getString("mobile_number");
	
	 inchargeFor=rs.getString("position");
	 dept=rs.getString("department");
	 email=rs.getString("email");
	}
}catch(Exception e){
	
	System.out.println("SQLException: " + e.getMessage());
}


if(login_key=="" || name==""){
	Cookie cookie=new Cookie("incharge_login_key","");
	cookie.setPath(request.getContextPath());
    cookie.setMaxAge(0);
    response.addCookie(cookie);
	response.sendRedirect("InchargeLogin.jsp");
}else{

%>

<img src="t.jpg" style="width:100%;height:100px;">
<div id="login">
<div class="login-form">    
    <form method="post">
      <h4 class="modal-title" style="margin-bottom:5px;background-color:black;color:white">INCHARGE PROFILE</h4>
		<br>
     <h4>HI THERE! WELCOME BACK TO YOUR PROFILE</h4>
     <table style="width:60%;margin-left:130px;">

  <tr>
    <td style="font-size:20px;font-style:italic;text-decoration:underline"> NAME</td>
    <td style="font-size:18px;color:red"> <%=name.toUpperCase() %></td>
  </tr>
  <tr>
    <td style="font-size:20px;font-style:italic;text-decoration:underline">MOBILE NUMBER</td>
   <td style="font-size:18px;color:red"> <%=mobno %></td>
  </tr>
  <tr>
    <td style="font-size:20px;font-style:italic;text-decoration:underline">INCHARGE FOR</td>
   <td style="font-size:18px;color:red"> <%=inchargeFor.toUpperCase() %> </td>
  </tr>
   
    <tr>
    <td style="font-size:20px;font-style:italic;text-decoration:underline"> DEPARTMENT</td>
   <td style="font-size:18px;color:red"> <%=dept.toUpperCase() %></td>
  </tr>
  
  <tr>
    <td style="font-size:20px;font-style:italic;text-decoration:underline"> EMAIL </td>
   <td style="font-size:18px;color:red"> <%=email %></td>
  </tr>
  
   <tr>
    <td style="font-size:20px;font-style:italic;text-decoration:underline">ID CARD </td>
   <td style="font-size:18px;color:red"><img src="tt.jpg" alt="IDCARD" width="100" height="100"></td>
  </tr>
</table>
           <br>
      <div class="buttons">
        <a href="../InchargeLogout" type="button" id="btn" style="" class="btn btn-primary">LOGOUT</a>
        <a href="InchargeApprove.jsp" type="button" id="btn" style="" onclick="" class="btn btn-primary" > LETS APPROVE</a>      
        <a href="InchargeMyApprovals.jsp" type="button" id="btn" style="" onclick="" class="btn btn-primary">MY APPROVALS</a> 
      </div>       
    </form>			
</div>
</div>
<%
}
%>

</body>
</html>       
  
  
  
  
  
