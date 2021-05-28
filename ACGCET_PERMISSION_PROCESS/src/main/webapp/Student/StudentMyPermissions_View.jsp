


                                                  <!-- THIS IS STUDENT PERMISSION VIEW PAGE -->
                                                                                                 
 <%@ page import="java.sql.*,com.zoho.*" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>VIEW</title>

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
    width: 500px;
    margin:55px auto;
   }
   .login-form p{
   font-weight:bold;
    background-color: black;
    color: white;
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
   font-style:italic;
   color:black;
}

</style>
   <!-- JAVA CODE TO CHECK USER LOGGED IN OR NOT -->
 
 <%
 response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
 response.setHeader("Pragma", "no-cache");
 response.setHeader("Expires","0");
 //get cookies to check if current user is logged in or not
 String login_key="";
 Cookie cookies[]=request.getCookies();
 for(Cookie c:cookies){
 	if(c.getName().equals("student_login_key")){
 		login_key=c.getValue();
 	}
 }

//get a permission letter no
  String permission_letter_no=request.getParameter("permission_no");

//System.out.print(permission_letter_no);

 if(permission_letter_no==null ||login_key==""){
	    Cookie cookie=new Cookie("student_login_key","");
	    cookie.setPath(request.getContextPath());
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	    response.sendRedirect("StudentLogin.jsp");
	}else{
		//declaring all required variables
		 String permissionFor="";
		 String purposeFor_permission="";
		 String date_time_from="";
		 String date_time_to="";
		 String eventDescription="";
		 String permission_letter_status="";
		 String reject_reason="";
		 String permission_status="";
		 String requested_time="";
		 String approverName=""	;
		 String approverId="";
		 try{
				Class.forName("com.mysql.cj.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
	            PreparedStatement stmt=con.prepareStatement("select * from permission_request_details where permission_letter_no="+permission_letter_no);
				ResultSet rs=stmt.executeQuery(); 
				if(rs.next()){
				 permissionFor=rs.getString("permission_for");
				 purposeFor_permission=rs.getString("purpose");
				 date_time_from=rs.getString("date_time_from");
				 date_time_to=rs.getString("date_time_to");
				 eventDescription=rs.getString("description_about_purpose");
				 requested_time=rs.getString("requested_time");
				 permission_letter_status=rs.getString("permission_letter_status");
				 if(permission_letter_status.equals("2")){
					 reject_reason=rs.getString("reject_reason");
				 }if(permission_letter_status.equals("1")){
					  approverId=rs.getString("approver_id");
					  
					  PreparedStatement stmt1=con.prepareStatement("select *  from incharge_details where user_id="+approverId);
		              ResultSet rs1=stmt1.executeQuery();
		              if(rs1.next()){
		            	  
		            	  approverName=rs1.getString("name");
		              }
					  
					  
					 }
				 
			  }
				if(permission_letter_status.equals("0")){
					permission_status="YOUR PERMISSION LETTER REQUEST IS IN APPROVAL PROCESS, IT WILL BE APPROVED SOON ,PLEASE WAIT SOME TIME";
				}else if(permission_letter_status.equals("1")){
					permission_status="YOUR PERMISSION LETTER REQUEST HAS SUCCESSFULLY APPROVED,THANK YOU FOR YOUR PATIENCE";
				}else{
					permission_status="SORRY TO SAY THAT , YOUR PERMISSION LETTER HAS REJECTED FOR BELOW REASON";
				}
				if(purposeFor_permission.equals("ncc")||purposeFor_permission.equals("nss")||purposeFor_permission.equals("yrc")||purposeFor_permission.equals("cultural")||purposeFor_permission.equals("placement")){
					purposeFor_permission+=" ACTIVITIES";
				}
				
				
			}catch(Exception e){
				
				System.out.println("SQLException: " + e.getMessage());
			}
		 
 
 %>


<body>
<img src="t.jpg" style="width:100%;height:100px;">


<div class="login-form" >    
    <form method="post">
    
       <div class="form-group">
          <p>&nbsp; PERMISSION LETTER NUMBER</p>
         <input type="text" class="form-control" style="border:none" name="permission_no" value="<%=permission_letter_no %>" readonly>
      </div>
    
       <div class="form-group">
          <p>&nbsp; PERMISSION WANTED FOR</p>
         <input type="text" class="form-control" style="border:none"  value="<%= permissionFor.toUpperCase() %>" disabled>
      </div>
        <br>
        
        <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
          <input type="text" class="form-control"  style="border:none"  value="<%= purposeFor_permission.toUpperCase() %>"  disabled>
       </div>
       
      <br>    
         <div class="form-group">
         <p>&nbsp; PERMISSION WANTED DATE AND TIME</p>
            <p style="margin-left:200px; background-color: white;color: black;">FROM</p>
            <input type="text" class="form-control"  style="border:none"  value="<%= date_time_from.toUpperCase() %>" disabled>
            <br>
            <p style="margin-left:210px; background-color: white;color: black;">TO</p>
            <input type="text" class="form-control"  style="border:none"  value="<%=date_time_to.toUpperCase() %>" disabled>           
         </div>
        
        <br>
        <div class="form-group">
         <p>&nbsp; BRIEF DESCRIPTION ABOUT THE PURPOSE </p>
           <textarea rows="8" cols="50"  style="border:none"  class="form-control" placeholder="" disabled> <%=eventDescription.toUpperCase() %></textarea>      
        </div>    
   <br>
   
   <div class="form-group">
          <p>&nbsp; PERMISSION REQUSTED DATE AND TIME</p>
          <input type="text" class="form-control"  style="border:none"  value="<%=requested_time.toUpperCase() %>"  disabled>
       </div>
       
    <br>    
       <div class="form-group">
          <p>&nbsp; PERMISSION LETTER STATUS</p>
          <textarea rows="4" cols="50" style="border:none" class="form-control" placeholder="" disabled><%=permission_status %></textarea>
          </div>
         
          <%
          if(permission_letter_status.equals("1")){
        	%>
        	    <div class="form-group">
          <p>&nbsp; APPROVER NAME</p>
          <input type="text" class="form-control"  style="border:none"  value="<%= approverName.toUpperCase() %>"  disabled>
          </div>
        	  <% 
          }      
          if(permission_letter_status.equals("2")){
        	  //System.out.println(reject_reason);
          %>
          
           <div class="form-group">
           <p>&nbsp; REJECT REASON </p>
           <textarea rows="3" cols="50" style="border:none"  class="form-control" placeholder="" disabled> <%= reject_reason.toUpperCase() %> </textarea>      
        </div>    
        <%   } %>
   <br>         
             
          <%  if(permission_letter_status.equals("1")){ %>      
          
         <a href="StudentMyPermissions.jsp" type="button" style="margin-left:100px;width:120px" class="btn btn-primary"> CLOSE </a>
         <input type="submit" formaction="../PermissionLetter.jsp" value="DOWNLOAD" style="width:120px;color:white"  class="btn btn-primary">
         
            <%}else{ %>
            <a href="StudentMyPermissions.jsp" type="button" style="margin-left:180px;width:100px" class="btn btn-primary"> CLOSE </a>
            
            <%} %>
            
            
    	 </form>
</div>



<%
	}
%>
</body>
</html>       
  
  
  
  
  
