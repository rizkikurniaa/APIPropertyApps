<?php
header('Content-Type: application/json');
require "vendor/autoload.php";
require_once "jwt-helper.php";
require_once "jwt-config.php";

// PERTAMA, KITA AMBIL DULU TOKENNYA DARI HEADER
$header = apache_request_headers();
$token = $header["Authorization"] ?? $_GET['token'];


// KEDUA, PROSES PENGECEKAN KEBERADAAN TOKEN
$data = $jwt->BacaToken($token);
$_DATA = array();
if($data['error'] == true)
{
    echo json_encode($data);
    exit;
}
else
{
    $_DATA['id_user'] = $data['data']->id_user;
}

?>
