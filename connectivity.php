<?php 
    define("server_name", "localhost");
	define("db_name", "issue_tracker");
	define("user_name", "sw516_agent");
	define("db_pswd", "sw516_agent-1");
    $mysqli = mysqli_connect(server_name, user_name, db_pswd, db_name);
	
    if (!$mysqli) {
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
        exit;
    }
	
    if (!function_exists("dateForm2DB")) {
        function dateForm2DB($frm_date)
        {
            $frm_date = explode("/", $frm_date);
            if (!empty($frm_date[0]) && !empty($frm_date[1]) && !empty($frm_date[2])) {
                return $frm_date[2] . "-" . $frm_date[1] . "-" . $frm_date[0];
            } else {
                return "";
            }
        }
    }
	
	function GetPDOConnection(){	
		$dns = 'mysql:dbname='.db_name.';host='.server_name;
		$username = user_name;
		$password = db_pswd; 		
		
		try {
			$conn = new PDO($dns,$username,$password);
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch(PDOException $e){
			echo "Connection failed: " . $e->getMessage();
			return null;
		}
		
		return $conn;
	}
	
	function ClosePDOConnection($conn){
		$conn = null;
	}		
?>