<?php
session_start();

if(!isset($_SESSION['designation'])) 
{
          header("Location:login.php");
        }

        if($_SESSION['designation']==1){
          header("Location:add.php");
        }    
    ?>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>TRACK DETAILS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="tracking.css">
  <script type="text/javascript" src="updat.js"></script>  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height:700px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height:100%;
      width:250px;
    }
    a{
        text-align:center;
    }
    .nav1{
        display:none;
         }

.tno{
    padding: 20px;
    border-radius:8px;
}


    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width:500px) {
      .sidenav {
        height:700px;
        padding: 10px;
      }
      .row.content {height:700px;} 
    .nav1{
        display:block;
        background:;
    }
    .nav2{
        display:none;
    }
    }
  </style>
</head>
<body>
<img src="t.jpg" style="width:100%;height:100px;">
<hr>

  <!-------------------------------------- NAV FOR MOBILE DEVIVCES  ---------------------------------------->
<div class="nav1">
    <div class="dropdown" style="background-color:yellow;padding:5px">
    <div  type="button" class="dropdown-toggle" data-toggle="dropdown">
      <i class="fa fa-bars"  style="margin-left:20px;color:black;font-size:35px;cursor:pointer"></i>                       
    </div>
      <ul class="dropdown-menu" role="menu" style="padding:20px;">
        <li><a  style="background-color:blue;color:white;cursor:pointer" id="Homenav1"  onclick="gohome()">HOME</a></li><br>
    <!--    <li><a  id="Addnav1"  onclick="goadd()" style="color:black;cursor:pointer">ADD</a></li><br>  -->
        <li><a id="Updatenav1" onclick="goupdate()" style="color:black;cursor:pointer">UPDATE</a></li> <br>
        <li><a id="Tracknav1" onclick="gotrack()" style="color:black;cursor:pointer">TRACK</a></li><br>
         <li><a id="Changenav1"  onclick="gochange()" style="color:black;cursor:pointer">CHANGE PASSWORD</a></li><br>
        <li><a href="logout.php" style="color:black">LOGOUT</a></li>
      </ul>
    </div>
  </div>
<br>

<div class="nav1">
<div id="Track1" style="display:none">
<div class="col-sm-3" >
        <div>
        <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." name="tnomobtrack">
        <br>
        <button type="button" style="margin-left:145px;"class="btn btn-success" onclick="dotrackmob()">TRACK</button>
        </div>
        </div> 
  </div>
  <div id="Add1" style="display:none">     
        <div class="col-sm-3">
        <div>
        <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." name="tnomobadd">
        <br>
        <button type="button" style="margin-left:145px;"class="btn btn-success">ADD</button>
        </div>
        </div> 
</div>
  <div id="Update1" style="display:none">
        <div class="col-sm-3">
        <div>
        <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." name="tnomobupdate">
        <br>
        <button type="button" style="margin-left:145px;"class="btn btn-success"  onclick="Updatemobtno()">UPDATE</button>
        </div>
        </div> 
</div>
<div id="Changepass1" style="display:none">
        <div class="col-sm-3">
        <div>
        <input type="password" class="form-control tno" id="" placeholder="Enter New Password.." name="changepassmob">
        <br>
        <button type="button" style="margin-left:145px;"class="btn btn-success"  onclick="Changemob()">CHANGE</button>
        </div>
        </div> 
</div>

        <br>
  <!-- TRACK 3 -->
  <div id="trackmob3" style="display:none">    
  <div class="progres_mob" style="margin-left:75px;">
  <ul>
  <li>
   <h5><i class="fa fa-check-circle" style="font-size:24px; background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;FIRST STAGE
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
    <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  
  <h5><i class="fa fa-check-circle" style="font-size:24px; background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;SECOND STAGE 
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
  <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  <h5><i class="fa fa-check-circle" style="font-size:24px;background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;THIRD STAGE 
<!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
   <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  <h5><i class="fa fa-clock-o" style="font-size:24px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;FINAL PRINCIPAL STAGE 
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
  </li>
  </ul>
   </div>
   <br>
   <br>
   <div class="panel panel-info" style="text-align:center;">
      <div class="panel-heading">Tracking has been processed Wait for the Final Stage verification.</div>
    </div>
  </div>

  <!-- TRACK 1 -->
  <div id="trackmob1" style="display:none">    
  <div class="progres_mob" style="margin-left:75px;">
  <ul>
  <li>
   <h5><i class="fa fa-check-circle" style="font-size:24px; background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;FIRST STAGE
   <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
    </h5>
    <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  <h5><i class="fa fa-clock-o" style="font-size:24px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;SECOND STAGE 
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
  <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:#ccc;"></p>
  </li>
  <li>
  <h5><i class="fa fa-refresh" style="font-size:24px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;THIRD STAGE 
 <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
   <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:#ccc;"></p>
  </li>
  <li>
  
  <h5><i class="fa fa-refresh" style="font-size:24px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;FINAL PRINCIPAL STAGE
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
  </li>
  </ul>
   </div>
   <br>
   <br>
   <div class="panel panel-info" style="text-align:center;">
      <div class="panel-heading">Tracking has been processed Wait for the Second Stage verification.</div>
    </div>
  </div>

  <!-- TRACK 2 -->
  <div id="trackmob2" style="display:none">    
  <div class="progres_mob" style="margin-left:75px;">
  <ul>
  <li>
   <h5><i class="fa fa-check-circle" style="font-size:24px; background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;FIRST STAGE
    <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
    </h5>
    <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  
  <h5><i class="fa fa-check-circle" style="font-size:24px; background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;SECOND STAGE 
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
  <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  <h5><i class="fa fa-clock-o" style="font-size:24px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;THIRD STAGE 
 <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
 </h5>
   <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:#ccc;"></p>
  </li>
  <li>
  
  <h5><i class="fa fa-refresh" style="font-size:24px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;FINAL PRINCIPAL STAGE
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
  </li>
  </ul>
   </div>
   <br>
   <br>
   <div class="panel panel-info" style="text-align:center;">
      <div class="panel-heading">Tracking has been processed Wait for the Third Stage verification.</div>
    </div>
  </div>

<!-- TRACK 4 -->
<div id="trackmob4" style="display:none">    
  <div class="progres_mob" style="margin-left:75px;">
  <ul>
  <li>
   <h5><i class="fa fa-check-circle" style="font-size:24px; background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;FIRST STAGE 
    <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
    </h5>
    <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  
  <h5><i class="fa fa-check-circle" style="font-size:24px; background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;SECOND STAGE
   <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
   </h5>
  <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  <h5><i class="fa fa-check-circle" style="font-size:24px;background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;THIRD STAGE 
  <!--<p style="color:black;margin-left:50px">18:24:00 JUN 24</p> -->
  
 </h5>
   <p style=" margin-left:20px;
    height:60px;
    width:5px;
    background-color:rgb(0, 204, 255);"></p>
  </li>
  <li>
  
  <h5><i class="fa fa-check-circle" style="font-size:24px;background-color: rgb(0, 204, 255);"></i>&nbsp;&nbsp;&nbsp;&nbsp;FINAL PRINCIPAL STAGE
  <!--<p style="color:black;margin-left:55px">18:24:00 JUN 24</p> -->
  </h5>
  </li>
  </ul>
   </div>
   <br>
   <br>
   <div class="panel panel-success" style="text-align:center;">
      <div class="panel-heading">Tracking has completed.</div>
    </div>
  </div>

</div>

  <!-------------------------------------- NAV FOR DESKTOP DEVIVCES  ---------------------------------------->
<div class="nav2">
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-1 sidenav">
    <br><br>
      <ul class="nav nav-pills nav-stacked">
        <li><a  style="background:blue;color:white;cursor:pointer"  id="Homenav2" onclick="gohome()">HOME</a></li>
        <br>
      <!---  <li><a  id="Addnav2"   style="color:black;cursor:pointer" onclick="goadd()">ADD</a></li>
        <br>  -->
        <li><a id="Updatenav2"  style="color:black;cursor:pointer" onclick="goupdate()">UPDATE</a></li>
        <br>
        <li><a id="Tracknav2" style="color:black;cursor:pointer" onclick="gotrack()">TRACK</a></li>
        <br>
       <li><a id="Changenav2" style="color:black;cursor:pointer" onclick="gochange()">CHANGE PASSWORD</a></li>
        <br>  
        <li><a href="logout.php"  style="color:black;cursor:pointer">LOGOUT</a></li>
      </ul><br>
      <div class="input-group">
        </span>
      </div>
    </div>


 
    <div class="col-sm-3">
    </div>
    <div class="col-sm-6" style=" visibility: hidden;">
     <form method="POST">
	        <input type="text" name="" value="" placeholder=""/><br>
	        <input type="submit" value="Submit"/>
        </form>
     </div>

    
    <div class="col-sm-3">
    </div>
    <div id="Track2" style="display:none">
     <div class="col-sm-3">
        <div>
        <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." name="tnodesktrack">
        <br>
        <button type="button" style="margin-left:110px;"class="btn btn-success" onclick="dotrackdesk()">TRACK</button>
        </div>
    </div>  
    </div>
    <div id="Add2" style="display:none">
     <div class="col-sm-3">
        <div>
        <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." name="tnodeskadd">
        <br>
        <button type="button" style="margin-left:110px;"class="btn btn-success">ADD</button>
        </div>
    </div>  
    </div>
    <div id="Update2" style="display:none">
     <div class="col-sm-3">
        <div>
        <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." name="tnodeskupdate">
        <br>
        <button type="button" style="margin-left:110px;"class="btn btn-success" onclick="Updatedesktno()">UPDATE</button>
        </div>
    </div>  
    </div>
    <div id="Changepass2" style="display:none">
     <div class="col-sm-3">
        <div>
        <input type="password" class="form-control tno" id="" placeholder="Enter New Password.." name="changepassdesk">
        <br>
        <button type="button" style="margin-left:110px;"class="btn btn-success" onclick="Changedesk()">CHANGE</button>
        </div>
    </div>  
    </div>
    <!-- TRACK 3 ---------------->

     <div id="trackdesk3" style="display:none">
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  


<div class="col-md-9">
<div class="progres_desk3">
  <ul>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>FIRST STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>SECOND STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>THIRD STAGE</h5> 
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-clock-o" style="font-size:24px"></i>
  <h5>FINAL PRINCIPAL STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  </ul>
   <br>
   <br>
   <div class="panel panel-info" style="margin-left:40px;text-align:center;">
      <div class="panel-heading">Tracking has been processed Wait for the Final Stage verification.</div>
    </div>
   </div>
  </div>
  </div>
    
     <!---  TRACK 1 ------------->
     <div id="trackdesk1" style="display:none">
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  


<div class="col-md-9">
<div class="progres_desk1">
  <ul>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>FIRST STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-clock-o" style="font-size:24px"></i>
  <h5>SECOND STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-refresh" style="font-size:24px"></i>
  <h5>THIRD STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-refresh" style="font-size:24px"></i>
  <h5>FINAL PRINCIPAL STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  </ul>
  <br>
   <br>
   <div class="panel panel-info" style="text-align:center;">
      <div class="panel-heading">Tracking has been processed Wait for the Second Stage verification.</div>
    </div>
   </div>
  </div>
  </div>
 
  <!---  TRACK 2 ------------->
  <div id="trackdesk2" style="display:none">
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  


<div class="col-md-9">
<div class="progres_desk2">
  <ul>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>FIRST STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>SECOND STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-clock-o" style="font-size:24px"></i>
  <h5>THIRD STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-refresh" style="font-size:24px"></i>
  <h5>FINAL PRINCIPAL STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  </ul>
  <br>
  <br>
   </div>
   <div class="panel panel-info" style="margin-left:40px;text-align:center;color:white">
      <div class="panel-heading">Tracking has been processed Wait for the Third Stage verification.</div>
    </div>
  </div>
  </div>
  
 
  <!---  TRACK 4 ------- -->
  <div id="trackdesk4" style="display:none">
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
    <div class="col-sm-9" style=" visibility: hidden;">
    <input type="text" class="form-control tno" id="" placeholder="Enter Tracking No.." >
    </div>  
   
   <div class="col-md-9">
   <div class="progres_desk4">
  <ul>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>FIRST STAGE</h5>
  <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>SECOND STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>THIRD STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  <li>
  <i class="fa fa-check-circle" style="font-size:24px"></i>
  <h5>FINAL PRINCIPAL STAGE</h5>
   <!--
  <p style="color:black">18:24:00 JUN 24</p>
  -->
  </li>
  </ul>
  <br>
   <br>
   <div class="panel panel-success" style="margin-left:40px;text-align:center;">
      <div class="panel-heading">Tracking has completed.</div>
    </div>
   </div>
  </div>
  </div>
 

</div> 
  </div>
  </div>
  </div>
</div>
</body>
</html>
