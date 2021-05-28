

                                                  <!-- THIS IS STUDENT MYPERMISSIONS HOME PAGE -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MY PERMISSIONS</title>

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

function CancelPermissionRequest(permission_no){
	var permission_letter_no=permission_no.value;
	var confirmation = confirm("ONCE YOU CANCELED YOUR PERMISSION REQUEST LETTER,YOU WILL NOT BE ABLE TO RETRIEVE IN FUTURE,ARE U SURE TO CONTINUE?")
	//alert(permission_letter_no);
	if(confirmation==true){
		 $.post("../StudentMyPermissions_Cancel",{
	        permission_letter_num : permission_letter_no
	     },function(data,status){
	    	 if(data=="success"){
	    		 alert("YOUR REQUEST CANCELED SUCCESSFULLY");
	    		 location.reload();
	    	 }else{
	    		 alert(data);
	    		 location.reload();
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
    width: 800px;
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
 	if(c.getName().equals("student_login_key")){
 		login_key=c.getValue();
 	}
 }
 
 String stud_id="";
 try{
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
		PreparedStatement stmt=con.prepareStatement("select* from student_details where login_key=?");
		stmt.setString(1,login_key);
		ResultSet rs=stmt.executeQuery(); 
		if(rs.next()){
		    stud_id=rs.getString("user_id");
		}
		
		
	}catch(Exception e){
		
		System.out.println("SQLException: " + e.getMessage());
	}
 
 if(login_key=="" || stud_id==""){
		Cookie cookie=new Cookie("student_login_key","");
		cookie.setPath(request.getContextPath());
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
		response.sendRedirect("StudentLogin.jsp");
	}else{
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root","");
			
			//now get a permission request no using stud_Regno 
			PreparedStatement ps=con.prepareStatement("select permission_letter_no,permission_letter_status from permission_request_details where requested_student_id=? order by requested_time desc");
			//System.out.println(applicationId);
			ps.setString(1,stud_id);
			ResultSet rs_1=ps.executeQuery();  //using resultset to get the output		
		
 %>
<body>
<img src="t.jpg" style="width:100%;height:100px;">

<div class="login-form">  
<h4>MY PERMISSION REQUESTS</h4>

<h6><span style="color:red">*NOTE : </span>Your not able to Cancel your Permission Request If your Permission Request Got approved or Rejected</h6>

<table style="width:85%;">
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
    <form action="StudentMyPermissions_View.jsp" method="post">
     <table style="width:85%;margin-left:80px">
   <tr>
    <td><input type="text" value="<%=rs_1.getString("permission_letter_no")%>" name="permission_no" id="permission_no<%=i %>" style="border:0px" readonly></td>
    <td> <input type="submit" value="&nbsp; VIEW &nbsp;" class="btn btn-success"></td>
    <%
    if(!rs_1.getString("permission_letter_status").equals("0")){
    %>
    <td> <input type="submit" value="CANCEL"class="btn btn-danger" disabled></td>
    <%
    }else{
    %>
    <td> <input type="button" value="CANCEL"  onclick="CancelPermissionRequest(permission_no<%=i %>)" class="btn btn-danger"></td>
    <%
    }
    %>
  </tr>      
   </table>
    </form>
  <br> 		
    <%
    i++;
        }
  if(i==0){
	 %>
	  
	  <h6>THERE IS NONE PERMISSION REQUESTS WAS REQUESTED BY YOU !</h6>
	  
	  <%
      }
 }catch(Exception e){
	   System.out.println("SQLException: " + e.getMessage());
   }
}
    %>
    <br>
  <h6><a href="StudentPortal.jsp" type="button" class="btn btn-primary">RETURN BACK</a></h6>
</div>

</body>
</html>       
  
  
  
  
  
