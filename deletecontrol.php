<?php
	require_once('connectivity.php');
	$id = $_GET['id'];
	$sql = "DELETE FROM issues where id='$id' ";
	if (mysqli_query($mysqli, $sql)) {	
		mysqli_close($mysqli);
		header("location:add-edit.php");
	} else {
		echo "Error: " . $sql . "<br>" . mysqli_error($mysqli);
	}
?> 