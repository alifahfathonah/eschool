<?php
// check the username and get the school logo
//and place it on the next page
@$check_user = $_POST['check_me'];
@$btn_check = $_POST['btn_check'];

//check on btn click
if($btn_check) {

    $query = mysqli_query($con, "select * from auth where email='$check_user' or reg_num='$check_user'");
    $rows = mysqli_num_rows($query);
    if ($rows == 1) {
      $b_encode =  base64_encode($check_user);
        $URL = "./login.php?auth=$b_encode";
        echo "<script>location.href='$URL'</script>";

    } else {

        echo'<p style="color: red;">reg Number not Found</p>';
    }
}

