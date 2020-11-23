<?php

//get the user reg_number
$check_user = base64_decode($_GET['auth']);
$get_info = mysqli_query($con,"select * from auth WHERE email='$check_user'");
while ($all_info = mysqli_fetch_array($get_info)){
    $school_id = $all_info['school_id'];

    $get_info = mysqli_query($con,"select * from settings WHERE school_id='$school_id'");
    while ($all_info = mysqli_fetch_array($get_info)) {
        $school_name = $all_info['school_name'];
        $logo = $all_info['logo'];

    }
}