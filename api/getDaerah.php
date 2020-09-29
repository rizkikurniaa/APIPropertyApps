<?php
header('Content-Type: application/json');
include "connect.php";
if($_SERVER['REQUEST_METHOD']=='GET') {
    
    $query = "SELECT * FROM tb_daerah ORDER BY nama_daerah ASC";
    $sql = mysqli_query($connect, $query);

  $result = array(); 
  while($row = mysqli_fetch_array($sql)){
    array_push($result, array(
        'id_daerah' => $row['id_daerah'],
        'nama_daerah' => $row['nama_daerah']
    ));
  }
  echo json_encode($result); 
  mysqli_close($connect); 
}
?>