<!--#include file="incDB_2.asp" -->
<%

function func_tem_imagem(a1)
    dim sql
	sql= "UPDATE tab_eventos SET "
	sql= sql & "tem_uploads="
	sql= sql & "'S'"
	sql= sql & " WHERE "	
	sql= sql & "id_evento="	
	sql= sql & "'" & a1 & "'"
	atualizar2 sql
end function

%>

