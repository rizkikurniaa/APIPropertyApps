<?php
header('Content-Type: application/json');
require_once "jwt-auth.php";
include "connect.php";

if($_SERVER['REQUEST_METHOD']=='POST') {
    
    $id_user = $_DATA['id_user'];

    $per_page = 25; // banyak data perhalaman secara default
    $page = 1; // halaman sekarang secara default 
    $total = 0; // total data
    $banyak_halaman = 0;

    if(!empty($_GET['per_page']))
    {
        $per_page = $_GET['per_page'];
    }

    if(!empty($_GET['page']))
    {
        $page = $_GET['page'];
    }

    $sql_total = mysqli_fetch_assoc(mysqli_query($connect, "SELECT COUNT(*) AS total FROM tb_notifikasi WHERE id_user = '$id_user' OR id_user = '0'"));
    
    $total = $sql_total['total']; // ambil total data

    $banyak_halaman = ceil($total/$per_page);

    $query = "SELECT * FROM tb_notifikasi WHERE id_user = '$id_user' OR id_user = '0' ORDER BY tgl DESC, waktu DESC";

    $sql = mysqli_query($connect, $query);

    $data = array();

    while($data_tmp = mysqli_fetch_assoc($sql))
    {
        $data[] = $data_tmp;
    }

    echo json_encode(array(
        "per_page"  => $per_page,
        "page"  => $page,
        "total" => $total,
        "total_page" => $banyak_halaman,
        "data"  => $data
    ));
        
}
?>
