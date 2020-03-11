<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<?php
print_r($_FILES);
$idpm=$_GET['idpm'];
$mes_ev=$_GET['mes'];
$ano_ev=$_GET['ano'];
$id_cliente=$_GET['idc'];

$new_image_name = "../../sigmacivil/clientes/".$id_cliente."/mob/".$idpm."_".$mes_ev."_".$ano_ev.".txt";

//echo $new_image_name;

move_uploaded_file($_FILES["file"]["tmp_name"], $new_image_name);
?>

</body>
</html>
