<!--#include file="incDB_dir_2.asp" -->
<!--#include file="funcoes.asp" -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
idpm=request.querystring("idpm")
d=Right("00" & request.querystring("d") ,2)
m=Right("00" & request.querystring("m") ,2)
a=request.querystring("a")

Set aUx =Server.CreateObject("ADODB.Recordset")
SQL_buscaaUx="Select  tab_eventos.id_evento,tab_eventos.data_programacao   FROM  tab_eventos  WHERE  tab_eventos.id_prog_manut='" & idpm & "' ;"
aUx.Open SQL_buscaaUx,conn 

  if Not aUx.EOF then

	aUx.movefirst
	do while Not aUx.EOF 

		q_dia=Right("00" & day(aUx.Fields("data_programacao")),2)
		q_mes=Right("00" & month(aUx.Fields("data_programacao")),2)
		q_ano=year(aUx.Fields("data_programacao"))
		
		if cstr(q_dia)=cstr(d) and cstr(q_mes)=cstr(m) and cstr(q_ano)=cstr(a) then
			func_tem_imagem aUx.Fields("id_evento")
		end if 

	aUx.movenext	
	loop

  end if

aUx.close
Set aUx = Nothing

conn.close   
Set conn = Nothing 

%>

</body>
</html>
