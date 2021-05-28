<?php
session_start();
include 'db.php';
date_default_timezone_set("Asia/Kolkata");
$user=$_SESSION['designation'];
$trackingnum=$_REQUEST['q'];
$time=date("Y/m/d h:i:sa");

//check alredy exist or not
$sql="select*from trackdetails where tno='$trackingnum'";
$result = $conn->query($sql);
$row=$result->fetch_assoc();

//getting tracking status
$status=$row['status'];

if($result->num_rows>0){ 

//update tracking status
if($user==2&&$status==1){
$sql1="update trackdetails set status=2,time2='$time' where tno='$trackingnum'";
if($conn->query($sql1)){
    echo "success";
}else{
    echo "failed";
  }
}
else if($user==3&&$status==2){
    $sql1="update trackdetails set status=3,time3='$time' where tno='$trackingnum'";
    if($conn->query($sql1)){
        echo "success";
    }else{
        echo "failed";
      }
    }
else if($user==4&&$status==3){
    $sql1="update trackdetails set status=4,time4='$time' where tno='$trackingnum'";
    if($conn->query($sql1)){
        echo "success";
    }else{
        echo "failed";
      }
    }else if(($user==3 && $status<2)||($user==4 && $status<3)){
     echo "PLEASE WAIT TILL RECEIVE";
    }
else{
  echo 'updated';
 }
}
else{
    echo "ENTER A VALID TRACKING NUMBER !";
}

?>