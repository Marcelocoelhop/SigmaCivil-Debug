<% Response.Charset="ISO-8859-1" %>
<!--#include file="incDB_dir_2.asp" -->

<%					
 
login=request.querystring("l")
senha=request.querystring("s")

quallogin=Replace(login,"'","")
quallogin=Replace(quallogin,chr(34),"")

qualsenha=Replace(senha,"'","")
qualsenha=Replace(qualsenha,chr(34),"")
qualsenha=Replace(qualsenha,"=","")
qualsenha=cStr(qualsenha)
	 
logar=0


Set cLi =Server.CreateObject("ADODB.Recordset")
SQL_busca2="Select tab_proprietario.id_prop FROM tab_proprietario WHERE email='" & quallogin & "' AND senha='" & qualsenha & "';" 
cLi.Open SQL_busca2,conn 

	  if Not cLi.EOF then
			id_prop=cLi.Fields("id_prop")
			logar=logar+1
	  end if

cLi.close
Set cLi = Nothing


Set cLi2 =Server.CreateObject("ADODB.Recordset")
SQL_busca23="Select tab_etu_detal.id_etu,tab_etu_detal.bloqueio_uni FROM tab_etu_detal WHERE id_prop='" & id_prop & "';" 
cLi2.Open SQL_busca23,conn 

  if Not cLi2.EOF then
		id_etu=cLi2.Fields("id_etu")
		bloqueio_uni=cLi2.Fields("bloqueio_uni")
	    logar=logar+1
  end if

cLi2.close
Set cLi2 = Nothing


Set cLi =Server.CreateObject("ADODB.Recordset")
SQL_busca2="Select tab_empree_torre_unid.id_empree,tab_empree_torre_unid.torre,tab_empree_torre_unid.unidade FROM tab_empree_torre_unid WHERE id_etu='" & id_etu & "';" 
cLi.Open SQL_busca2,conn 

	  if Not cLi.EOF then
			id_empree=cLi.Fields("id_empree")
  			torre=cLi.Fields("torre")
			unidade=cLi.Fields("unidade")
			logar=logar+1
	  end if

cLi.close
Set cLi = Nothing


' dados do empree ''''''''''''''''''''''''''''''
Set cLi =Server.CreateObject("ADODB.Recordset")
SQL_busca2="Select * FROM tab_empree WHERE id_empree='" & id_empree & "';" 
cLi.Open SQL_busca2,conn 

	  if Not cLi.EOF then
			id_cliente=cLi.Fields("id_cliente")
			nome_empree=cLi.Fields("nome_empree")
			data_implantacao_sc=cLi.Fields("data_implantacao_sc")
			bloq_empree=cLi.Fields("bloqueio")						
			status_sync_APP=cLi.Fields("status_sync_APP")						
			logar=logar+1
	  end if

cLi.close
Set cLi = Nothing
'''''''''''''''''''''''''''''''''''''''''''''''' 


if torre="Área comum" then 
  e_construtora=0
end if
if torre="Construtora" then 
  e_construtora=1
end if


%>      


<%
if logar=4 and bloq_empree<>1 and bloqueio_uni<>1 then
	 
	 session("etu")=id_etu	 
     encontrou="S"
	 resp=""
     resp=resp  & "{" & chr(34) & "logou" & chr(34) & ":" & chr(34) & encontrou & chr(34) & "," & chr(34) & "id_cliente" & chr(34) & ":" & chr(34) & id_cliente & chr(34) & "," & chr(34) & "id_empree" & chr(34) & ":" & chr(34) & id_empree & chr(34) & "," & chr(34) & "nome_empree" & chr(34) & ":" & chr(34) & nome_empree & chr(34) & "," & chr(34) & "e_construtora" & chr(34) & ":" & chr(34) & e_construtora & chr(34) & "," & chr(34) & "data_implantacao_sc" & chr(34) & ":" & chr(34) & formata_data3(data_implantacao_sc) & chr(34) & "," & chr(34) & "status_sync" & chr(34) & ":" & chr(34) & status_sync_APP & chr(34) & " }"

	 if id_cliente<>"" then
	 
		 temp1="{" & chr(34) & "dados_empreendimento" & chr(34) & ":[ "
		 Set eMp =Server.CreateObject("ADODB.Recordset")  
		 SQL_busca1="SELECT tab_programa_manut.id_prog_manut,tab_programa_manut.id_sistema,tab_sistemas.nome_sistema,tab_atividades.nome_atividade,tab_periodicidade.nome_periodicidade,tab_programa_manut.qtde_agrupamentos_eventos,tab_periodicidade.qtde_dias_periodicidade,tab_programa_manut.data_inicial_garantia,tab_periodicidade.formato_periodicidade FROM ((tab_programa_manut  INNER JOIN tab_sistemas ON   tab_programa_manut.id_sistema=tab_sistemas.id_sistema) INNER JOIN  tab_atividades ON  tab_programa_manut.id_atividade= tab_atividades.id_atividade) INNER JOIN tab_periodicidade ON  tab_programa_manut.id_periodicidade=tab_periodicidade.id_periodicidade  WHERE tab_programa_manut.id_cliente='" & id_cliente & "' AND tab_programa_manut.id_empree='" & id_empree & "' AND  (tab_programa_manut.nivel_manut=1 or tab_programa_manut.nivel_manut=2) AND tab_programa_manut.status_area_comum='S';" 
		 eMp.Open SQL_busca1,conn
							
			if (Not eMp.EOF) then
	
				   eMp.movefirst
				   do while Not eMp.EOF 
				  
					 temp1=temp1 & "{" & chr(34) & "id_prog_manut" & chr(34) & ":" & chr(34) & eMp.Fields("id_prog_manut") & chr(34) & "," & chr(34) & "nome_sistema" & chr(34) & ":" & chr(34) & eMp.Fields("nome_sistema") & chr(34) & "," & chr(34) & "nome_atividade" & chr(34) & ":" & chr(34) & eMp.Fields("nome_atividade") & chr(34) & "," & chr(34) & "nome_periodicidade" & chr(34) & ":" & chr(34) & eMp.Fields("nome_periodicidade") & chr(34) & "," & chr(34) & "qtde_agrupamentos_eventos" & chr(34) & ":" & chr(34) & eMp.Fields("qtde_agrupamentos_eventos") & chr(34) & "," & chr(34) & "qtde_dias_periodicidade" & chr(34) & ":" & chr(34) & eMp.Fields("qtde_dias_periodicidade") & chr(34) & "," & chr(34) & "data_inicial_garantia" & chr(34) & ":" & chr(34) & formata_data3(eMp.Fields("data_inicial_garantia")) & chr(34) & "," & chr(34) & "formato_periodicidade" & chr(34) & ":" & chr(34) & eMp.Fields("formato_periodicidade") &  chr(34) & "},"
					 
				   eMp.movenext
				   loop 
			end if
		   
		 eMp.close
		 Set eMp= Nothing
         
		 temp1=Left(temp1,Len(temp1)-1)
		 temp1=temp1 & " ]}"
		 
		 resp=resp  & "*" & temp1
		 
     end if
	
	response.write(resp)

else  ' nao achou login

     encontrou="N"
	 resp=""
     resp=resp  & "{" & chr(34) & "logou" & chr(34) & ":" & chr(34) & encontrou & chr(34) & "," & chr(34) & "id_cliente" & chr(34) & ":" & chr(34) & "nenhum"  & chr(34) & "," & chr(34) & "id_empree" & chr(34) & ":" & chr(34) & "nenhum" & chr(34) & "," & chr(34) & "nome_empree" & chr(34) & ":" & chr(34) & "nenhum" & chr(34) & "," & chr(34) & "e_construtora" & chr(34) & ":" & chr(34) & "nenhum" & chr(34) & "," & chr(34) & "data_implantacao_sc" & chr(34) & ":" & chr(34) & "nenhum" & chr(34) & " }*nada"
	 response.write(resp)

end if

conn.close   
Set conn = Nothing 
%>


<%
Function formata_data3(data_inicial)
 
	aux1=InStr(1,data_inicial,"/")
	aux2=Mid(data_inicial,1,aux1-1)
	aux2=Right("00" & aux2 , 2)
	aux3=InStr(aux1+1,data_inicial,"/")
	aux4=Mid(data_inicial,aux1+1,aux3-aux1-1)
	aux4=Right("00" & aux4 , 2)
	aux5=Mid(data_inicial,aux3+1)
	aux5=Right("20" & aux5 , 4)
	
	aux6=aux4 & "/" & aux2 & "/" & aux5

	formata_data3=aux6

End Function
%>