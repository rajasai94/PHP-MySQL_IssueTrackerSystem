<?php
require_once('connectivity.php');

function sel_issue_type_filter($issue_type){
	
	global $mysqli;
	
	if (!($stmt = $mysqli->prepare("CALL sel_issue_type_filter(". $issue_type . ")"))) {
		echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
	}

	if (!$stmt->execute()) {
		echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
	}
	return $stmt->get_result();

}

function sel_issue_status_filter($issue_status){
	
	global $mysqli;
	
	if (!($stmt = $mysqli->prepare("CALL sel_issue_status_filter(". $issue_status . ")"))) {
		echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
	}

	if (!$stmt->execute()) {
		echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
	}
	return $stmt->get_result();

}

function sel_issue_du_by_filter($fromdate,$todate){
	
	global $mysqli;
	
	if (!($stmt = $mysqli->prepare("CALL sel_issue_du_by_filter('". $fromdate . "','".$todate."')"))) {
		echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
	}

	if (!$stmt->execute()) {
		echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
	}
	return $stmt->get_result();

}
?>