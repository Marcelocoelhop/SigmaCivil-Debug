<!--#include file="incDB_dir_2.asp" -->
<!--#include file="funcoes.asp" -->

<% Response.Charset="ISO-8859-1" %>

<%					
	 jsonstring2=request.form
	' jsonstring2="tx=meutextoação&ipm=345&m=117&a=2015"
	 jsonstring2=replace(jsonstring2,"%3A",":")
	 jsonstring2=replace(jsonstring2,"%22",chr(34))
     jsonstring2=replace(jsonstring2,"%7B","{")
     jsonstring2=replace(jsonstring2,"%7D","}")
     jsonstring2=replace(jsonstring2,"%2C",",")
     jsonstring2=replace(jsonstring2,"%5B","[")
     jsonstring2=replace(jsonstring2,"%5D","]")
 
     pos_tx=4
     pos_ipm=instr(jsonstring2,"&ipm=")+5
     pos_dia=instr(jsonstring2,"&d=")+3
     pos_mes=instr(jsonstring2,"&m=")+3
     pos_ano=instr(jsonstring2,"&a=")+3
     pos_econst=instr(jsonstring2,"&econst=")+8
     pos_cliente=instr(jsonstring2,"&idc=")+5
  
     str_texto=URLDecode(Mid(jsonstring2,pos_tx,pos_ipm-pos_tx-5))
     str_ipm=Mid(jsonstring2,pos_ipm,pos_dia-pos_ipm-3)
     str_dia=Mid(jsonstring2,pos_dia,pos_mes-pos_dia-3)
     str_mes=Mid(jsonstring2,pos_mes,pos_ano-pos_mes-3)
     str_ano=Mid(jsonstring2,pos_ano,pos_econst-pos_ano-8)
     str_econst=Mid(jsonstring2,pos_econst,pos_cliente-pos_econst-5)
     str_cliente=Mid(jsonstring2,pos_cliente)
     
	 if str_econst=0 then
	    aux_econst="mob"
	 end if
	 if str_econst=1 then
	    aux_econst="mob_constr"
	 end if

%>

<%

	dim fs,fname
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	
		set fname=fs.CreateTextFile("e:/home/newdot/web/sigmacivil/clientes/" & str_cliente & "/" & aux_econst & "/" & str_ipm & "_" & str_dia & "_" & str_mes & "_" & str_ano & ".txt",true)
		fname.WriteLine(str_texto)
		fname.Close
		set fname=nothing
		
	set fs=nothing


Set aUx =Server.CreateObject("ADODB.Recordset")
SQL_buscaaUx="Select  tab_eventos.id_evento,tab_eventos.data_programacao   FROM  tab_eventos  WHERE  tab_eventos.id_prog_manut='" & str_ipm & "' ;"
aUx.Open SQL_buscaaUx,conn 

  if Not aUx.EOF then

	aUx.movefirst
	do while Not aUx.EOF 

		q_dia=Right("00" & day(aUx.Fields("data_programacao")),2)
		q_mes=Right("00" & month(aUx.Fields("data_programacao")),2)
		q_ano=year(aUx.Fields("data_programacao"))
		
		if cstr(q_dia)=cstr(str_dia) and cstr(q_mes)=cstr(str_mes) and cstr(q_ano)=cstr(str_ano) then
			func_tem_imagem aUx.Fields("id_evento")
		end if 

	aUx.movenext	
	loop

  end if

aUx.close
Set aUx = Nothing

conn.close   
Set conn = Nothing 

response.write("grav_ok")

%>


<%
FUNCTION URLDecode(str)
'// This function:
'// - decodes any utf-8 encoded characters into unicode characters eg. (%C3%A5 = å)
'// - replaces any plus sign separators with a space character
'//
'// IMPORTANT:
'// Your webpage must use the UTF-8 character set. Easiest method is to use this META tag:
'// <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
'//
    Dim objScript
    Set objScript = Server.CreateObject("ScriptControl")
    objScript.Language = "JavaScript"
    URLDecode = objScript.Eval("decodeURIComponent(""" & str & """.replace(/\+/g,"" ""))")
    Set objScript = NOTHING
END FUNCTION
%>