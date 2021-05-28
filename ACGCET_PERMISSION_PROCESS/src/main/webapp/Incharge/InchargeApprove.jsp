

                                                  <!-- THIS IS INCHARGE APPROVE  PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PERMISSION REQUESTS</title>

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
    width: 800px;
    margin:55px auto;
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
    margin-bottom: 15px;
}
h6{
  text-align: center;
    font-size: 15px;
}
</style>
   <!-- java code -->
   <%@ page import="com.zoho.*,java.sql.*" %> 
   
   
<%

response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires","0");


//get a user requested permission id using login key
String login_key="";
 Cookie cookies[]=request.getCookies();
 for(Cookie c:cookies){
 	if(c.getName().equals("incharge_login_key")){
 		login_key=c.getValue();
 	}
 }
 
 String incharge_userName="";
 String incharge_position=""; 
 String incharge_dept=""; 
 try{
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
		PreparedStatement stmt=con.prepareStatement("select * from incharge_details where login_key=?");
		stmt.setString(1,login_key);
		ResultSet rs=stmt.executeQuery(); 
		if(rs.next()){
			incharge_userName=rs.getString("username");     //get a username and position of incharge
			incharge_position=rs.getString("position");
			incharge_dept=rs.getString("department");
		}
		
		
	}catch(Exception e){
		
		System.out.println("SQLException: " + e.getMessage());
	}
 
 if(login_key=="" || incharge_userName==""){
		Cookie cookie=new Cookie("incharge_login_key","");
		cookie.setPath(request.getContextPath());
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
		response.sendRedirect("InchargeLogin.jsp");
	}else{
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root","");
			
		
			//now get a permission request no using stud_Regno 
			PreparedStatement ps=con.prepareStatement("select permission_letter_no from permission_request_details where permission_letter_status=0 and permission_for=? order by permission_letter_priority desc, permission_letter_no desc");
			//System.out.println(applicationId);
			ps.setString(1,incharge_position);
			ResultSet rs_1=ps.executeQuery();  //using resultset to get the output		
			
		
 %>
<body>
<img src="t.jpg" style="width:100%;height:100px;">

<div class="login-form">  
<h4>LETS APPROVE</h4>
<table style="width:80%;margin-left:70px">
<tr>
<th style="font-size:15px;font-style:italic;text-decoration:underline">PERMISSION REQUEST NUMBER</th>
<th style="font-size:15px;font-style:italic;text-decoration:underline">ACTION</th>
</tr>
</table>


<br>

<%
int i=0;
while(rs_1.next()){

%>  
    <form action="InchargeApprove_View.jsp" method="post">
     <table style="width:85%;margin-left:100px">
   <tr>
    <td><input type="text" value="<%=rs_1.getString("permission_letter_no")%>" name="permission_no" id="permission_no" style="border:0px" readonly></td>
    <td> <input type="submit" value="&nbsp; VIEW &nbsp;" class="btn btn-success"></td>
  </tr>      
   </table>
    </form>
  <br> 		
    <%
    i++;
        }
  if(i==0){
	 %>
	  
	  <h6>THERE IS NO PERMISSION REQUESTS WAS FOUND !</h6>
	  
	  <%
      }
 }catch(Exception e){
	   System.out.println("SQLException: " + e.getMessage());
   }
}
    %>
    <br>
  <h6><a href="InchargePortal.jsp" type="button" class="btn btn-primary">RETURN BACK</a></h6>
</div>

</body>
</html>       
  
  
  
  
  
