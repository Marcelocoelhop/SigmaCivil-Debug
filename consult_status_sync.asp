<% Response.Charset="ISO-8859-1" %>
<!--#include file="incDB_dir_2.asp" -->

<%					
 
num_empree=request.querystring("e")
	 
logar=0

' dados do empree ''''''''''''''''''''''''''''''
Set cLi =Server.CreateObject("ADODB.Recordset")
SQL_busca2="Select tab_empree.status_sync_APP FROM tab_empree WHERE id_empree='" & num_empree & "';" 
cLi.Open SQL_busca2,conn 

	  if Not cLi.EOF then
			status_sync_APP=cLi.Fields("status_sync_APP")						
			logar=logar+1
	  end if

cLi.close
Set cLi = Nothing
'''''''''''''''''''''''''''''''''''''''''''''''' 

%>      


<%
if logar=1 then
	 
	 resp=status_sync_APP
	 response.write(resp)

else  ' nao achou login

	 resp="nada"
	 response.write(resp)

end if

conn.close   
Set conn = Nothing 
%>


