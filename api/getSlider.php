<?php
include "connect.php";

if($_SERVER['REQUEST_METHOD']=='GET') {

  $query = "SELECT * FROM tb_slider ORDER BY id_slider asc";
  $sql = mysqli_query($connect, $query);

  $result = array(); 
  while($row = mysqli_fetch_array($sql)){
    array_push($result, array(
        	 	 	 	 	 	 	 
    	'id_slider'=>$row['id_slider'], 
    	'gambar_slider'=>$row['gambar_slider']));

  }
  
  echo json_encode($result); 
  mysqli_close($connect); 
}
?>