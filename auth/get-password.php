<!DOCTYPE html>
<html>
<head>
    <?php
    error_reporting("E_ALL");
    require "../connection/db_connect.php";
    include "../inc/header.php";
    include "get_info.php";
        //pass the query
    // require "school_comfirmed_id_login.php";
    ?>

</head>
<body class="gray-bg" style="height:500px;">
<!--comment-->
<div class="middle-box text-center loginscreen animated fadeInDown" style="margin-top:30px;">

    <div style="padding-top: 40px;" class="">
        <center><img src="<?php echo $logo; ?>" class="img-responsive" style="max-height: 170px;"></center>

        <!--                <h1 class="logo-name">S++</h1>-->
    </div>
    <br>
    <?php
 if (isset($_POST['getemail'])) {
     $getemail=$_POST['getemail'];
     $query=mysqli_query($con, "SELECT * FROM auth WHERE email='$getemail' ");
     $query2=mysqli_num_rows($query);
        while($row=mysqli_fetch_array($query)){
            $getpassword=$row['password'];
        }
    $random=rand(72891,92729);
    $new_password=$random;

    //create a copy of the new password//
    $email_password=$new_password;

    $query1=mysqli_query($con, "UPDATE auth SET password='$new_password' WHERE email='$getemail'");

        //
        $subject= "Login information";
        $message= "Your password has been changed to $email_password";
        $from="From: $school_name";
        mail($getemail, $subject, $message, $from);
        if($query2>0)
        {
            echo "<h3 class='text text-success'>Your new Email is sent to your mail</h3>";
        }
        if ($query2<1) {
            echo "<h3 class='text text-danger'>Email does not exist</h3>";
         }
    
 }
 
 

?>
    <div class="hello" style="padding: 0 50px">
        <h3>Reset password</h3>
      
        <div class="form-group fg-float">
            <div class="text-danger" id='error-div'></div>
        </div>
        <form  method="POST" >
        <div class="form-group" id="email-error-form-group">
            <input name="getemail" type="text" class="form-control" placeholder="Email"  required="">
        </div>

        <input type="submit" name="login" value="Submit" class="btn btn-primary block full-width m-b" id="signin-btn">


        </form>
    
        <!-- <a href="#" style="color: #582417"> -->
           
        </a>
        <br><br>

        <br>
        <div class="text-center">
            <?php //echo "<p class='fa-gr'><strong>Copyright</strong> &copy;" . date("Y") ." ". $school_name. "</p>"; ?>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/login.js"></script>

</body>
</html>

