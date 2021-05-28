<?php
session_start();
unset($_SESSION['designation']);
session_unset();
header("Location:login.php");
?>