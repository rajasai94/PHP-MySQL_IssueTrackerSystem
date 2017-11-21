<?php
	session_start();
	require_once('connectivity.php');

	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		$issuetype= ISSET($_POST['issuetype']) ? $_POST['issuetype'] : 0;
		$issuedescription = ISSET($_POST['issuedescription']) ? $_POST['issuedescription'] : "";
		$issuestatus= ISSET($_POST['issuestatus']) ? $_POST['issuestatus'] : 0;
		$identifiedby = $_SESSION['userID'];
		$identifieddate = ISSET($_POST['identifieddate']) ? $_POST['identifieddate'] : date("Y-m-d");
		$priority = ISSET($_POST['priority']) ? $_POST['priority'] : 0;
		$solution = ISSET($_POST['solution']) ? $_POST['solution'] : "";
		$createdon = date("Y-m-d");
		$createdby = $_SESSION['userID'];
		$modifiedon = date("Y-m-d");
		$modifiedby = $_SESSION['userID'];
		$sql = "insert into issues(issue_type,issue_description,issue_status,identified_by,identified_date,priority,solution,filename,created_on,created_by,modified_on,modified_by) VALUES ('$issuetype','$issuedescription','$issuestatus','$identifiedby','$identifieddate','$priority','$solution','','$createdon','$createdby','$modifiedon','$modifiedby')";
		
		// Handle attachment
		if(ISSET($_FILES["file"])){
			$filepath= "uploads/";
			$filename = $filepath . basename( $_FILES["file"]["name"]);
			$uploadOk=1;
			
			if (move_uploaded_file($_FILES["file"]["tmp_name"], $filename))
				$sql = "insert into issues(issue_type,issue_description,issue_status,identified_by,identified_date,priority,solution,filename,created_on,created_by,modified_on,modified_by) VALUES ('$issuetype','$issuedescription','$issuestatus','$identifiedby','$identifieddate','$priority','$solution','$filename','$createdon','$createdby','$modifiedon','$modifiedby')";
		}	
		
		if (mysqli_query($mysqli, $sql)) {
			mysqli_close($mysqli);
			header("location:add-edit.php");
		} else {
			echo "Error: " . $sql . "<br>" . mysqli_error($mysqli);
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>add /edit issues table</title>

	 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
			$( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
		} );
	</script>
	
    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

	<!--	  code for validation-->
	<script type="text/javascript">
		 function onSubmit(){
		 
		 if(document.getElementById("form-control2").value== "")
		 {
		 	document.getElementById("demo").value="Enter valid type ";
			 
		 
		 }
		 else if(document.getElementById("form-control3").value== "")
		 {
		 	document.getElementById("demo").value="Enter valid value  ";
			 
		 
		 }
			 
			 else if(document.getElementById("form-control4").value== "")
		 {
		 	document.getElementById("demo").value="Enter valid value  ";
			 
		 
		 }
			 else if(document.getElementById("form-control5").value== "")
		 {
		 	document.getElementById("demo").value="Enter valid value  ";
			 
		 
		 }
			 
			 else if(document.getElementById("form-control6").value== "")
		 {
		 	document.getElementById("demo").value="Enter valid value  ";
			 
		 
		 }
			 else if(document.getElementById("form-control7").value== "")
		 {
		 	document.getElementById("demo").value="Enter valid value  ";
			 
		 
		 }		
			 else {
			 
				 document.getElementById("formid").submit();
			 
			 }
		 
		 
		 }
	</script>
	<!--	  end code -->
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
		<style type="text/css">
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
			<div class="col-xs-6" style="text-align:left;"> 				    
				<a href="add-edit.php"><button type="button" class="btn btn-default" id="add">View</button> </a> 
			</div>
			<div class="col-xs-6"> 			
				<a href="logout.php" style="float:right" class="btn btn-default" id="add">Logged in as <?php echo $_SESSION['user']; ?></a>
			</div>
		</div>
		<div class="row" style="background-color:#DF3A3E;">
			<div class="col-xs-12"> 			
				<h2 style="text-align:center;">Add Issue</h2>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top:40px">
		<form id="formid" method="post" action="add.php" enctype="multipart/form-data">
		  	<table class="table table-bordered">
				<tr>
					<td>Issue Type</td> 
					<td>
						<select class="form-control" name="issuetype" id="form-control2">
							<?php
								$conn = GetPDOConnection();
								$stmt = $conn->prepare("CALL sel_issue_type(?)");
								$stmt->bindValue(1, 0, PDO::PARAM_INT);
								$rs = $stmt->execute();
								$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
								ClosePDOConnection($conn);
								foreach($results as $result)
									echo "<option value='" . $result['Id'] . "'>" . $result['Name'] . "</option>";
							?>
						</select> 
					</td>
				</tr>		
				<tr><td>Issue Description</td> <td> <textarea class="form-control" name="issuedescription" id="form-control3"></textarea> </td>  </tr>
				<tr>
					<td>Issue Status</td>
					<td>
						<select class="form-control" name="issuestatus" id="form-control2">
							<?php
								$conn = GetPDOConnection();
								$stmt = $conn->prepare("CALL sel_issue_status(?)");
								$stmt->bindValue(1, 0, PDO::PARAM_INT);
								$rs = $stmt->execute();
								$results = $stmt->fetchAll(PDO::FETCH_ASSOC);
								ClosePDOConnection($conn);
								foreach($results as $result)
									echo "<option value='" . $result['id'] . "'>" . $result['shortcode'] . "</option>";
							?>
						</select> 
					</td>
				</tr>
				<tr>
					<td> Identified By</td>
					<td>
						<?php							
							$q = "SELECT CONCAT(FirstName, ' ', LastName) as FullName FROM users WHERE id =" . $_SESSION['userID'];
							$result=mysqli_query($mysqli, $q);							
							while($row=mysqli_fetch_array($result))
								$fullname = $row['FullName'];
							
						?>
						<input type="text" name="fullname" class="form-control" id="form-control5" value='<?php echo $fullname; ?>' readonly /> 
					</td>
				</tr>
				<tr><td>identified Date</td> <td><input type="text" name="identifieddate" class="form-control" id="datepicker"> </td></tr>
				<tr>
					<td>Priority</td> 
					<td> 
						<select type="text" name="priority" class="form-control" id="form-control7">  
							<?php 
								$arrPriority = array("High", "Medium", "Low");
								for( $i=1;$i<4;$i++)
									echo "<option value='" . $i . "'>" . $arrPriority[$i - 1] . "</option>";
							?>
						</select>
					</td>  
				</tr>
				<tr><td>Solution</td> <td> <input type="text" name="solution" class="form-control" id="form-control8">  </td>  </tr>
				<tr><td>Attachment:</td><td><input type="file" name="file"></td></tr>
				<tr><td><button type="submit" class="btn btn-primary" onclick="onSubmit();">Submit</button></td> <td> <input type="reset" class="btn btn-warning" value="Reset"></td></tr>
			</table>
		</form>
	</div>
	<div class="container-fluid" style="height:50px;background-color:#DF3A3E;text-align:center;">	
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<div class="col-xs-12"> 
			<h4>Created By Rakesh Katkuri and Sudheer </h4>
		</div>
	</div>	
  </body>
</html>