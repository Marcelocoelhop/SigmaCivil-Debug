<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.min.css" />
<script type="text/javascript" src="cordova.js"></script>
<script type="text/javascript" src="js/mc.js"/></script>

<script src="js/jquery.js"></script>
<script src="js/jquery.mobile-1.4.5.min.js"></script>

</head>

<body>

<script type="text/javascript">

var num_empree
var logou;


iniciar() ;


/////////////////////////////
function iniciar()
{ 

    var ajax = new XMLHttpRequest();
//    ajax.open("GET","http://www.fidigital.com.br/phonegap/app_sc/consult_emp.asp?l=masmac@ig.com.br&s=msenha&t=1",true);
    ajax.open("GET","http://www.uol.com.br",true);
    ajax.onreadystatechange=function(){
			    alert("readyState:" + ajax.readyState); 
       
	    if(ajax.readyState == 4) {//Request complete !!
			    alert("status:" + ajax.status); 
            if (ajax.status == 200 || ajax.status == 0) { // OK response
			    alert("OKK"); 
				var resposta_total= ajax.responseText;
			    alert(resposta_total); 
			
			}
			else {
			    alert("Problemas com sua conexao internet. Erro: 01 1 "); 
			}
        }
	}
    ajax.send();
}



</script>

</body>
</html>