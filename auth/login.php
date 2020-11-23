<!DOCTYPE html>
<html>
<head>
    <?php
        error_reporting("E_ALL");
        require "../connection/db_connect.php";

        //use the details to update get page theme
        $school_mail = @$check_user = base64_decode($_GET['auth']);
        $checks = mysqli_query($con, "SELECT school_id FROM auth WHERE email='$school_mail'");
        while ($get_data = mysqli_fetch_array($checks)) {
            $school_id1 = $get_data['school_id'];
            $check_theme = mysqli_query($con, "SELECT theme FROM settings WHERE school_id='$school_id1'");
            while($get_theme = mysqli_fetch_array($check_theme)){
                $s_theme = ($get_theme['theme']);  
            }
        }
        include "../inc/header.php";
        include "get_info.php";
            //pass the query
        require "school_comfirmed_id_login.php";
    ?>
</head>
<body class="gray-bg">
<!--comment-->
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <a href="../landing/index.php"  class="btn btn-primary  pull-left"><i class="fa fa-arrow-left"></i></a>
    </div>
    <br>
    <div style="padding-top: 40px;" class="">
        <center><img src="<?php echo $logo; ?>" class="img-responsive" style="max-height: 170px;"></center>
        <!--<h1 class="logo-name">S++</h1>-->
    </div>
    <br>
    <div class="hello" style="padding: 0 50px">
        <h3>Welcome to <?php echo $school_name; ?></h3>
        <!-- <p>Login in. To see it in action.</p> -->
        <div class="form-group fg-float">
            <div class="text-danger" id='error-div'></div>
        </div>
        <form action="" method="post">
        <div class="form-group" id="email-error-form-group">
            <input name="email" type="text" value="<?php echo @$check_user = base64_decode($_GET['auth']); ?>" class="form-control" placeholder="Email or Reg.Number" id="login-email" required="">
        </div>
        <div class="form-group" id="password-error-form-group">
            <input name="password" type="password" class="form-control" id="login-password" placeholder="Password" required="">
        </div>

        <input type="submit" name="login" value="Login" class="btn btn-primary block full-width m-b" id="signin-btn">

        <a type="submit" class="btn btn-primary block full-width m-b middle" href="get-password.php">Get password</a>
        </form>
        <a href="../admin/admission/admission_email.php?link=<?php echo base64_encode($school_id)?>" style="color: #582417">
            <small>Forgot password?</small>
        </a>
        <br><br>
        <a class="btn btn-sm btn-warning btn-block" href="../admin/admission/admission_email.php?link=<?php echo base64_encode($school_id)?>">Apply for Admission</a>
        <br>
        <div class="text-center">
            <?php //echo "<p class='fa-gr'><strong>Copyright</strong> &copy;" . date("Y") ." ". $school_name. "</p>"; ?>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/login.js"></script>

</body>
</html>
