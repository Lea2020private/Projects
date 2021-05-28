<?php
session_start();
include 'db.php';
$newpass=$_REQUEST['q'];
$username=$_SESSION['username'];
$sql="select * from userdetails where username='$username'";
$result = $conn->query($sql);
if($result->num_rows>0){ 
$sql1="update userdetails set password='$newpass' where username='$username'";
if($conn->query($sql1)){
    echo "success";
}else{
    echo "failed";
}
}

?>