<?php
require "../connection/db_connect.php";

?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>eSchool Life</title>

    <link href="../landing/css/bootstrap.min.css" rel="stylesheet">
    <link href="../landing/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="../landing/css/animate.css" rel="stylesheet">
    <link href="../landing/css/style.css" rel="stylesheet">
    <link href="../landing/css/style.css" rel="stylesheet">
    <link href="../landing/css/jasny-bootstrap.min.css" rel="stylesheet">


</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
             <img src="../landing/images/logo-sqr.png" style="width: 170px">
        </div>
        <h2>Welcome to eSchool Life</h2>
        <h2>Become an agent.</h2>
        <form action="" method="post" enctype="multipart/form-data">

            <div class="form-group fg-float">
                <div class="text-danger" id='error-div'></div>
            </div>
            <div class="form-group" id="email-error-form-group">
                <input type="text" name="email" class="form-control" placeholder="Email" id="login-email" required="">
            </div>


            </div>
            <input type="submit" name="agent" class="btn btn-primary block full-width m-b" id="" value="Generate">
            <?php
            @$agent = $_POST['agent'];
            @$email = $_POST['email'];
            $ra = rand(12345678,1234567890);
            if($agent){

                $create_agent = mysqli_query($con, "INSERT INTO sales_agents (email,ref_link) VALUES ('$email','$ra') ");


                $from="marketing@eschool.life";

                $headers = 'From: ' . $from . "\r\n";       



                $message = "Your Agent Referal link  \n";

                $link = "link : https://eschool.life/auth/create_school.php?ref=".$ra."\n";

                 $fullmessage=$message.$link;
                // $send_agent_mail =  mail("$email","Referal Details",$fullmessage,$headers);

                echo "http://eschool.life/auth/create_school.php?ref=$ra";
            }
            ?>
    <br>
    <br>
        </form>
        <br>
        <div class="text-center">
            <?php echo "<p><strong>Copyright</strong> &copy;" . date("Y") . " " . "eSchool Life" . "</p>"; ?>
        </div>
    </div>
</div>

<!-- Mainly scripts -->
<script src="../landing/js/jquery-3.1.1.min.js"></script>
<script src="../landing/js/bootstrap.min.js"></script>
<script src="../landing/js/jasny-bootstrap.min.js"></script>
<script src="../landing/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript">
    function checkSize(max_img_size)
    {
        var input = document.getElementById("upload");
        // check for browser support (may need to be modified)
        if(input.files && input.files.length == 1)
        {
            if (input.files[0].size > max_img_size)
            {
                alert("The file must be less than " + (max_img_size/1024/1024) + "MB");
                return false;
            }
        }

        return true;
    }
</script>

</body>
</html>
