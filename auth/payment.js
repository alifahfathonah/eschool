$("#createScoolForm").on("submit", function (e) {
    e.preventDefault();
    var amount;
    var plane = $('#SchoolPlan option:selected').attr('id');
    var email = $('#login-email').val().trim();
    if (plane == "PremiumPlane") {
        amount = 7000 * 100;
    } else if (plane == "BasicPlane") {
        amount = 500 * 100;
    } else if (plane == "BoundlessPlane") {
        amount = 1792500 * 100;
    }

    var ref = 'eSchoolLife' + Math.floor((Math.random() * 1000000000) + 1);
    var handler = PaystackPop.setup({
        key: 'pk_test_a922172415c6bad5b6ef810347e569714e829898',
        email: email,
        amount: amount,
        ref: ref,
        callback: function (response) {
            $.ajax({
                url: "create_school_script.php?payment=" + response.reference,
                type: "POST",
                data: new FormData(this),
                contentType: false,
                cache: false,
                processData: false,
                success: function (data) {
                    console.log(data);
                    if (data == 'done') {
                        window.location.href = 'check_login.php';
                    } else {
                        //Do something here
                        alert('Error! Try Again.');
                        // window.location.reload();
                    }
                }
            });
        }
    });
    handler.openIframe();


});
