<?php
include "../connection/db_connect.php";
//get the last id from the setting table
$check = mysqli_query($con, "SELECT * FROM settings ORDER BY school_id DESC LIMIT 1");
while ($last_person = mysqli_fetch_array($check)) {
    $sch_id = $last_person['school_id'];
}
$payment = isset($_GET['payment']) ? $_GET['payment'] : 0;
error_reporting(E_ALL);
error_reporting(E_ERROR);
//loop through each uploads
foreach ($_FILES['file']['tmp_name'] as $key => $name_temp) {
    $name = $_FILES['file']['name'][$key];
    $tmpnm = $_FILES['file']['tmp_name'][$key];
    $type = $_FILES['file']['type'][$key];
    $size = $_FILES['file']['size'][$key];

    if ($_FILES['file']['size'][$key] > 400000000000) {
        echo "file size should not exceed 1mb";
    } else {
        // check file extension
        if ($_FILES['file']['type'][$key] != 'image/jpeg'
            && $_FILES['file']['type'][$key] != 'image/jpg'
            && $_FILES['file']['type'][$key] != 'image/gif'
            && $_FILES['file']['type'][$key] != 'image/png'

        ) {
            // echo "Please upload only Image file";
        } else {
            //this is the dir for the photo
            $dir = "../logo/" . $name;
            $newname = rand(999999999, 9999999999999) . '.jpg';
            $move = move_uploaded_file($tmpnm, "../logo/" . $newname);
            $pathnn = "../logo/" . $newname;
        }
    }
}

//create a new school id
$new_school_id = $sch_id + 1;
//generate password
$new_password = (rand(01234567, 123456789));

@$agent_ref = $_GET['ref'];


@$create_sch = $_POST['create_sch'];
@$name_school = $_POST['name_school'];
@$address = $_POST['address_school'];
@$country = $_POST['country'];
@$city = $_POST['city'];
@$state = $_POST['state'];
@$email = $_POST['official_mail'];
@$email_hash = base64_encode($_POST['official_mail']);
@$phone = $_POST['school_phone'];
@$website = $_POST['website'];
@$slogan = $_POST['slogan'];
@$agent_ref = $_POST['agent'];
@$school_sys = $_POST['school_sys'];
@$plan = $_POST['plan'];




if($create_sch){
  $check_acc = mysqli_num_rows(mysqli_query($con, "SELECT * FROM settings WHERE email='$email' "));
  if ($check_acc > 0) {
    echo " <script>alert('An account with this email address already exist, please check the email and register again');window.location.assign('create_school.php')</script>";
  }
  else{
    $qry = mysqli_query($con, "insert into settings (
school_id,school_name,address,country,city,state,email,phone,website,slogan,system,logo,ref,wallet,plan)VALUES
 ('$new_school_id','$name_school','$address','$country','$city','$state','$email','$phone','$website','$slogan','$school_sys','$pathnn','$agent_ref','50','$plan')");
    if($qry) {
        echo '<p style="color: green">Successfully Created</p>';
        //auto create account for the member!
        $new_account = mysqli_query($con, "insert into auth (school_id,password,email,priv)VALUES
 ('$new_school_id','$new_password','$email','1')");

        //auto create features for the member!
        $new_account = mysqli_query($con, "insert into feature(school_id)VALUES
 ('$new_school_id')");

        $URL = "../auth/success.php";
        echo "<script>location.href='$URL'</script>";


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
                   email : '.$email.'<br>
                   Password : '.$new_password.'</b></p>
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

$from ='eSchool Life<no_reply@yelocode.com>';
// Additional headers
$headers = 'From: ' . $from. "\r\n";   
$headers  .= 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

 

 $send = mail($email,$subject,$htmlContent,$headers);


    }
  }
}