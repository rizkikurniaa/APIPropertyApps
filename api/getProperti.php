<?php
header('Content-Type: application/json');
include "connect.php";

$sort = "DESC";
$per_page = 10; // banyak data perhalaman secara default
$page = 1; // halaman sekarang secara default 
$total = 0; // total data
$banyak_halaman = 0;

$search = "";
  if(!empty($_GET['cari_daerah']))
  {
      $search .= " WHERE p.id_daerah = ".$_GET['cari_daerah'];
  }

if(!empty($_GET['sort']))
{
	$sort = $_GET['sort'];
}

if(!empty($_GET['per_page']))
{
	$per_page = $_GET['per_page'];
}

if(!empty($_GET['page']))
{
	$page = $_GET['page'];
}

$sql_total = mysqli_fetch_assoc(mysqli_query($connect, "SELECT COUNT(*) AS total FROM tb_properti p".$search));
$total = $sql_total['total']; // ambil total data

$banyak_halaman = ceil($total/$per_page);

$sql_data = mysqli_query($connect, 
	"SELECT p.*, d.nama_daerah,
			(SELECT IFNULL(SUM(i.jml_investasi), 0) FROM tb_investasi i WHERE i.id_properti=p.id_properti) AS total_investasi,
			(SELECT IFNULL(COUNT(i.id_investasi), 0) FROM tb_investasi i WHERE i.id_properti=p.id_properti) AS total_investor 
	 FROM 
			tb_properti p INNER JOIN tb_daerah d ON p.id_daerah = d.id_daerah ".$search."
			ORDER BY p.id_properti ".$sort." LIMIT ".$per_page." OFFSET ".(($page - 1) * $per_page));

$data = array();

while($data_tmp = mysqli_fetch_assoc($sql_data))
{
	$data[] = $data_tmp;
}

echo json_encode(array(
	"per_page"	=> $per_page,
	"page"	=> $page,
	"total"	=> $total,
	"total_page" => $banyak_halaman,
	"data"	=> $data
));

/**
	contoh pemanggilan data

	contoh 1 :
	method : GET
	url : data-transaksi.php 
	response : {
		per_page: 10,
		page: 1,
		total: 100,
		data: [
			{},
			{},
			{},
		]
	}

	contoh 2 :
	method : GET
	url : data-transaksi.php?per_page=20
	response : {
		per_page: 20,
		page: 1,
		total: 100,
		data: [
			{},
			{},
			{},
		]
	}


	contoh 3 :
	method : GET
	url : data-transaksi.php?per_page=20&page=5
	response : {
		per_page: 20,
		page: 5,
		total: 100,
		data: [
			{},
			{},
			{},
		]
	}


	contoh 4 :
	method : GET
	url : data-transaksi.php?page=5
	response : {
		per_page: 10,
		page: 5,
		total: 100,
		data: [
			{},
			{},
			{},
		]
	}


**/
?>