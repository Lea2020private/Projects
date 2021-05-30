<?php
session_start();
include 'database.php';
include('fpdf/fpdf.php');

//gettting session values
$sem=$_SESSION['sem'];
$reg=$_SESSION['reg'];
$ft=$_SESSION['ft'];
$dept=$_SESSION['dept'];
$gpa=$_SESSION['gpa'];
$totalCredit=$_SESSION['tot'];
$sumOfCG=number_format((float)$_SESSION['scg'],2, '.', '');
$grdnum=$_SESSION['grd'];

$fname=$_POST['name'];
$name=strtoupper($fname);
$fregno=$_POST['regno'];
$regno=strtoupper($fregno);

$sql="insert into records values('$name','$regno','$gpa')";
$result = $conn->query($sql);

$query1="select*from cgpa where sem=$sem && reg='$reg' && dept='$dept'";
$query2="select*from cgpa where sem=$sem && reg='$reg' && dept='$dept' && ftrack='no'";
$query3="SELECT * from cgpa where sem=$sem && reg='$reg' && dept='$dept' order by credit desc limit 1";

//check session set por not
if(!isset($_SESSION["gpa"]) ){
     header("Location:Home.php");
    }
    
// first else if condition
else if($sem<=4&&$ft=='') {
f1($query1);
}

// second else if condition
else if($sem<8&&($ft==""||$ft=='no'))
{
   f1($query2);
}
 
//third else if condition
else if($sem<8&&$ft=='yes'){
 f1($query1);
}

//fourth else if condition
else if($sem==8&&$ft=='yes'){
    f2($query3);

}

// fifth else if condition
else if($sem==8&&($ft==""||$ft=='no'))
{
  f2($query2);
}


function f1($sql){

    $dbhost= "localhost";
    $dbname= "mysql";
    $dbuser= "root";
    $dbpass= "";
    $conn= new mysqli($dbhost,$dbuser,$dbpass,$dbname);

    $sem=$_SESSION['sem'];
    $reg=$_SESSION['reg'];
    $ft=$_SESSION['ft'];
    $dept=$_SESSION['dept'];
    $gpa=$_SESSION['gpa'];
    $totalCredit=$_SESSION['tot'];
    $sumOfCG=number_format((float)$_SESSION['scg'],2, '.', '');
    $grdnum=$_SESSION['grd'];
    
    $fname=$_POST['name'];
    $name=strtoupper($fname);
    $fregno=$_POST['regno'];
    $regno=strtoupper($fregno);



$grd=array();

for($i=0;$i<count($grdnum);$i++){
    if($grdnum[$i]==10){
        $grd[$i]="O";
    }else if($grdnum[$i]=='09'){
        $grd[$i]="A+";
    }else if($grdnum[$i]=='08'){
        $grd[$i]="A";
    }else if($grdnum[$i]=='07'){
        $grd[$i]="B+";
    }else if($grdnum[$i]=='06'){
        $grd[$i]="B";
    }else if($grdnum[$i]=='00'){
        $grd[$i]='RA';
    }
}

$pdf = new FPDF('p','mm','A4');
$pdf->SetTitle('SGPA COPY');
$pdf->AddPage();
$pdf->Image('actlogo.png',0,0,210,25);
$pdf->Image('unoffical.png',150,40,30,30);
$pdf->SetFont('Times','BU',17);
$pdf->Cell(0,20,"",0,1);        //dummycell

$pdf->Cell(60,0,"",0,0);   //dummyz
$pdf->Cell(70,5,"STUDENT SGPA DETAILS",0,1);

$pdf->Cell(0,3,"",0,1);      //dummy
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"NAME",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$name,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,'REGISTER NUMBER',0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$regno,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"REGULATION",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$reg,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"DEPARTMENT",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$dept,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"SEMESTER",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$sem,0,1);
$pdf->Cell(0,10,"",0,1);           //dummy cell
$pdf->SetFont('Times','BU',13);
$pdf->Cell(50,5,"SUBJECT CODE",0);
$pdf->Cell(110,5,"SUBJECT NAME",0,0);
$pdf->Cell(40,5,"GRADE",0,1);
$pdf->Cell(50,5,"",0,1);       //dummy cell

$pdf->SetFont('Times','',10);    //change font and size
$query=$sql;
$result = $conn->query($query);
if($result->num_rows>0){ 
    $i=0;
    while($row=$result->fetch_assoc()) {
        $pdf->Cell(50,10,$row['scode'],0,0);
        $pdf->Cell(110,10,$row['sub'],0,0);
        $pdf->Cell(40,10,$grd[$i],0,1);
        $i++;
    }}

 $pdf->Cell(50,5,"",0,1);       //dummy cell

 
$pdf->SetFont('Times','B',13);
$pdf->Cell(85,10,"SUM OF CREDITS * GRADE",0,0);

$pdf->SetFont('Times','',13);
$pdf->Cell(40,10,":  ".$sumOfCG,0,1);


$pdf->SetFont('Times','B',13);
$pdf->Cell(85,10,'SUM OF TOTAL CREDITS',0);

$pdf->SetFont('Times','',13);
$pdf->Cell(40,10,":  ".$totalCredit,0,1);

$pdf->SetFont('Times','B',13);
$pdf->Cell(85,10,"SEMESTER GRADE POINT AVERAGE ",0);

$pdf->SetFont('Times','',13);
$pdf->Cell(40,10,":  ".$gpa,0,1);

$pdf->Cell(0,5,"",0,1);    //dumycell

$pdf->SetFont('Times','',15);
$pdf->Cell(35,0,"",0,0);    //dummycell
$pdf->Cell(100,1,"****************ALL THE BEST****************",0,1);

$pdf->Cell(0,5,"",0,1);    //dumycell
$pdf->SetFont('Times','',10);
$pdf->SetTextColor(194,8,8);
$pdf->Cell(70,1,"*This Document doesnot relate with ACGCET official",0,1);
session_unset();
$pdf->Output('',$regno.' SEM '.$sem.' SGPA DETAILS.pdf');

}


function f2($sql){

    $dbhost= "localhost";
    $dbname= "mysql";
    $dbuser= "root";
    $dbpass= "";
          $conn= new mysqli($dbhost,$dbuser,$dbpass,$dbname);

    $sem=$_SESSION['sem'];
    $reg=$_SESSION['reg'];
    $ft=$_SESSION['ft'];
    $dept=$_SESSION['dept'];
    $gpa=$_SESSION['gpa'];
    $totalCredit=$_SESSION['tot'];
    $sumOfCG=number_format((float)$_SESSION['scg'],2, '.', '');
    $grdnum=$_SESSION['grd'];
    
    $fname=$_POST['name'];
    $name=strtoupper($fname);
    $fregno=$_POST['regno'];
    $regno=strtoupper($fregno);


   $grd=array();

for($i=0;$i<count($grdnum);$i++){
    if($grdnum[$i]==10){
        $grd[$i]="O";
    }else if($grdnum[$i]=='09'){
        $grd[$i]="A+";
    }else if($grdnum[$i]=='08'){
        $grd[$i]="A";
    }else if($grdnum[$i]=='07'){
        $grd[$i]="B+";
    }else if($grdnum[$i]=='06'){
        $grd[$i]="B";
    } else if($grdnum[$i]=='00'){
        $grd[$i]='RA';
    }
}

$pdf = new FPDF('p','mm','A4');
$pdf->SetTitle('SGPA COPY');
$pdf->AddPage();
$pdf->Image('actlogo.png',0,0,210,25);

$pdf->Image('unoffical.png',150,40,30,30);
$pdf->SetFont('Times','BU',17);
$pdf->Cell(0,20,"",0,1);        //dummycell

$pdf->Cell(60,0,"",0,0);   //dummy
$pdf->Cell(70,5,"STUDENT SGPA DETAILS",0,1);

$pdf->Cell(0,3,"",0,1);      //dummy
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"NAME",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$name,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,'REGISTER NUMBER',0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$regno,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"REGULATION",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$reg,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"DEPARTMENT",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$dept,0,1);
$pdf->SetFont('Times','B',15);
$pdf->Cell(60,10,"SEMESTER",0,0);
$pdf->SetFont('Times','',13);
$pdf->Cell(60,10,":  ".$sem,0,1);
$pdf->Cell(0,10,"",0,1);           //dummy cell

$pdf->SetFont('Times','BU',13);
$pdf->Cell(50,5,"SUBJECT CODE",0);
$pdf->Cell(70,5,"SUBJECT NAME",0,0);
$pdf->Cell(50,5,"GRADE",0,1);
$pdf->Cell(50,5,"",0,1);       //dummy cell

$pdf->SetFont('Times','',10);    //change font and size
$query=$sql;
$result = $conn->query($query);
if($result->num_rows>0){ 
    $i=0;
    while($row=$result->fetch_assoc()) {
        $pdf->Cell(50,10,$row['scode'],0,0);
        $pdf->Cell(70,10,$row['sub'],0,0);
        $pdf->Cell(50,10,$grd[$i],0,1);
        $i++;
    }}

 $pdf->Cell(50,15,"",0,1);       //dummy cell

$pdf->SetFont('Times','B',13);
$pdf->Cell(85,10,"SUM OF CREDITS * GRADE",0,0);

$pdf->SetFont('Times','',13);
$pdf->Cell(40,10,":  ".$sumOfCG,0,1);

$pdf->SetFont('Times','B',13);
$pdf->Cell(85,10,'SUM OF TOTAL CREDITS',0);

$pdf->SetFont('Times','',13);
$pdf->Cell(40,10,":  ".$totalCredit,0,1);

$pdf->SetFont('Times','B',13);
$pdf->Cell(85,10,"SEMESTER GRADE POINT AVERAGE ",0);

$pdf->SetFont('Times','',13);
$pdf->Cell(40,10,":  ".$gpa,0,1);
$pdf->Cell(0,5,"",0,1);    //dumycell

$pdf->SetFont('Times','',15);
$pdf->Cell(35,0,"",0,0);    //dummycell
$pdf->Cell(100,5,"****************ALL THE BEST****************",0,1);

$pdf->Cell(0,5,"",0,1);    //dumycell
$pdf->SetFont('Times','',10);
$pdf->SetTextColor(194,8,8);
$pdf->Cell(70,5,"*This Document doesnot relate with ACGCET official",0,1);
session_unset();
$pdf->Output('',$regno.' SEM '.$sem.' SGPA DETAILS.pdf');
}
?>
