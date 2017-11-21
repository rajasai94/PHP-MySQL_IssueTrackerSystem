<?php
	session_start();
	require_once('func.php');
	require_once('connectivity.php');
    require_once('UserController.php');

    $userController = new UserController();
    $isEdit = $userController->isUserEdit($_SESSION['userID']);

	$stmt = '';
	$standard_statement = 	"SELECT 
								id,
								(SELECT it.Name FROM issue_type it WHERE it.Id = i.issue_type) as issue_type, 
								issue_description, 
								(SELECT ist.shortcode FROM issue_status ist WHERE ist.Id = i.issue_status) as issue_status,
								(SELECT CONCAT(u.FirstName, ' ', u.LastName) FROM users u WHERE u.id = i.identified_by) as identified_by,
								identified_date,
								CASE 
									WHEN priority = 3 THEN 'High'
									WHEN priority = 2 THEN 'Medium'
									WHEN priority = 1 THEN 'Low'
								END AS priority,
								solution,
								filename,
								created_on,
								created_by,
								modified_on,
								modified_by 
							FROM 
								issues i"; 
	$field='id';
	$sort='ASC';
	
	if(isset($_GET['sorting']))
	{
		if($_GET['sorting']=='DESC')
		{
			$sort='ASC';
		}
		else
		{
			$sort='DESC';
		}
	
		if($_GET['field']=='id')
		{
		   @$field = "id"; 
		}
		elseif($_GET['field']=='issue_type')
		{
		   @$field = "issue_type";
		}
		elseif($_GET['field']=='issue_description')
		{
		   @$field="issue_description";
		}
		elseif($_GET['field']=='issue_status')
		{
		   @$field="issue_status";
		}
		elseif($_GET['field']='identified_by')
		{
		   @$field="identified_by";
		}
		elseif($_GET['field']=='identified_date')
		{
		   @$field="identified_date";
		}
		elseif($_GET['field']=='priority')
		{
		   @$field="priority";
		}
		elseif($_GET['field']=='solution')
		{
		   @$field="solution";
		}
		elseif($_GET['field']=='attachment')
		{
		   @$field="filename";
		}
		$stmt = "SELECT 
					id,
					(SELECT it.Name FROM issue_type it WHERE it.Id = i.issue_type) as issue_type, 
					issue_description, 
					(SELECT ist.shortcode FROM issue_status ist WHERE ist.Id = i.issue_status) as issue_status,
					(SELECT CONCAT(u.FirstName, ' ', u.LastName) FROM users u WHERE u.id = i.identified_by) as identified_by,
					identified_date,
					CASE 
						WHEN priority = 3 THEN 'High'
						WHEN priority = 2 THEN 'Medium'
						WHEN priority = 1 THEN 'Low'
					END AS priority,
					solution,
					filename,
					created_on,
					created_by,
					modified_on,
					modified_by 
				FROM 
					issues i 
				ORDER BY 
					$field $sort";
		$stmt = mysqli_query($mysqli, $stmt);
	}
	elseif(!empty($_POST['fromdate']) && !empty($_POST['todate'])){	
		$fromdate = date("Y-m-d", strtotime($_POST['fromdate']));
		$todate = date("Y-m-d", strtotime($_POST['todate']));
		if (!$fromdate || !$todate) {
			$stmt = $standard_statement;
			$stmt = mysqli_query($mysqli, $stmt);		
		}
		$stmt = sel_issue_du_by_filter($fromdate,$todate);
	}elseif(!empty($_POST['issuetype'])){
		$issuetype	= $_POST['issuetype'];
		if (!$issuetype) {
			$stmt = $standard_statement;
			$stmt = mysqli_query($mysqli, $stmt);
		}else{
			$stmt = sel_issue_type_filter($issuetype);
		}
		
	}elseif(!empty($_POST['issuestatus'])){
		$issuestatus	= $_POST['issuestatus'];
		if (!$issuestatus) {
			$stmt = $standard_statement;
			$stmt = mysqli_query($mysqli, $stmt);
		}
		$stmt = sel_issue_status_filter($issuestatus);
	}else{
		$stmt = $standard_statement;
		$stmt = mysqli_query($mysqli, $stmt);
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
				$( "#toDate" ).datepicker({ dateFormat: 'yy-mm-dd' });
				$( "#fromDate" ).datepicker({ dateFormat: 'yy-mm-dd' });
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
			.table > tbody > tr.info > th{
				background-color: #eee;
				text-align: center;
			}
			.table > tbody > tr.info > th a{				
				color: #555;
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
					<a href="logout.php" style="float:right" class="btn btn-default" id="add">Logged in as <?php echo $_SESSION['user']; ?></a>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12"> 			
					<h2 style="text-align:center;">Display Issues</h2>
				</div>
			</div>
		</div>	  
		<div class="container-fluid" style="margin-top:20px;">				
			<div class="row">
				<div class="col-xs-2">			  
                    <?php
                        if (!$isEdit)
                        {
                            $disabledStr = "disabled";
                        } else
                        {
                            $disabledStr = "";
                        }

                    ?>
                    <a href="add.php" class="btn btn-success <?php echo $disabledStr; ?>" id="add">Add Issue</a>
				</div>
				<div class="col-xs-10">
					<form id="frmFilter" method="post" class="form-inline pull-right" action="add-edit.php">
						<div class="form-group">
							<label for="fromdate">From Date:</label>
							<input type="date" name="fromdate" class="form-control" id="fromDate" />
						</div>
						<div class="form-group">
							<label for="todate">To Date:</label>
							<input type="date" name="todate" class="form-control" id="toDate" />
						</div>
						<div class="form-group">
							<label for="issueFilter">Status:</label>
							<select name="issuestatus" class="form-control" id="issueFilter">
								<option value="">Issue status</option>
								<option value="1">Fatal</option>
								<option value="3">Critical</option>
								<option value="4">Moderate</option>								
								<option value="5">Enhancement</option>								
								<option value="6">Minor</option>
								<option value="7">Resolved</option>
							</select>
						</div>
						<div class="form-group">
							<label for="typeFilter">Type:</label>
							<select name="issuetype" class="form-control" id="typeFilter">
								<option value="">Issue Type</option>
								<option value="1">Database</option>
								<option value="2">PHP</option>
								<option value="3">Web Page</option>
								<option value="4">Server</option>
								<option value="5">Network</option>
							</select>
						</div>
						<div class="form-group"> 
							<div class="col-sm-12">
								<input type="submit" class="btn btn-primary" value="Submit" />
							</div>
						</div>
					</form>
				</div>							
			</div>
		</div>	  
		<div class="container-fluid" style="text-align:center;">			
			<!-- Display the available  table data here-->
			<table class="table table-bordered">
				<tr class="info">
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=issue_type">Issue Type</a></th>
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=issue_description">Description</a></th>
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=issue_status">Issue Status</a></th>
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=identified_by">Identified By</a></th>
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=identified_date">Identified Date</a></th>
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=priority">Priority</a></th>
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=solution">Solution</a></th>
					<th><a href="add-edit.php?sorting=<?php echo $sort; ?>&field=attachment">Attachment</a></th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>			
				<?php
					while ($row = $stmt->fetch_assoc())
					{	
						$id=$row['id'];	
						$file = isset($row['filename']) ? explode('/', $row['filename']) : "";
						$attachment = empty($row['filename']) ? "" : "<a href='" . $row['filename'] . "' target='_blank'>" . array_pop($file) . "</a>";
						echo "<td>".$row['issue_type']."</td>";
						echo "<td>".$row['issue_description']."</td>";
						echo "<td>".$row['issue_status']."</td>";
						echo "<td>".$row['identified_by']."</td>";
						echo "<td>".$row['identified_date']."</td>";
						echo "<td>".$row['priority']."</td>";
						echo "<td>".$row['solution']."</td>";
						echo "<td>".$attachment."</td>";
                        if (!$isEdit)
                        {

                            $disabledStr = "disabled";
                        } else
                        {
                            $disabledStr = "";
                        }

                        echo "<td> <a href='edit.php?id=$id' class='btn btn-warning {$disabledStr}' role='button'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> Edit</a></td>";
                        echo "<td> <a href='deletecontrol.php?id=$id' class='btn btn-danger {$disabledStr}' role='button'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Delete</a></td>";

						echo "</tr>";
					}
				?>
			</table>
		</div>
		<div class="container-fluid" style="height:50px;background-color:#DF3A3E;text-align:center;">	
			<!-- Include all compiled plugins (below), or include individual files as needed -->
			<div class="col-xs-12"> 
				<h4>Created By Rakesh Katkuri and Sudheer </h4>
			</div>
		</div>	
	</body>
</html>