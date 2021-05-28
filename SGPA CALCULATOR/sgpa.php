<?php

     $dbhost= "sql107.epizy.com:3306";
          $dbname= "epiz_27500361_cgpa";
          $dbuser= "epiz_27500361";
          $dbpass= "mQ49023b73U3";
          $conn= new mysqli($dbhost,$dbuser,$dbpass,$dbname); 
session_start();
$sem=$_SESSION["sem"];
$reg=$_SESSION["reg"];
$dept=$_SESSION["dept"];
$ft=$_SESSION['ft'];
$s=$_REQUEST["q"];

//echo "lll";
//$query1="SELECT sum(credit) as sum from cgpa where sem=$sem && reg='$reg' && dept='$dept'";
$query11="select * from cgpa where sem=$sem && dept='$dept' && reg='$reg'";
//$query2="SELECT sum(credit) as sum from cgpa where sem=$sem && reg='$reg' && dept='$dept' && ftrack='no'";
$query22="select * from cgpa where sem=$sem && dept='$dept' && reg='$reg' && ftrack='no'";
//$query3="SELECT credit as sum from cgpa where sem=$sem && reg='$reg' && dept='$dept' order by credit desc limit 1";
$query33="SELECT * from cgpa where sem=$sem && reg='$reg' && dept='$dept' order by credit desc limit 1";

//echo "lll";
if($sem<=4&&$ft==''){
   // echo "ll";
calGpa($query11);

}


else if($sem>4&&($ft=='no'||$ft=='')){
calGpa($query22);
}

else if($sem>4 && $sem<=7 && $ft=='yes'){
  calGpa($query11);
}

else if($sem==8 && $ft=='yes')
{
calGpa($query33);
}



function calGpa($sq){
$dbhost= "sql107.epizy.com:3306";
          $dbname= "epiz_27500361_cgpa";
          $dbuser= "epiz_27500361";
          $dbpass= "mQ49023b73U3";
          $conn= new mysqli($dbhost,$dbuser,$dbpass,$dbname);

session_start();
$sem=$_SESSION["sem"];
$reg=$_SESSION["reg"];
$dept=$_SESSION["dept"];
$ft=$_SESSION['ft'];
$s=$_REQUEST["q"];
//echo "88";
$ss=explode(",",$s);
$_SESSION['grd']=$ss;

$grade=array();
$credit=array();
for($i=0;$i<count($ss);$i++){
$grade[$i]=$ss[$i];
}
$credit=array();
$sumOfCG=0;
$totalCredit=0;

//$result = $conn->query($sql1);
//$row=$result->fetch_assoc();
//$totalCredit=$row['sum'];
$sql = $sq;
$result = $conn->query($sql);
$i=0;
if($result->num_rows>0){ 
while($row=$result->fetch_assoc()) {
$credit[$i]=$row['credit'];
$i++;
}
} 
for($i=0;$i<count($grade);$i++){
    $totalCredit=$totalCredit+$credit[$i];
    $sumOfCG=$sumOfCG+($grade[$i]*$credit[$i]);
}
$_SESSION["gpa"]=number_format((float)$sumOfCG/$totalCredit, 3, '.', '');
$_SESSION['tot']=$totalCredit;
$_SESSION['scg']=$sumOfCG;
echo sprintf("%.2f",$sumOfCG/$totalCredit);
}
        
?>