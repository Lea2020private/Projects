


                                                  <!-- THIS IS INCHARGE APPROVE VIEW PAGE -->
                                                                                                 
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

function enableRequest_button(declarationBox){
    if(declarationBox.checked){
       //Set the disabled property to FALSE and enable the button.
       document.getElementById("approve_button").disabled = false;
        document.getElementById("reject_button").disabled = false;
        
   } else{
       //Otherwise, disable the submit button.
	   document.getElementById("approve_button").disabled = true;
       document.getElementById("reject_button").disabled = true;
   }
}

function reject(){
	  document.getElementById("reject_reason").style.display="block";
	  var permission_letter_no=document.getElementById("permission_letter_no").value;
	  var rejectReason=document.getElementById("reason").value;
	  if(rejectReason==""){
		  document.getElementById("rejecterr").style.display="block";
	  }else{
		  document.getElementById("rejecterr").style.display="none"; 
		  $.post("../InchargeReject",{
	          permission_no:permission_letter_no,
	          reject_reason:rejectReason
	     },function(data,status){
	    	 //alert(data);
	    	 if(data=="rejected"){
	    		 alert("REJECTED SUCCESSFULLY");
	    		 window.location.href="InchargeApprove.jsp";
	    	 }
	     });  
	  }  
}

function approve(){
	document.getElementById("reject_reason").style.display="none";
	var permission_letter_no=document.getElementById("permission_letter_no").value;
	var date_time_from=document.getElementById("date_time_from").value;
	var date_time_to=document.getElementById("date_time_to").value;
	var permissionFor=document.getElementById("permissionFor").value;
	
	//alert(permission_letter_no);
		  $.post("../InchargeApprove",{
	          permission_no:permission_letter_no,
	          date_time1:date_time_from,
	          date_time2:date_time_to,
	          permission_for:permissionFor
	     },function(data,status){
	    	 //alert(data);
	    	 if(data=="approved"){
	    		 alert("APPROVED SUCCESSFULLY");
	    		 window.location.href="InchargeApprove.jsp";
	    	 }else if(data=="occupied"){
	    		 swal("SOMEONE HAS ALREDY OCCUPY THAT PROPERTY AT THAT TIME,SO YOUR NOT ABLE TO APPROVE THAT REQUEST!!!", "", "error");
	    	 }
	     });	
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
   .login-form p{
   font-weight:bold;
    background-color: black;
    color: white;
   }
   
.login-form {
    width: 500px;
    margin:55px auto;
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
 	if(c.getName().equals("incharge_login_key")){
 		login_key=c.getValue();
 	}
 }

//get a permission letter no
  String permission_letter_no=request.getParameter("permission_no");

//System.out.print(permission_letter_no);

 if(permission_letter_no==null ||login_key==""){
	    Cookie cookie=new Cookie("incharge_login_key","");
	    cookie.setPath(request.getContextPath());
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	    response.sendRedirect("InchargeLogin.jsp");
	}else{
		//declaring all required variables
		 String permissionFor="";
		 String purposeFor_permission="";
		 String date_time_from="";
		 String date_time_to="";
		 String eventDescription="";
		 String requested_StudentName="";
		 String requested_StudentRegno="";
		 String requested_StudentDept="";
		 String requested_StudentSign="";
		 try{
				Class.forName("com.mysql.cj.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
				PreparedStatement stmt=con.prepareStatement("select permission_request_details.*,student_details.name,student_details.register_number,student_details.department from  permission_request_details inner join student_details on permission_request_details.requested_student_id=student_details.user_id where permission_letter_no=?");
				stmt.setString(1,permission_letter_no);
				ResultSet rs=stmt.executeQuery(); 
				if(rs.next()){
				 permissionFor=rs.getString("permission_for");
				 purposeFor_permission=rs.getString("purpose");
				 date_time_from=rs.getString("date_time_from");
				 date_time_to=rs.getString("date_time_to");
				 eventDescription=rs.getString("description_about_purpose");
				 requested_StudentName=rs.getString("name");
				 requested_StudentDept=rs.getString("department");
				 requested_StudentRegno=rs.getString("register_number");
				 }
			
			}catch(Exception e){
				
				System.out.println("SQLException: " + e.getMessage());
			}
		 
 
 %>


<body>
<img src="t.jpg" style="width:100%;height:100px;">


<div class="login-form" >  
  
    <form>
    	  
        <div class="form-group">
          <p>&nbsp; PERMISSION LETTER NUMBER</p>
         <input type="text" class="form-control" style="border:none" id="permission_letter_no" value="<%=permission_letter_no %>" disabled>
      </div>
    
    
       <div class="form-group">
          <p>&nbsp; PERMISSION WANTED FOR</p>
         <input type="text" class="form-control" style="border:none" id="permissionFor" value="<%= permissionFor.toUpperCase() %>" disabled>
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
            <input type="text" class="form-control"  style="border:none" id="date_time_from" value="<%= date_time_from.toUpperCase() %>" disabled>
            <br>
            <p style="margin-left:210px; background-color: white;color: black;">TO</p>
            <input type="text" class="form-control"  style="border:none" id="date_time_to" value="<%=date_time_to.toUpperCase() %>" disabled>           
         </div>
     <br>
        
    <div class="form-group">
          <p>&nbsp; REQUESTED STUDENT NAME</p>
          <input type="text" class="form-control"  style="border:none"  value="<%=requested_StudentName.toUpperCase()%>"  disabled>
       </div>  
       
      <div class="form-group">
          <p>&nbsp; REQUESTED STUDENT REGISTER NUMBER</p>
          <input type="text" class="form-control"  style="border:none"  value="<%=requested_StudentRegno.toUpperCase()%>"  disabled>
       </div>           
  
     <div class="form-group">
          <p>&nbsp; REQUESTED STUDENT DEPARTMENT</p>
          <input type="text" class="form-control"  style="border:none"  value="<%=requested_StudentDept.toUpperCase()%>"  disabled>
       </div>   
    
       <div class="form-group">
          <p>&nbsp; REQUESTED STUDENT SIGNATURE</p>
          <img src="tt.jpg" alt="IDCARD" width="400" height="50">
       </div>  
  
     <br>
        <div class="form-group">
         <p>&nbsp; BRIEF DESCRIPTION ABOUT THE PURPOSE </p>
           <textarea rows="8" cols="50"  style="border:none"  class="form-control" placeholder="" disabled> <%=eventDescription.toUpperCase() %> </textarea>      
        </div>    
   <br>
          
           <div class="form-group" id="reject_reason" style="display:none">
           <p>&nbsp; REJECT REASON </p>
           <textarea rows="3" cols="50"  id="reason"  class="form-control" placeholder="Enter a reject reason"></textarea>     
           <br> 
           <p style="color:red;display:none; background-color: white;" id="rejecterr"> &nbsp; *please enter reject reason</p>
        </div>     
      <br>         
     
          <div class="form-group" style="margin-left:100px">
     <input type="checkbox" class="" id="incharge_declartion" name="stud_declaration" value="1" onclick="enableRequest_button(this)">
     <label for="stud_declartion"> I Declare the above details are true</label>
    </div>      
          
          <br>        
            <div class="buttons" style="margin-left:70px;">
            <a href="InchargeApprove.jsp" type="button" id="" style="" class="btn btn-primary">GO BACK</a>
        <input  type="button"   id="approve_button"  class="btn btn-primary" disabled value="APPROVE" style="margin-left:20px;" onclick="approve()">
        <input  type="button"   id="reject_button"   class="btn btn-primary" disabled value="REJECT"  style="margin-left:20px;" onclick="reject()">
       </div>     
    	 </form>
</div>
<%
	}
%>
</body>
</html>       
  
  
  
  
  
