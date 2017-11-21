<?php
	session_start();
	require_once('connectivity.php');

	$id= $_POST['id'];
	$issuetype= $_POST['issuetype'];
	$issuedescription = $_POST['issuedescription'];
	$issuestatus= $_POST['issuestatus'];
	$priority = $_POST['priority'];
	$solution =$_POST['solution'];
	$modifiedon = date("Y-m-d");
	$modifiedby = $_SESSION['userID'];
	
	// Handle attachment	
	$filepath= "uploads/";
	$filename = $filepath . basename( $_FILES["file"]["name"]);
	$uploadOk=1;
	
	if (move_uploaded_file($_FILES["file"]["tmp_name"], $filename))
		$sql = " UPDATE issues SET issue_type='$issuetype', issue_description='$issuedescription', issue_status='$issuestatus', priority='$priority', solution='$solution', filename='$filename', modified_on='$modifiedon', modified_by='$modifiedby' WHERE id='$id' ";
	else 
		$sql = " UPDATE issues SET issue_type='$issuetype', issue_description='$issuedescription', issue_status='$issuestatus', priority='$priority', solution='$solution', modified_on='$modifiedon', modified_by='$modifiedby' WHERE id='$id' ";
	
	mysqli_query($mysqli, $sql);
	if (mysqli_query($mysqli, $sql)) {	
		mysqli_close($mysqli);
		header("location:add-edit.php");
	} else {
		echo "Error: " . $sql . "<br>" . mysqli_error($mysqli);
	}
?>