<?php
session_start();
include 'database.php';
$sql="insert into comment values('$_POST[uname]','$_POST[ucomment]','$_SESSION[gpa]')";
if($conn->query($sql)){
    session_unset();
    echo 'success';
}else{
    session_unset();
    echo "FAILED TO UPDATE YOUR COMMENT,SORRY FOR YOU INCONEVINENCE PLEASE TRY AGAIN LATER";
    
}

?>