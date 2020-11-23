<?php
//get the school info
$check = mysqli_query($con, "select * from auth WHERE email='$user_log'");
while ($rrt = mysqli_fetch_array($check)) {
$school_id = (test_input($rrt['school_id']));
$login_level = $rrt['priv'];
$my_email = $rrt['email'];

}
$checks = mysqli_query($con, "select * from settings WHERE school_id='$school_id'");
while ($get_data = mysqli_fetch_array($checks)) {
$school_logo = test_input($get_data['logo']);
//echo $school_username =$rrt['username'];
}
if($login_level == 1){
include('../inc/nav-admin.php');
}

elseif($login_level == 2){
include('../inc/nav-staff.php');
}

elseif($login_level == 3){
include('../inc/nav-student.php');
}

else{
header('Location:login.php'); // Redirecting To Home Page
}
