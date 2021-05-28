<?php
session_start();
include 'db.php';
date_default_timezone_set("Asia/Kolkata");

$trackingnum=$_REQUEST['q'];
$time=date("Y/m/d h:i:sa");

//check alredy exist or not
$sql="select*from trackdetails where tno='$trackingnum'";
$result = $conn->query($sql);
if($result->num_rows==0){ 
$sql1="insert into trackdetails (tno,time1,status)values ('$trackingnum','$time',1)";
if($conn->query($sql1)){
    echo "success";
}else{
    echo "failed";
}
}else{
    echo "TRACKING NUMBER ALREADY EXISTS";
}



?>