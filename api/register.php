<?php
	header('Content-Type: application/json');
	include_once "connect.php";
	
	class emp{}
	
    date_default_timezone_set('Asia/Jakarta');
	$email = $_POST['email'];
	$no_telp = $_POST['no_telp'];
	$password = md5($_POST['password']);
	
	$num_rows = mysqli_num_rows(mysqli_query($connect, "SELECT * FROM tb_user WHERE email = '$email'"));
    
    if ($num_rows == 0){		
		
		$query = mysqli_query($connect, "INSERT INTO tb_user (email, no_telp, password) VALUES ('$email', '$no_telp', '$password')");
		
		if ($query){
			$response = new emp();
			$response->success = 1;
			$response->message = "Berhasil mendaftar! Silahkan login...";
			die(json_encode($response));
		} else{ 
			$response = new emp();
			$response->success = 0;
			$response->message = "Terjadi error...";
			die(json_encode($response)); 
		}
	}else{
	    $response = new emp();
    	$response->success = 0;
		$response->message = "Email sudah terdaftar! Gunakan email lain";
		die(json_encode($response));
	}

	mysqli_close($connect);
	
?>	