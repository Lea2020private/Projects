<?php
session_start();
$_SESSION["login"]="login";
?>

<!DOCTYPE html>
<html>
<head>

  <title>SGPA CALCULATOR</title>
  <link rel="shortcut icon" type="image/png" width="16" height="16" href="act.jpg"/>
</head>
    <body>
    <link rel="stylesheet" href="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <center>
   

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<style>
header{
   background: #111;
    color: #fff;
    height: 50px;
    //margin: 0;
    //display: flex;
    //padding: 0 1%;
    //align-items: center;
    font-size: 32px;
    text-align:center;
}
body{
    background-image:url("college2.jpg");
    width:auto;
	background-size: 100% 100%;
    width : 100vw;
    height: 100vh;
    overflow-y:hidden;
    overflow-x:hidden;
 }
#reg{
  width: 300px;
  margin:1rem;
  margin-top:120px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  background-color:white;
  opacity:0.9;
  text-align:center;
  padding:40px;
}
#semdiv{
  width: 300px;
  margin:1rem;
  margin-top:90px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  background-color:white;
  opacity:0.9;
  text-align:center;
  padding:40px;
}
#dept{
  width: 300px;
  margin:1rem;
  margin-top:90px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  background-color:white;
  opacity:0.9;
  text-align:center;
  padding:40px;  
}
#ft,#submit{
  width: 300px;
  margin:1rem;
  margin-top:140px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  background-color:white;
  opacity:0.9;
  text-align:center;
  padding:40px;
}
#btn1
{
    display: block;
    width: 100px;
    outline: none;
    border: none;
    background-color: green;
    padding: 1vh;
    margin:  10px  auto ;
    cursor: pointer;
    border-radius: 1em;
    color:white;
 }
#start{
  width: 500px;
  margin:1rem;
  margin-top:120px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
  background-color:white;
  opacity:0.9;
}
i{
  color:red;
  padding:5px;
}
 #arrow{
   font-size:20px;
   border-radius:15px;
   width:80px;
 }
 #arrow:hover{
   padding-left:30px;
   border-radius:20px;
  transform: perspective(500px) rotateY(15deg);
	text-shadow: -6px 3px 2px rgba(0, 0, 0, 0.2);
	box-shadow: -2px 0 0 5px rgba(0, 0, 0, 0.2);
 }
  #grid{
   margin-left:28px;
  display: grid;
  grid-template-columns: auto auto auto auto ;
  grid-row-gap: 10px;
    }

.footer{
    position:fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    background-color: #111;
    color: #fff;
    border: 0;
    font-size: x-small;
    text-align: center;
    height:50px;
    }


    @media screen and (max-width:500px) and (max-height:575px) {
  #btn {
    width:20%;
    font-size:10px;
  }
  body{
      height:567px;
      overflow:hidden;
  }
 #start{
  width: 300px;
  margin:1rem;
  margin-top:75px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
}
#reg{
   margin-top:75px;
   width: 300px; 
}
#semdiv{
    margin-top:30px;
    width: 300px;

}
#dept{
    margin-top:30px; 
    width: 300px;
}
#ft{
    margin-top:80px;
}
#submit{
    margin-top:100px;
    width: 300px;
}
}
@media screen and (max-width:500px) and (min-height:576px) {
  body{
      height:730px;
      overflow:hidden;
  }
#start{
  width: 320px;
  margin:1rem;
  margin-top:150px;
  border: 1px;
  border-radius:15px;
  box-shadow: 0px 0px 8px 0.3px rgba(0, 0, 0, 1);
}
#reg{
   margin-top:150px; 
}
#dept{
    margin-top:110px;
}
#semdiv{
    margin-top:110px;
}
#ft{
    margin-top:150px;
}
#submit{
    margin-top:170px;
}
 }

</style>
<script>
document.onkeydown = function(e) {
    if (e.ctrlKey && (e.keyCode === 67 || e.keyCode === 86 || e.keyCode === 85 || e.keyCode === 117)) {//Alt+c, Alt+v will also be disabled sadly.
        alert('not allowed');
        return false;
    }
    
};
function showreg(){
  document.getElementById("reg").style.display = "block";
  document.getElementById("start").style.display = "none";
  
}
function showdept(){
  document.getElementById("reg").style.display = "none";
  document.getElementById("dept").style.display = "block";
}
function showsem(){
  document.getElementById("dept").style.display = "none";
  document.getElementById("semdiv").style.display = "block";
}
function showft(){
    document.getElementById("ft").style.display = "block";
  document.getElementById("semdiv").style.display = "none";
}

function showsub(){
    document.getElementById("semdiv").style.display = "none";
    document.getElementById("submit").style.display = "block";
    document.getElementById("ft").style.display = "none";
}


</script>
<header>
        <span id="iCon">
        <img src="lo.jpeg" style="height:40px;width:60px;">
        </span>
       SGPA CALCULATOR
    </header>
<p><b style="color:red">NOTE:</b>*This Sgpa Calculator Designed Only for ACGCET Studennts.</p>

<div id="start">
<h4>HELLO..!</h4>
<h4>LETS CALCULATE YOUR SGPA </h4> <i class="fa fa-hand-o-down" style="font-size:35px"></i><span id='btn1' onclick="showreg()">LETS GO</span> <i class="fa fa-hand-o-up"  style="font-size:35px"></i>
</div>

<form method='post' action="secondpage.php">

<div id="reg" visibility: hidden>
<h4> which regulation you are belongs to</h4>
<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-cyan btn-rounded form-check-label"  onclick="showdept()" style="background-color:green;border-radius:15px;color:white; font-size:15px;">
    <input class="form-check-input" type="radio" name='reg' value="2015A"  >2015A
  </label>
  <br>
  <br>
  <label class="btn btn-cyan btn-rounded form-check-label"  onclick="showdept()" style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio"  name="reg" value="2019" >2019
  </label>
</div>
</div>

<div id='dept' visibility: hidden>
<h4> which department you are belongs to</h4>
<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-cyan btn-rounded form-check-label"  onclick="showsem()" style="background-color:green;border-radius:15px;padding-left:13px;color:white; font-size:15px;">
    <input class="form-check-input" type="radio" name='dept' value="CIVIL">CIVIL
  </label>
  <br><br>
  <label class="btn btn-cyan btn-rounded form-check-label"    onclick="showsem()" style="background-color:green;border-radius:15px;padding-left:7px;color:white; font-size:15px;">
    <input class="form-check-input" type="radio" name='dept' value="MECH">MECH
  </label>
  <br><br>
  <label class="btn btn-cyan btn-rounded form-check-label"  onclick="showsem()"   style="background-color:green;border-radius:15px;padding-left:22px;color:white; font-size:15px;">
    <input class="form-check-input" type="radio" name='dept' value="EEE">EEE
  </label>
  <br><br>
  <label class="btn btn-cyan btn-rounded form-check-label"   onclick="showsem()" style="background-color:green;border-radius:15px;padding-left:22px;color:white; font-size:15px;">
    <input class="form-check-input" type="radio" name='dept' value="ECE">ECE
  </label>
  <br><br>
  <label class="btn btn-cyan btn-rounded form-check-label"   onclick="showsem()" style="background-color:green;border-radius:15px;padding-left:22px;color:white; font-size:15px;">
    <input class="form-check-input" type="radio" name='dept' value="CSE">CSE
  </label>
  <br><br>
</div>
</div>




<div id="semdiv" visibility: hidden>
<h4> which semester you are studying</h4>
<div class="btn-group" data-toggle="buttons" id="grid">
  <label class="btn btn-cyan btn-rounded form-check-label"   onclick="showsub()" style="background-color:green;border-radius:15px;padding-left:22px;color:white; font-size:15px;">
    <input class="form-check-input" type="radio"  id='sem' name='sem' value="1">01
  </label>
  <br>
  <br>
  <label class="btn btn-cyan btn-rounded form-check-label"    onclick="showsub()" style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio" id='sem' name="sem" value="2">02
  </label> <br> <br>
  <label class="btn btn-cyan btn-rounded form-check-label"   onclick="showsub()"  style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio" id='sem' name="sem" value="3">03
  </label> <br> <br>
  <label class="btn btn-cyan btn-rounded form-check-label"    onclick="showsub()" style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio" id='sem' name="sem" value="4">04
  </label> <br> <br>
  <label class="btn btn-cyan btn-rounded form-check-label"   onclick="showft()"  style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio" id='sem' name="sem" value="5">05
  </label> <br> <br>
  <label class="btn btn-cyan btn-rounded form-check-label"    onclick="showft()" style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio" id='sem'  name="sem" value="6">06
  </label> <br> <br>
  <label class="btn btn-cyan btn-rounded form-check-label"    onclick="showft()" style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio" id='sem' name="sem" value="7">07
  </label> <br> <br>
  <label class="btn btn-cyan btn-rounded form-check-label"  onclick="showft()"  style="background-color:green;border-radius:15px;padding-left:22px; color:white; font-size:15px">
    <input class="form-check-input" type="radio" id='sem' name="sem" value="8">08
  </label> <br> <br>
</div>
</div>
<div id="ft" visibility: hidden>
<h4>are u taking fastrack</h4>
<div class="btn-group" data-toggle="buttons">
  <label class="btn btn-cyan btn-rounded form-check-label" onclick="showsub()" style="background-color:green;border-radius:15px;padding-left:15px;color:white; font-size:14px;">
    <input class="form-check-input" type="radio" name='ft' value="yes">YES
  </label>
  <br>
  <br>
  <label class="btn btn-cyan btn-rounded form-check-label"  onclick="showsub ()"style="background-color:green;border-radius:15px;padding-left:22px;color:white; font-size:14px;">
    <input class="form-check-input" type="radio" name='ft' value="no">NO
  </label>
</div>
</div>

<div id="submit" visibility: hidden>
<h4>proceed to next</h4>
<input type="submit" name="login" value="&#8250;&#8250;&#8250;&#8250;&#8250;" class="btn btn-primary" id="arrow">
 </div>
   </form> 
  <footer>
     <div class="footer">

    <p style="font-size:11px">Copyrights reserved.&#169 2020 by <span style="color:green">EXAMPLE TEXT<span></p>
    <p class="p" style="font-size:12px">contact us on  <a href="https://www.instagram.com/"><i class="fa fa-instagram" aria-hidden="true" style="font-size:20px"></i></a>
             <a href="https://wa.me/916379705214"><i class="fa fa-whatsapp" aria-hidden="true" style="font-size:20px"></i></a>
             <a href="#"><i class="fa fa-facebook" aria-hidden="true" style="font-size:20px"></i></a></p>
            
</div>
</div>
    </footer>
   </center>
   </body>
   </html>