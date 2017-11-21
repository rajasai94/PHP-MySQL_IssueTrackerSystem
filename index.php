<?php
    ob_start();
    session_start();
    require 'connectivity.php';
	if(isset($_POST['login'])) { 

		$email = $_POST['user'];
        $pwd = $_POST['pass'];
        $search = mysqli_query($mysqli, "SELECT * FROM `users` WHERE (`UserName`='$email' AND `Password`='$pwd')");			
           
		$count = mysqli_num_rows($search);
		if ($count == 1) {
			$user = mysqli_fetch_assoc($search);
			if ($user) {
				$_SESSION['userID'] = $user['Id'];
				$_SESSION['user'] = $email;
				header("Location:add-edit.php");
			} else {
				$message = "<div class='alert alert-danger'>Please got ADMIN approval before login</div>";
			}
		} else {
			$message = "<div class='alert alert-danger'><a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>Wrong Details, Please enter correct Details</div>";
		}
	}     
?>
<!DOCTYPE html>
<html >
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>login screen</title>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
			
		<!-- Bootstrap -->
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->		
		
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
		<div class="container-fluid" style="text-align:center;">
			<div class="row">
				<div class="col-xs-12" style="font-weight:bolder;padding-top:30px;">
					<img src="Fairfield_University.svg.png" height='70px'/>
				</div>
			</div>
		</div>
		<div style="clear:both"></div>
		<div class="wrapper">
			<div class="container">
				<h1>Welcome</h1>		
				<form class="form" method="post">
					<div class="result-display"><?php echo !empty($message) ? $message : ''; ?></div>
					<input type="text" id="username" name="user" placeholder="Enter Username" />
					<input type="password" name="pass" placeholder="Enter Password" />
					<div class="row">
						<div class="cell">
							<button type="submit" name="login">Login</button>
						</div>
						<div class="cell">
							<a href="forgotPassword.php" class="btn reset-password">Reset Password</a>
						</div>
					</div>
				</form>
			</div>
		</div>
  </body>
</html>
