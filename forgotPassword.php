<?php
	session_start();
	require 'connectivity.php';
	error_reporting(0);
	//Initialize page variables
	$displaySection2 = false;
	$displaySection3 = false;
	$message = "";
	$email = isset($_POST['email']) ? $_POST['email'] : "";
	$answer = isset($_POST['answer']) ? $_POST['answer'] : "";
	$password = isset($_POST['password']) ? $_POST['password'] : "";	
	$repassword = isset($_POST['re_password']) ? $_POST['re_password'] : "";
	
	if($email){
		$results = array();
        try {
            // Connect to the server and select a database
			$conn = GetPDOConnection(); 
			
            // Prepare the SQL statement and execute it
            $sql = "CALL check_user(:email)";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':email', $email, PDO::PARAM_STR);
            $stmt->execute();
			
            // Save the execution results and return value in an array
            while ($row = $stmt->fetch()) {
                array_push($results, $row);
            }			
            $stmt->closeCursor();
	
            if(!empty($results)){
				$displaySection2 = true;
				$securityQuestion = $results[0]['Question'];
				$_SESSION['Answer'] = $results[0]['Answer'];
				$_SESSION['User_Id'] = $results[0]['User_Id'];
			} else {
                $message = "<p style='color:red'>Email Id does not exists</p>";
            }
	
            // Close connections
            $stmt = null;
            $conn = null;
        } catch (PDOException $e) {
			echo 'Connection failed: ' . $e->getMessage();
        }
	}
	else if($answer && $answer == $_SESSION['Answer']) {
		$displaySection3 = true;
	}
	else if($password){
		if( $password === $repassword ){
			$user_id = $_SESSION['User_Id'];
			$update = mysqli_query($mysqli, "UPDATE `users` SET `password`='$password' WHERE `Id`='$user_id'");
			if($update==true){
				header("location:index.php?status=success");
			} else {
				$message = "<div class='alert alert-danger'><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>
							<strong>Warning!</strong> Password updation fail.".$update."</div>";
			}
		} else {
			$message = "<div class='alert alert-danger'><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>
							<strong>Warning!</strong> Your passwords did not match </div>";
			$displaySection3 = true;
		}
	}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>.: Forgot Password :.</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.js"></script>
	<style>
		.row{
			padding: 10px 0px;
		}
		.container-fluid.page-title > .row{
			padding: 10px 0px 0px 0px;
		}
		.container-fluid.page-title > .row:nth-child(2){
			padding:0px 0px 0px 10px;
		}
		h2{
			margin-top: 0px;
		}
		h2,h4{
			color: #fff;
			text-align:center;
		}
	</style>
</head>
<body>	
	<div class="container-fluid" style="text-align:center">
		<div class="row">
			<div class="col-xs-12" style="font-weight:bolder">
				<img src="Fairfield_University.svg.png" height='70px'/>
				<h1> PHP CLASS ASSIGNMENT</h1>
			</div>
		</div>
	</div>
	<div class="container-fluid page-title" style="background-color:#DF3A3E;">		
		<div class="row">
			<div class="col-xs-12"> 			
				&nbsp;
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12"> 			
				<h2>Forgot Password</h2>
			</div>
		</div>
	</div>	  
	<form class="form-horizontal front-form" id="form1" method="post">
		<div class="container" style="margin-top:60px;">			
			<div class="row">
				<div class="col-md-offset-3 col-md-6">
					<label><?php echo $message; ?></label>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<?php 
					if($displaySection2){
				?>				
				<div class="col-md-offset-3 col-md-6" id="securityQuestions">
					<div class="form-group">
						<label>Security Question [Step 2]</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-question-circle"></i> </span>
							<input type="text" class="form-control" value="<?php echo $securityQuestion; ?>" readonly />
						</div>
					</div>
					<div class="form-group">
						<label>Answer</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-adn"></i> </span>
							<input type="text" name="answer" class="form-control answer" required />
						</div>
					</div>
				</div>				
				<?php 
					} else if($displaySection3){
				?>				
				<div class="col-md-offset-3 col-md-6" id="updatePassword">
					<div class="form-group">
						<label>Enter a new Password [Step 3]</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key"></i> </span>
							<input type="password" class="form-control password" name="password" value="" placeholder="Please type new password." required/>
						</div>
					</div>
					<div class="form-group">
						<label>Re-enter Password</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-key"></i> </span>
							<input type="password" class="form-control re_password" name="re_password" value="" placeholder="Please re-enter new password." required/>
						</div>
					</div>
				</div>
				<?php 
					} else {
				?>		
				<div class="col-md-offset-3 col-md-6">
					<div class="form-group">
						<label>Enter your Email : [Step 1]</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<input type="text" class="form-control user_email" placeholder="Please enter Email Id" name="email" value="" required>
						</div>
					</div>
				</div>	
				<?php 
					} 
				?>
				<div class="col-md-offset-3 col-md-6">					
					<div class="col-xs-2 pull-left">
						<input type="submit" class="btn btn-primary" value="Submit"/>
					</div>
					<div class="col-xs-2 pull-right">
						<input type="reset" class="btn btn-warning" />
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>