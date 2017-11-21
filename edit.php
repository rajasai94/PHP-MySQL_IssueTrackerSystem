<?php
	session_start();
	require_once('connectivity.php');
	$attributes = "";
	
	$id =$_GET['id'];
	$q = "SELECT *, (SELECT CONCAT(FirstName, ' ', LastName) FROM users WHERE id = identified_by ) AS FullName FROM issues where id='$id' ";

	$result=mysqli_query($mysqli, $q);
	
	while($row=mysqli_fetch_array($result))
	{
		$issuetype= $row['issue_type'];
		$issuedescription = $row['issue_description'];
		$issuestatus= $row['issue_status'];
		$fullname =$row['FullName'];
		$identifiedby =$row['identified_by'];
		$identifieddate = $row['identified_date'];
		$priority = $row['priority'];
		$solution =$row['solution'];	
		$filename = $row['filename'];
		$file = explode('/', $filename);
		$attachment = empty($filename) ? "" : "<a href='" . $filename . "' target='_blank'>" . array_pop($file) . "</a>";
	}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>edit issues table</title>

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
		 
		 function ShowFileControl(){
			$('#tbxFileUpload').show();
		 }
	</script>
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
				<a href="add.php"><button type="button" class="btn btn-default" id="add">Add</button> </a> &nbsp; 
				<a href="add-edit.php"><button type="button" class="btn btn-default" id="add">View</button> </a> 
			</div>
			<div class="col-xs-6"> 			
				<a href="logout.php" style="float:right" class="btn btn-default" id="add">Logged in as <?php echo $_SESSION['user']; ?></a>
			</div>
		</div>
		<div class="row" style="background-color:#DF3A3E;">
			<div class="col-xs-12"> 			
				<h2 style="text-align:center;">Update Issues</h2>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top:40px">
		<form id="formid" method="post" action="editcontrol.php" enctype="multipart/form-data">
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
									echo "<option value='" . $result['Id'] . "'" . (($issuetype == $result['Id'])?'selected="selected"':"") . ">" . $result['Name'] . "</option>";
							?>
						</select> 
					</td>
				</tr>			
				<tr><td>Issue Description</td> <td> <textarea class="form-control" name="issuedescription" value="<?php echo $issuedescription; ?>" id="form-control3"><?php echo $issuedescription; ?></textarea> </td>  </tr>
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
									echo "<option value='" . $result['id'] . "'" . (($issuestatus == $result['id']) ? 'selected="selected"' : '') . ">" . $result['shortcode'] . "</option>";
							?>
						</select> 
					</td>
				</tr>
				<tr>
					<td>Identified By</td>
					<td> 
						<input type="text" name="fullname" class="form-control" value="<?php echo $fullname; ?>" id="form-control5" readonly />
					</td>
				</tr>
				<tr><td>identified Date</td> <td><input type="text" name="identifieddate" class="form-control" value="<?php echo $identifieddate; ?>" readonly> </td></tr>
				<tr>
					<td>Priority</td> 
					<td> 
						<select type="text" name="priority" class="form-control" id="form-control7">  
							<?php 
								$arrPriority = array("High", "Medium", "Low");
								for( $i=1;$i<4;$i++)
									echo "<option value='" . $i . "'" . (($i == $priority) ? 'selected="selected"' : '' ) . ">" . $arrPriority[$i - 1] . "</option>";
							?>
						</select>
					</td>  
				</tr>
				<tr><td>Solution</td> <td> <input type="text" name="solution" class="form-control" value="<?php echo $solution; ?>" id="form-control8">  </td>  </tr>	  
				<tr><td>Attachment:</td><td align="left"><?php echo $attachment; ?><div id="btnChangeFile" class="btn btn-default" style="margin-left:25px;" onclick="ShowFileControl();">Change File</div><div id="tbxFileUpload" style="display:none"><input type="file" name="file" /></div></td></tr>
				<tr><td><button type="submit" class="btn btn-primary" onclick="onSubmit();">Update</button></td> <td> <input type="reset" class="btn btn-warning" value="Reset" /></td></tr>
			</table>
			<input id="id" name="id" type="hidden" value="<?php echo $id; ?>"/>
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