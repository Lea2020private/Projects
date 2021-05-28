

                                                  <!-- THIS IS STUDENT LOGIN HOME PAGE -->

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
   <%@ page import="com.zoho.*" %> 
<%

response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires","0");


//create a obj for EncryptDecrypt class for decryption
EncryptDecrypt obj=new EncryptDecrypt();
String encryptedApplicationId="";	
String userId="";
//get cookies
Cookie cookies[]=request.getCookies();
for(Cookie c:cookies){
	if(c.getName().equals("user_id")){
		encryptedApplicationId=c.getValue();
	}
}


if(encryptedApplicationId==""){
	response.sendRedirect("../index.jsp");
}else{
	 userId=obj.decryption(encryptedApplicationId);
}
%>
<body>
<img src="t.jpg" style="width:100%;height:100px;">
<div id="login">
<div class="login-form">    
    <form method="post">
           <h4 class="modal-title" style="margin-bottom:5px;">YOUR ACCOUNT CREATION REQUEST IS SUBMITTED WITH US &#128512;</h4>
    	
    	<br>
    	
    	<h5>Your Account opening User id is <span style="font-size:17px;text-decoration:underline"> <%=userId %> </span>,Please Notedown for Future reference</h5>
    	<h5>Trace your Application status <a href="InchargeAcc_StatusTrack.jsp">here</a></h5>
        <h5>Login in to Your Account <a href="InchargeLogin.jsp"> here </a></h5>
      
             
    </form>		
    
    <% 
    Cookie cookie=new Cookie("user_id","");
    cookie.setPath(request.getContextPath());			
    cookie.setMaxAge(0);
    response.addCookie(cookie);
    
    %>
    	
  
</div>
</div>

</body>
</html>       
  
  
  
  
  
