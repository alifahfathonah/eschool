<?php
// check the user input
//match the username entered and check!
require "../connection/db_connect.php";
require "../auth/check_school.php";
?>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>eSchool Life</title>

    <link href="../landing/css/bootstrap.min.css" rel="stylesheet">
    <link href="../landing/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../landing/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div style="margin-bottom: -36px;">
        <a href="../landing/index.php"  class="btn btn-primary  pull-left"><i class="fa fa-arrow-left"></i></a>
    </div>
    <br><br>
    <div class="sign-up">
        <div>
            <img src="../landing/images/logo-sqr.png" style="width: 150px">
        </div>
        <h3>Welcome to eSchool Life</h3>
        <!-- <p>Login in. To see it in action.</p> -->
        <div class="form-group fg-float">
            <div class="text-danger" id='error-div'></div>
        </div>
        <form action="" method="post">
        <div class="form-group" id="email-error-form-group">
            <input type="text" name="check_me" class="form-control" placeholder="Email or Reg.Number" id="login-email" required="">
        </div>
        <input type="submit" name="btn_check" value="Login" class="btn btn-primary block full-width m-b" id="signin-btn">
        </form>
        <br>
        <div class="text-center">
            <?php echo "<p><strong>Copyright</strong> &copy;" . date("Y") ." ". "eSchool Life". "</p>"; ?>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="../landing/js/jquery-3.1.1.min.js"></script>
<script src="../landing/js/bootstrap.min.js"></script>

</body>
</html>
