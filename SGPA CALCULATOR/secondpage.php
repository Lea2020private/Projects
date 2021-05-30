<?php  session_start();
//check session set por not
if(!isset($_SESSION['login']) ){
     header("Location:https://acgcet-cgpa.great-site.net/Home");
    }
?>
<!DOCTYPE html>
<html>
<head>
  <title>SGPA CALCULATOR</title>
</head>
    <body onload="redirect()">
     <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <center>
   
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">

function redirect(){
    <?php
          $sem=$_POST["sem"];
          if($sem==''){
              header("Location:https://acgcet-cgpa.great-site.net/Home");
          }
      ?>      
}
document.onkeydown = function(e) {
    if (e.ctrlKey && (e.keyCode === 85 || e.keyCode === 117)) {//Alt+c, Alt+v will also be disabled sadly.
        alert('not allowed');
        return false;
    }
    
};
document.addEventListener("contextmenu", function(e){
    e.preventDefault();
}, false);

function cal(){
    
	var s=document.getElementsByName("array[]");
	var arr=[];
	var noa=0;
	for(var i=0;i<s.length;i++){
		if(s[i].value=="00"){
			noa++;
		}
		arr[i]=s[i].value;
  }
   if(arr.includes("null")){
			swal("PLEASE CHOOSE ALL THE VALUES","","error");
			return false;
		} 
  //document.getElementById("gpa").style.display = "block";
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        if(arr.includes("00")){
    		if(noa==1){
    		 swal("GREAT \n YOUR SGPA IS.."+this.responseText,"BUT YOU HAVE  "+noa+"  ARREAR","warning");
             if(this.responseText){
                 document.getElementById("gpa").innerHTML = "HELLO GEEK YOUR SGPA IS  "+this.responseText;
                 document.getElementById("pdf").style.border = "3px solid  yellow";
             document.getElementById("card").style.display = "none";    
             document.getElementById("div").style.display="block";
             }
    		}else{
    			 swal("GREAT \n YOUR SGPA IS.."+this.responseText,"BUT YOU HAVE  "+noa+"  ARREARS","warning");
                  if(this.responseText){
                      document.getElementById("gpa").innerHTML = "HELLO GEEK YOUR SGPA IS  "+this.responseText;
                      document.getElementById("pdf").style.border = "3px solid  yellow";
                      document.getElementById("card").style.display = "none";
                      document.getElementById("div").style.display="block";
             }
    		}
    	}else{
    	 swal("GREAT \n YOUR SGPA IS.."+this.responseText,"","success"); 
          if(this.responseText){
              document.getElementById("gpa").innerHTML = "HELLO GEEK YOUR SGPA IS  "+this.responseText;
              document.getElementById("pdf").style.border = "3px solid  yellow";
             document.getElementById("div").style.display="block";
             document.getElementById("card").style.display = "none";

             }
    	}
      }
    };
    xmlhttp.open("GET","sgpa?q="+arr, true);
    xmlhttp.send();
    }
  /* 
function hide(){
// document.getElementById("gpa").style.display = "none";
 document.getElementById("div").style.display = "none";
} 
function show(){
  document.getElementById("card").style.display = "block";
  document.getElementById("start").style.display = "none";
}  */
function comment(){
var name= document.getElementById("name").value;
var comment=document.getElementById("comment").value;
if(name==''){
  document.getElementById("namemis").style.display = "block";
}
if(comment==''){
  document.getElementById("commentmis").style.display = "block";
}
if(name!=''){
  document.getElementById("namemis").style.display = "none";
}
if(comment!=''){
  document.getElementById("commentmis").style.display = "none";
}
if(name!=''&&comment!=''){
  $.post("updatecomment",{
               uname:name,
               ucomment:comment
          },function(data,status){
                //alert(data);
                if(data=="success")
                {
                  alert("THANK YOU FOR YOUR VALUABLE FEEDBACK");
                  window.location.href = "Home";
                }
                else
                {
                  alert(data);
                  window.location.href = "Home";
                }
                
          });
   
}

}


</script>


 <style>
header{
    background: #111;
    color: #fff;
    height: 50px;
    //margin: 0;
    //display: flex;
    //padding: 0 1%;
    //align-items: center;
    font-size: 28px;
    text-align:center;
    font-family: "Times New Roman", Times, serif;
}
 body{
    background-image:url("college2.jpg");
    width:auto;
	background-size: 100% 100%;
    width : 100vw;
    height: 100vh;
    overflow-y:hidden;
    overflow-x:hidden;
 }
 .card {
  width: 500px;
  margin:1rem;
  margin-top:30px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  background-color:white;
  opacity:0.9;
}
#start{
  width: 500px;
  margin:1rem;
  margin-top:140px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  background-color:white;
  opacity:0.9;
}
i{
  color:red;
  padding:5px;
}

select{
	padding:5px;
    border-radius:8px;
    border-color:red;
    }
    option{
	background-color: white;
	font-family:cursive;
	font-style: italic;
}
select:hover{
	padding:6px;
	background-color:lightyellow;
}
th{
  padding:8px;
  text-decoration: underline;
 }
 td{
 padding:2px;
 text-align: left; 
 }

 #pdf{
   background-color:white;
   box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  // border:3px solid yellow;
   width:500px;
   border-radius:15px;
   margin-top:140px;
   opacity:0.9;
   
 }
#btn {
	background: linear-gradient(to right, gold, darkorange);
	color: white;
	--width: 130px;
	--height: calc(var(--width) / 3);
	width: var(--width);
	height: var(--height);
	text-align: center;
	line-height: var(--height);
	font-size: calc(var(--height) / 2.5);
	font-family: sans-serif;
	letter-spacing: 0.2em;
	border: 1px solid darkgoldenrod;
	border-radius: 2em;
	transform: perspective(500px) rotateY(-15deg);
	text-shadow: 6px 3px 2px rgba(0, 0, 0, 0.2);
	box-shadow: 1px 0 0 3px rgba(0, 0, 0, 0.2);
	transition: 0.5s;
	position: relative;
	overflow: hidden;
}

#btn:hover {
	transform: perspective(500px) rotateY(15deg);
	text-shadow: -6px 3px 2px rgba(0, 0, 0, 0.2);
	box-shadow: -2px 0 0 5px rgba(0, 0, 0, 0.2);
}

#btn::before {
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	background: linear-gradient(to right, transparent, white, transparent);
	left: -100%;
	transition: 0.5s;
}

#btn:hover::before {
	left: 100%;
}
#btn1
{
    display: block;
    width: 100px;
    outline: none;
    border: none;
    background-color: green;
    padding: 1vh;
    margin:  10px  auto ;
    cursor: pointer;
    border-radius: 1em;
    color:white;
    }
    .footer{
    position:fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    background-color: #111;
    color: #fff;
    border: 0;
    font-size: x-small;
    text-align: center;
    height:50px;
    }

#btn1:hover {
	text-shadow: -6px 3px 2px rgba(0, 0, 0, 0.2);
	box-shadow: -2px 0 0 5px rgba(0, 0, 0, 0.2);
}
@media screen and (max-width:500px) and (max-height:575px) {
  #btn {
    width:20%;
    font-size:10px;
  }
  body{
      height:567px;
      overflow:hidden;
  }
  .card {
  width: 320px;
  margin:1rem;
  margin-top:40px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
}
#start{
  width: 320px;
  margin:1rem;
  margin-top:100px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
}
 th{
  padding:5px;
  text-decoration: underline;
 }
 td{
  padding:1.5px;
  text-align: left;
  font-size:8px; 
 } 
 #pdf{
   box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
   width:320px;
   margin-top:100px;
 }
 } 
@media screen and (max-width:500px) and (min-height:576px) {
  #btn {
    width:20%;
    font-size:10px;
  }
  body{
      height:730px;
      overflow:hidden;
  }
  .card {
  width: 320px;
  margin:1rem;
  margin-top:120px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
}
#start{
  width: 320px;
  margin:1rem;
  margin-top:170px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
}
 th{
  padding:5px;
  text-decoration: underline;
 }
 td{
  padding:1.5px;
  text-align: left;
  font-size:8px; 
 } 
 #pdf{
   box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
   width:320px;
   margin-top:160px;
 }
 }

</style>
      
      <header>
       <i class='fas fa-user-graduate' style='font-size:30px;color:white;'></i>SGPA CALCULATOR<i class='fas fa-user-graduate' style='font-size:30px;color:white;'></i>
    </header>
    
        <?php
          
          include 'database.php';
        
          $sem=$_POST["sem"];
          $reg=$_POST["reg"];
          $dept=$_POST["dept"];
          $ft=$_POST["ft"];

          $_SESSION['sem']=$sem;
          $_SESSION['reg']=$reg;
          $_SESSION['ft']=$ft;
          $_SESSION['dept']=$dept;

      if($sem<=4&&$ft==''){
          $sql = "SELECT * from cgpa where sem=$sem && reg='$reg' && dept='$dept'";
          $result = $conn->query($sql); ?>      

<div id="start" visibility: hidden>
<h4>HELLO..!</h4>
<h4>LETS CALCULATE YOUR SGPA </h4> <i class="fa fa-hand-o-down" style="font-size:35px"></i><span id='btn1' onclick="show()">LETS GO</span> <i class="fa fa-hand-o-up"  style="font-size:35px"></i>
</div>
<div class="card">

          <form>
          
          <div class="card-header" id='card'>
        <table class="card-table"><thead><tr><th>Subject Code</th><th>Subject Name</th><th>Grade</th></thead>
         <?php
            if ($result->num_rows > 0) { 
              
            while($row = $result->fetch_assoc()) {  ?>
            <tbody>
            <tr>
            <td><?php  echo $row['scode']; ?></td>
            <td><?php  echo $row['sub']; ?></td>
           <td> 
           <select name="array[]" id="grad" required>
          <option value="null">None</option>
          <option value="10">O</option>
          <option value="09">A+</option>
          <option value="08">A</option>
          <option value="07">B+</option>
          <option value="06">B</option>
          <option value="00">RA</option>
        </select>
        </td>
    
    </tr>
    </tbody>
    
    <?php
    }
    } 
  } 
    else if($sem<=8&&($ft==""||$ft=='no')){
          $sql = "SELECT * from cgpa where sem=$sem && reg='$reg' && dept='$dept'&& ftrack='no'";
          $result = $conn->query($sql); ?>
      <div id="start" visibility: hidden>
  <h4>HELLO..!</h4>
  <h4>LETS CALCULATE YOUR SGPA </h4> <i class="fa fa-hand-o-down" style="font-size:35px"></i><span id='btn1' onclick="show()">LETS GO</span> <i class="fa  fa-hand-o-up"  style="font-size:35px"></i>
</div>
<div class="card ">
          <form>
          <div class="card-header" id='card' >
           <table class="card-table"><thead><tr><th>Subject Code</th><th>Subject Name</th><th>Grade</th></thead>
         <?php
            if ($result->num_rows > 0) { 
              
            while($row = $result->fetch_assoc()) {  ?>
            <tbody>
            <tr>
            <td><?php  echo $row['scode']; ?></td>
            <td><?php  echo $row['sub']; ?></td>
           <td> 
           <select name="array[]" id="grad" required>
          <option value="null">None</option>
          <option value="10">O</option>
          <option value="09">A+</option>
          <option value="08">A</option>
          <option value="07">B+</option>
          <option value="06">B</option>
          <option value="00">RA</option>
        </select>
        </td>
    
    </tr>
    </tbody>
    
    <?php
    }
    } 
  } 
    else if($sem<8&&$ft=='yes'){
          $sql = "SELECT * from cgpa where sem=$sem && reg='$reg' && dept='$dept'";
          $result = $conn->query($sql); ?>
   <div id="start" visibility: hidden>
<h4>HELLO..!</h4>
<h4>LETS CALCULATE YOUR SGPA </h4> <i class="fa fa-hand-o-down" style="font-size:35px"></i><span id='btn1' onclick="show()">LETS GO</span> <i class="fa fa-hand-o-up"  style="font-size:35px"></i>
</div>
<div class="card ">
          <form>
          <div class="card-header" id='card'>
          <table class="card-table"><thead><tr><th>Subject Code</th><th>Subject Name</th><th>Grade</th></thead>
         <?php
            if ($result->num_rows > 0) { 
              
            while($row = $result->fetch_assoc()) {  ?>
            <tbody>
            <tr>
            <td><?php  echo $row['scode']; ?></td>
            <td><?php  echo $row['sub']; ?></td>
           <td> 
           <select name="array[]" id="grad" required>
          <option value="null">None</option>
          <option value="10">O</option>
          <option value="09">A+</option>
          <option value="08">A</option>
          <option value="07">B+</option>
          <option value="06">B</option>
          <option value="00">RA</option>
        </select>
        </td>
    
    </tr>
    </tbody>
    
    <?php
    }
    } 
  } 
  else if($sem==8&&$ft=='yes'){
    $sql = "SELECT * from cgpa where sem=$sem && reg='$reg' && dept='$dept' order by credit desc limit 1";
    $result = $conn->query($sql); ?>
   <div id="start" visibility: hidden>
<h4>HELLO..!</h4>
<h4>LETS CALCULATE YOUR SGPA </h4> <i class="fa fa-hand-o-down" style="font-size:35px"></i><span id='btn1' onclick="show()">LETS GO</span> <i class="fa fa-hand-o-up"  style="font-size:35px"></i>
</div>
<div class="card ">
          <form>
          <div class="card-header" id='card'>
        <table class="card-table table"><tr><th>Subject Code</th><th>Subject Name</th><th>Grade</th></thead>
   <?php
      if ($result->num_rows > 0) { 
        
      while($row = $result->fetch_assoc()) {  ?>
      <tbody>
      <tr>
      <td><?php  echo $row['scode']; ?></td>
      <td><?php  echo $row['sub']; ?></td>
     <td> 
     <select name="array[]" id="grad" required>
    <option value="null">None</option>
    <option value="10">O</option>
    <option value="09">A+</option>
    <option value="08">A</option>
    <option value="07">B+</option>
    <option value="06">B</option>
    <option value="00">RA</option>
  </select>
  </td>

</tr>
</tbody>

<?php
}
} 
} 
?>

        </table>
       
 <input type="button" id="btn" class="gpa" onclick="cal()" value="SGPA" > 
<!--- <input type="reset" class="res" value="RESET" id="btn" onclick="hide()" >  ---><br>  
 </form>
 </div>
 </div>
 <!--<h3 id="gpa"></h3>   -->
 <div id="pdf">
 <div id="div"  visibility: hidden>
 <h3 id="gpa" style="color:grey;text-decoration: underline dotted red;"></h3>
<h5>DO YOU WANT COPY OF YOUR CGPA RESULT THEN </h5>
<i class="fa fa-hand-o-right" style="font-size:30px"></i><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModalHorizontal">
    CLICK HERE
</button><i class="fa fa-hand-o-left" style="font-size:30px;color:white"></i> <br><br>
<h5>IF YOU DONT WANT CGPA COPY THEN </h5>
<i class="fa fa-hand-o-right" style="font-size:30px;color:white"></i><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModalfeedback">
    GO BACK
</button><i class="fa fa-hand-o-left" style="font-size:30px"></i>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModalHorizontal" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    BASIC DETAILS
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form class="form-horizontal" role="form" method="post" action="pdf">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label"
                              >NAME</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" 
                         placeholder="*require field" name="name" required/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"
                           >REGISTER NUMBER</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control"
                            id="" placeholder="*require field" name="regno" required/>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="">
                      <input type="submit" value="PROCEED" class="btn btn-primary" id="arrow">
                    </div>
                  </div>
                </form>
                </div>
        </div>
    </div>
</div>
</div>  

<!--- modal 2 -->
 <div class="modal fade" id="myModalfeedback" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    PLEASE GIVE YOUR FEEDBACK &#127908;
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form class="form-horizontal" role="form" method="post" action="" enctype="multipart/form-data">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label" 
                              >NAME</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" 
                         placeholder="" name="name"  id='name' required/>
                    </div>
                  </div>
                  <h5 style="color:red" id="namemis" visibility: hidden>*PLEASE FILL OUT THE FIELD NAME</h5>
                  <div class="form-group">
                  <label  class="col-sm-2 control-label" 
                              ></label>
                    <div class="col-sm-8">
                    <textarea rows="5" cols="60"  class="form-control" name="comment" id="comment" form="usrform" placeholder='Enter your feedback here...' required>
</textarea>
                    </div>
                  </div>
                  <h5 style="color:red" id="commentmis" visibility: hidden>*PLEASE FILL OUT THE FIELD COMMENT</h5>

                  <div class="form-group">
                    <div class="">
                    <input type="button" onclick="comment();" value="PROCEED" class="btn btn-primary" id="arrow">
                    </div>
                  </div>
                </form>
                </div>
        </div>
    </div>
</div>
</div>  

 </center>
  <footer>
     <div class="footer">

    <p style="font-size:11px">Copyrights reserved.&#169 2020 by <span style="color:green">EXAMPLE TEXT<span></p>
    <p class="p" style="font-size:12px">contact us on  <a href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram" aria-hidden="true" style="font-size:20px"></i></a>
             <a href="https://wa.me/916379705214" target="_blank"><i class="fa fa-whatsapp" aria-hidden="true" style="font-size:20px"></i></a>
             <a href="#" target="_blank"><i class="fa fa-facebook" aria-hidden="true" style="font-size:20px"></i></a></p>
            
</div>
    </footer>
   </body>
</html>
