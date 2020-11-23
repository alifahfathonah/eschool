<?php


?>
<body style="background: #e4e2e2">
    <center><div style="width: 40%;margin-top: 10%;border-radius: 5px 5px 5px 5px">
    
        <div style="background: white;padding-top: 10%;padding-bottom: 10%">
                <div>
                    <img src="landing/images/logo.png" height="70">
                </div>
                <h3  style="color: #1ab394;font-family: 'Open Sans', helvetica, arial, sans-serif;">Welcome to eSchool Life</h3>
                <p>You have successfully signed up with <em style="color: #1ab394;font-family: 'Open Sans', helvetica, arial, sans-serif;">ESchool Life</em> check you email for confirmation link</p>
                <div >
                    <div></div>
                </div>
                <a href="https://eschool.life/auth/check_login.php"><button style="width: 80%;border: 0px;height: 7%;background: #1ab394;color: #fff;border-radius: 5px 5px 5px 5px">Click here to login</button></a>
                <br>
                <div>
                    <p><strong>Copyright</strong> &copy; <i id="today_d"><?php echo date("Y");?></i> eSchool Life </p>
                </div>
            </div>
    
</div>
</center>
</body>


<body style="background: #e4e2e2">
    <center><div style="width: 40%;margin-top: 10%;border-radius: 5px 5px 5px 5px">
    
        <div style="background: white;padding: 10%">
                <div>
                    <img src="logo.png" height="70">
                </div>
                <h3  style="color: #1ab394;font-family: 'Open Sans', helvetica, arial, sans-serif;">Welcome to eSchool Life</h3>
                <p>You have successfully signed up with <em style="color: #1ab394;font-family: 'Open Sans', helvetica, arial, sans-serif;">ESchool Life</em> check you email for confirmation link</p>
                <div >
                    <div></div>
                </div>
                <a href="https://eschool.life/auth/check_login.php"><button style="width: 80%;border: 0px;height: 7%;background: #1ab394;color: #fff;border-radius: 5px 5px 5px 5px">Click here to login</button></a>
                <br>
                <div>
                    <p><strong>Copyright</strong> &copy; <i id="today_d"><?php echo date("Y");?></i> eSchool Life </p>
                </div>
            </div>
    
</div>
</center>
</body>


<?php 
$to = "tadashimelo@gmail.com";
$pass = 'MK8G5';
$subject = "Login Details";
$date = date("Y");
$htmlContent = '<html>
    <body style="background: #e4e2e2">
      <center><div style="width: 50%;border-radius: 5px 5px 5px 5px;height:60%">
    
        <div style="background: white;padding:10%;margin-top:25px">
                <div>
                    <img src="https://eschool.life/admin/inc/logo.png" alt="Image here..." height="70">
                </div>
                <h3  style="color: #1ab394;font-family: Open Sans, helvetica, arial, sans-serif;margin:3%">Welcome to eSchool Life</h3>
                <p style="padding:10px;line-height:200%">You have successfully signed up with <em style="color: #1ab394;font-family: CASTELLAR;font-size:1.2em;">ESchool Life</em>  Login With the details below
                  details:<br><b style="margin:10px">
                email : '.$to.'<br>
                Password : '.$pass.'</b></p>
                <div >
                    <div></div>
                </div>
                <a href="https://eschool.life/auth/check_login.php"><button style="width: 80%;border: 0px;height: 50px;background: #1ab394;color: #fff;border-radius: 5px 5px 5px 5px">Click here to login</button></a>
                <br>
                <div>
                    <p><strong>Copyright</strong> &copy; <i id="today_d">'.$date.'</i> eSchool Life </p>
                </div>
            </div>
    
      </div>
  </center>
</body>
</html>';
$from = 'eSchool Life<no_reply@eschool.life>';
// Additional headers
$headers = 'From: ' . $from. "\r\n";   
$headers  .= 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

 

 $send = mail($to,$subject,$htmlContent,$headers);
 if($send == true){
 echo "sent";
 }
 else{
 echo "rubbish";
 }
 
?>
