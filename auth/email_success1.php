<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>eSchool Life</title>
    <style>
        body {
            font-family: " ", "Helvetica Neue", Helvetica, Ariel, sans-serif;
            font-size: 13px;
            color: #676a6c;
            overflow-x: hidden;
        }
        p {
            display: block;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
        }

        .gray-bg, .bg-muted {
            background-color: #f3f3f4;
        }
        .middle-box-b {
            max-width: 380px;
            z-index: 100;
            margin: 0 auto;
            padding-top: 40px;
        }
        .widget {
            padding: 15px 20px;
            margin-bottom: 10px;
            margin-top: 10px;
            box-shadow: 0px 1px 3px #cccccc;
        }
        .text-info {
            color: #23c6c8;
        }
        h3 {
            font-size: 16px;
        }
        .btn-primary{
            background-color: #1ab394;
            border-color: #1ab394;
            color: #FFFFFF;
            font-size: 13px;
            padding: 8px;
            font-weight: 600;
            border-radius: 4px;
        }
        .btn-primary:hover,
        .btn-primary:focus,
        .btn-primary:active,
        .btn-primary.active,
        .open .dropdown-toggle.btn-primary,
        .btn-primary:active:focus,
        .btn-primary:active:hover,
        .btn-primary.active:hover,
        .btn-primary.active:focus {
        background-color: #18a689;
        border-color: #18a689;
        color: #FFFFFF;
        cursor: pointer;
        outline: none;
        }
        .block{
            display: block;
        }
        .full-width{
            width: 100% !important;
        }
    </style>
</head>

<body class="gray-bg">

<div class="middle-box-b">
    <center>
        <div class="widget" style="background: white;">
                <div>
                    <img src="../landing/images/logo.png" height="70">
                </div>
                <h3 class="text text-info" style="margin-bottom: 20px">Welcome to eSchool Life</h3>
                <p>You have successfully signed up with <em class="text text-info">ESchool Life</em> check you email for confirmation link</p>
                <div class="form-group fg-float">
                    <div class="text-danger" id='error-div'></div>
                </div>
                <form action="" method="post">
                <input type="submit" name="btn_check" value="Login" class="btn btn-primary block full-width m-b" id="signin-btn">
                </form>
                <br>
                <div class="text-center">
                    <p><strong>Copyright</strong> &copy; <i id="today_d"></i> eSchool Life </p>
                </div>
            </div>
    </center>
</div>
<script>
        var d = new Date();
        y = d.getFullYear();
        document.getElementById("today_d").innerHTML = y;
    </script>
</body>
</html>
