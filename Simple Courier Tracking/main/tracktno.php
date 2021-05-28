<?php
session_start();
include 'db.php';
$trackingnum=$_REQUEST['q'];

//check alredy exist or not
$sql="select*from trackdetails where tno='$trackingnum'";
$result = $conn->query($sql);
$row=$result->fetch_assoc();

//getting tracking status
$status=$row['status'];

if($result->num_rows>0){ 
    echo $status;
}else{
    echo "ENTER A VALID TRACKING NUMBER";
}
?>