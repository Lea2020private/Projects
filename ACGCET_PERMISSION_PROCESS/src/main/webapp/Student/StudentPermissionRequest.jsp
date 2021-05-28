


                                                  <!-- THIS IS STUDENT PERMISSION REQUEST PAGE -->
                                                                                                 
 <%@ page import="java.sql.*,com.zoho.*" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PERMISSION REQUEST</title>

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

function Show_department(){
	var permission_for=document.getElementById("permission_for").value;
    if(permission_for=="seminor_hall"){
        document.getElementById("deptfor_seminor_hall").style.display="block";
        document.getElementById("seminor_hall_dept").required=true;
    }
    else{
        document.getElementById("deptfor_seminor_hall").style.display="none";
    }
}

function enableRequest_button(declarationBox){
	     if(declarationBox.checked){
	        //Set the disabled property to FALSE and enable the button.
	        document.getElementById("request_button").disabled = false;
	    } else{
	        //Otherwise, disable the submit button.
	        document.getElementById("request_button").disabled = true;
	    }
}
//function for submit permission request
function SubmitPermissionRequest(){
	var permissionFor=document.getElementById("permission_for").value;
	var purposeFor_permission=document.getElementById("purpose").value;
	var date_time_1=document.getElementById("date_time_from").value;
	var date_time_2=document.getElementById("date_time_to").value;
	var description=document.getElementById("event_description").value;
	
	  $.post("../Student_BeforeRequestPermission",{
		 permission_for:permissionFor,
         purpose:purposeFor_permission,
         date_time_from:date_time_1,
         date_time_to:date_time_2
     },function(data,status){
    	// alert(data);
    	 if(data=="occupied"){
    		 
    		// var confirmation=confirm("THE PERMISSION WANTED HALL/EQUIPMENT HAS ALREDY OCCUPIED BY SOMEONE AT YOUR REQUESTED DATE AND TIME SO PLEASE CHANGE YOUR WANTED DATE AND TIME..!! ");
    		 //if(confirmation==false){
    			// window.location.href="StudentPortal.jsp";
    		 //}
    		 document.getElementById("validate_err1").style.display="block";
    	     
    	 }else if(data=="priority_less"){
    	
    		 document.getElementById("validate_err1").style.display="none";
    		 var confirmation=confirm("JUST INFORM YOU,YOUR PERMISSION WANTED TIME IS ALREDY REQUESTED BY SOMEONE,AND YOUR PERMISSION REQUEST HAS LOW PRIORITY COMPARE TO OTHERS \n SO YOUR PERMISSION APPROVAL CHANCE IS VERY LOW! ARE YOU WANT TO CONTINUE WITHOUT CHANGE DATE AND TIME?");
    	  
    		 if(confirmation==true){
    		  $.post("../StudentPermissionRequest_back",{
    				 permission_for:permissionFor,
    		         purpose:purposeFor_permission,
    		         date_time_from:date_time_1,
    		         date_time_to:date_time_2,
    		         event_description:description
    		     },function(data,status){
    		    	 //alert(data);
    		    	 if(data=="success"){
    		    	   window.location.href="AfterPermission_request.jsp";
    		    	 }
    		     });
    	  }
         
    	 }else if(data=="priority_more"){
    		 
    		 document.getElementById("validate_err1").style.display="none";
    		 var confirmation=confirm("JUST INFORM YOU,YOUR PERMISSION WANTED TIME IS ALREDY REQUESTED BY SOMEONE,AND YOUR PERMISSION REQUEST HAS HIGH PRIORITY COMPARE TO OTHERS \n SO YOUR PERMISSION APPROVAL CHANCE IS VERY HIGH! PLEASE CLICK OK BUTTON TO PROCEED NEXT..!");
       	  
    		 if(confirmation==true){
    		  $.post("../StudentPermissionRequest_back",{
    				 permission_for:permissionFor,
    		         purpose:purposeFor_permission,
    		         date_time_from:date_time_1,
    		         date_time_to:date_time_2,
    		         event_description:description
    		     },function(data,status){
    		    	 //alert(data);
    		    	 //alert("YOUR PERMISSION REQUSTED HAS SUCCESSFULLY SUBMITTED WITH US.,YOUR PERMISSION LETTER NUMBER IS  "+data+"  \n NOTE DOWN FOR FUTURE REFERENCE \n AVERAGE WAITING TIME APPROVAL/REJECT IS MINIMUM ONE DAY \n SO PLEASE WAIT AND YOU WILL CHECK YOUR REQUEST STATUS AFTER ONE DAY IN YOUR PORTAL");
    		    	 // window.location.href="StudentPortal.jsp";
    		    	 if(data=="success"){
    	  		    	   window.location.href="AfterPermission_request.jsp";
    	  		    	 }
    		     });	 
    	 }
       }  else if(data=="free"){
    	   document.getElementById("validate_err1").style.display="none";
    		  $.post("../StudentPermissionRequest_back",{
 				 permission_for:permissionFor,
 		         purpose:purposeFor_permission,
 		         date_time_from:date_time_1,
 		         date_time_to:date_time_2,
 		         event_description:description
 		     },function(data,status){
 		    	 if(data=="success"){
  		    	   window.location.href="AfterPermission_request.jsp";
  		    	 }
 		     });
   
    	 }
    	 
     
     });
	
	return false;
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


.validate_error{
border:2px solid;
border-radius:5px;
padding:10px;
text-align: center;
}
</style>
   <!-- JAVA CODE TO CHECK USER LOGGED IN OR NOT -->
 
 <%
 response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
 response.setHeader("Pragma", "no-cache");
 response.setHeader("Expires","0");


//java code to check if user logged in or not
  String login_key="";


 //get cookies
 Cookie cookies[]=request.getCookies();
 for(Cookie c:cookies){
 	if(c.getName().equals("student_login_key")){
 		login_key=c.getValue();
 	}
 }
 
 String roleOfStudent="";
 try{
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/acgcet_permission_process","root",""); 
		PreparedStatement stmt=con.prepareStatement("select * from student_details where login_key=?");
		//System.out.println(applicationId);
		stmt.setString(1,login_key);
		ResultSet rs=stmt.executeQuery(); 
		if(rs.next()){
		 roleOfStudent=rs.getString("role");
		}
	}catch(Exception e){
		
		System.out.println("SQLException: " + e.getMessage());
	}
 
 if(login_key=="" || roleOfStudent==""){
		Cookie cookie=new Cookie("student_login_key","");
		cookie.setPath(request.getContextPath());
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
		response.sendRedirect("StudentLogin.jsp");
	}else{
 
 %>


<body>
<img src="t.jpg" style="width:100%;height:100px;">


<div class="login-form" id="permission_form" >    
    <form action="../StudentPermissionRequest_back" method="post" onsubmit="return SubmitPermissionRequest();">
    
       <div class="form-group">
          <p>&nbsp; PERMISSION WANTED FOR</p>
            <select class="form-control" id="permission_for" name="permission_for" required onclick="Show_department()">
            <option value="">NONE</option>
            <option value="gallery_hall">GALLERY HALL PERMISSION</option>
            <option value="generator">GENERATOR PERMISSION </option>
           <!--  <option value="ground">GROUND PERMISSION</option>       -->
            <option value="drawing_hall">DRAWING HALL PERMISSION</option>
         <!--  <option value="minidrawing_hall">MINI DRAWING HALL PERMISSION</option> -->   
            <option value="murugappa_hall">MURUGAPPA HALL PERMISSION</option>
            <option value="sangamam_hall">SANGAMAM HALL PERMISSION</option>
        <!-- <option value="seminor_hall">DEPARTMENT SEMINOR HALL PERMISSION</option> -->
        </select>
        </div>
        <br>
        <div class="form-group" id="deptfor_seminor_hall" style="display:none">
          <p>&nbsp; WHICH DEPARTMENT SEMINOR HALL ARE YOU WANT </p>
            <select class="form-control" id="seminor_hall_dept" name="seminor_hall_dept">
            <option value="">NONE</option>
            <option value="civil">CIVIL</option>
            <option value="mech">MECH</option>
            <option value="eee">EEE</option>
            <option value="ece">ECE</option>
            <option value="cse">CSE</option>
      </select>
        </div>
        <br>
        <%
        if(roleOfStudent.equals("club")){
        
        %>
        <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose" required>
            <option value="">NONE</option>
            <option value="club_event">CLUB EVENT</option>
            <option value="clubmega_event">CLUB MEGA EVENT</option>
            <option value="club_workshops">CLUB WORKSHOPS</option>
      </select>
      </div>
      <br>
      <%
        }else if(roleOfStudent.equals("department")){
        
      %>
           <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose" required>
            <option value="">NONE</option>
            <option value="department_workshops">DEPARTMENT WORKSHOPS</option>
         </select>
        </div>
       <br>
      
      <%
        }else if(roleOfStudent.equals("sympo")){
        
      %>
      
         <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose" required>
            <option value="">NONE</option>
            <option value="symposium">SYMPOSIUM</option>
         </select>
        </div>
       <br>
       
       <%
        }else if(roleOfStudent.equals("cultural")){
        	
       %>
      
         <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose" required>
            <option value="">NONE</option>
             <option value="cultural">CULTURAL ACTIVITIES</option>
           
         </select>
        </div>
       <br>
      <%
        }else if(roleOfStudent.equals("placement")){
      %>
      
      
        <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose" required>
            <option value="">NONE</option>
            <option value="placement">PLACEMENT ACTIVITIES</option>
            </select>
        </div>
       <br>
       <%
        }else if(roleOfStudent.equals("nss")){
       
       %>
       
         <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose" required>
            <option value="">NONE</option>
            <option value="nss">NSS ACTIVITIES</option>
            </select>
        </div>
       <br>
      
      <%
        }else if(roleOfStudent.equals("ncc")){
      
      %>
      
       <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose" required>
            <option value="">NONE</option>
            <option value="ncc">NCC ACTIVITIES</option> 
         </select>
        </div>
       <br>
       
       <%
      
        }else if(roleOfStudent.equals("yrc")){
       %>
       
        <div class="form-group">
          <p>&nbsp; PURPOSE FOR PERMISSION</p>
            <select class="form-control" id="purpose" name="purpose"  required>
            <option value="">NONE</option>
            <option value="yrc">YRC ACTIVITIES</option>
            </select>
        </div>
       <br>
      
      <%
        }
      %>
      
       
         <div class="form-group">
         <p>&nbsp; PERMISSION WANTED DATE AND TIME</p>
            <p style="margin-left:200px;">FROM</p>
            <input type="datetime-local" class="form-control"  name="date_time_from" id="date_time_from" placeholder="" required>
            <br>
            <p style="margin-left:210px;">TO</p>
            <input type="datetime-local" class="form-control"  name="date_time_to"  id="date_time_to" placeholder=""  required>
           
        </div>
        
        <br>
        <div class="form-group">
         <p>&nbsp; BRIEF DESCRIPTION ABOUT THE PURPOSE </p>
           <textarea rows="8" cols="50" name="event_description" id="event_description"  placeholder="Enter brief description about event min 50 words.." class="form-control" required="required">  </textarea>      
        </div>  
                  <br>
     <div class="form-group" style="margin-left:100px">
     <input type="checkbox" class="" id="stud_declartion" name="stud_declaration" value="1" onclick="enableRequest_button(this)">
     <label for="stud_declartion"> I Declare the above details are true</label>
    </div>
    
<p class="validate_err alert alert-danger" id="validate_err1" style="display:none;margin-top:15px;margin-bottom:5px;">THE PERMISSION WANTED HALL/EQUIPMENT HAS ALREDY OCCUPIED BY SOMEONE AT YOUR REQUESTED DATE AND TIME SO PLEASE CHANGE YOUR WANTED DATE AND TIME..!!!</p>
    
    <br>
         <a href="StudentPortal.jsp" type="button" style="margin-left:80px" class="btn btn-primary "> GO BACK </a>
        <input type="submit" style="margin-left:50px" id="request_button" class="btn btn-primary btn-sm" value="REQUEST PERMISSION" disabled>              
    </form>			
</div>



<%

	}
%>
</body>
</html>       
  
  
  
  
  
