<?php
require 'connectivity.php';
require_once("UserController.php");
$uc = new UserController();
$email = !empty($_POST['email']) ? $_POST['email'] : "";
$answer = !empty($_POST['answer']) ? $_POST['answer'] : "";
if(!empty($email)){
    $uc->Check_User($email);
}
if(!empty($answer)){ ?>
    <div class="col-md-12" id="updatePassword">
        <div class="form-group" ><label>Enter a new Password [Step 3] </label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-key"></i> </span>
                <input type="password" class="form-control password" name="password" value="" placeholder="Please type new password." required/>
            </div>
        </div>
        <div class="form-group" ><label>Re-enter Password </label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-key"></i> </span>
                <input type="password" class="form-control re_password" name="re_password" value="" placeholder="Please re-enter new password." required/>
            </div>
        </div>
    </div>
    <div id="result"></div>


<?php }
?>
<script>
    $(document).ready(function () {
        $(".answer").focusout(function () {
            var answer = $(this).val();
            var answer_main = $(".answer_main").val();
            if(answer==answer_main){
                $.ajax({
                    url: "ajaxController.php",
                    type: "POST",
                    data: {answer: answer},
                    success: function (data) {
                        $("#step-3").html(data);
                    }
                })
            }else{
                $("#step-3").html("<p style='color:red'>Your Answer is not Matched</p>");
            }
        })
        $(".re_password,.password").focusout(function () {
            var password = $(".password").val();
            var re_pass = $(".re_password").val();
            if(password!=re_pass){
                $("#result").html("<p style='color:red'>Password does not matched. Please try again!</p>");
            }else{
                $("#result").html('<button class="btn btn-primary " type="submit" name="signin">Update Password</button>');
            }
        })
    })
</script>
