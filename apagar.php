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
$dia_ev=$_GET['dia'];
$mes_ev=$_GET['mes'];
$ano_ev=$_GET['ano'];
$id_cliente=$_GET['idc'];
$q_k=$_GET['q_k'];
$e_construtora=$_GET['econst'];

if ($e_construtora=="0") {
    $q_diretorio="mob";
}
if ($e_construtora=="1") {
    $q_diretorio="mob_constr";
}


$new_image_name = "../../sigmacivil/clientes/".$id_cliente."/".$q_diretorio."/".$idpm."_".$dia_ev."_".$mes_ev."_".$ano_ev."_".date("h").date("i").date("sa").".jpg";

echo $new_image_name;

//move_uploaded_file($_FILES["file"]["tmp_name"], $new_image_name);

//header("Location: atualizar_upload.asp?idpm=".$idpm."&d=".$dia_ev."&m=".$mes_ev."&a=".$ano_ev);

?>

</body>
</html>
