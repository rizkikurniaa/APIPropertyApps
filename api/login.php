<?php
header('Content-Type: application/json');
include "connect.php";
require_once "vendor/autoload.php";
require_once "jwt-helper.php";
require_once "jwt-config.php";
	
if($_SERVER['REQUEST_METHOD'] == "POST")
	{	
	class usr{}
	
	$email = mysqli_real_escape_string($connect, $_POST["email"]);
	$password = mysqli_real_escape_string($connect, md5($_POST["password"]));		
	
	if ((empty($email)) || (empty($password))) { 
		$response = new usr();
		$response->success = 0;
		$response->token = "-";
		$response->message = "Kolom tidak boleh kosong"; 
		die(json_encode($response));
	}
	
	$query = mysqli_query($connect,"SELECT * FROM tb_user WHERE email='$email' AND password='$password'");
	
	$row = mysqli_fetch_array($query);
	
	if (!empty($row)){
		$data_token = array(
    	        "id_user" => $row['id_user']
            );
           
        $token = $jwt->BuatToken($data_token);

		$response = new usr();
		$response->success = 1;
		$response->token = $token;
		$response->message = "Berhasil masuk!";
		die(json_encode($response));
		
	} else { 
		$response = new usr();
		$response->success = 0;
		$response->token = "-";
		$response->message = "Cek kembali email/password";
		die(json_encode($response));
	}

} else {
	    echo json_encode(array("error" => false, "message" => "Method not allowed!"));
		}
	
mysqli_close();
?>