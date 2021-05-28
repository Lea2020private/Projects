<?php
include 'db.php';
//check alredy exist or not
$sql="select*from userdetails where username='$_POST[username]'";
$result = $conn->query($sql);
if($result->num_rows==0){ 
$sql1="insert into userdetails values('$_POST[username]','$_POST[designame]','$_POST[password]')";
if($conn->query($sql1)){
    echo "success";
}else{
    echo "FAILED TO CREATE ACCOUNR! PLEASE TRY AGAIN LATER";
}
}else{
    echo "USERNAME ALREADY EXISTS,TRY WITH NEW USERNAME";
}

?>