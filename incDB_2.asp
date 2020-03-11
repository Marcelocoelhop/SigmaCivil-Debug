<%

function getConnection2(byRef MyConnectionString2 )
	MyConnectionString2 ="DRIVER={MySQL ODBC 5.1 Driver};SERVER=mysql28.fidigital.com.br;PORT=3306;DATABASE=newdot27;USER=newdot27;PASSWORD=a2x3z4;OPTION=3;"
end function

function excluir2(strSql2)
	dim cmd2 
	dim MyConnectionString2
	getConnection2 MyConnectionString2
	set cmd2= server.CreateObject("ADODB.Command")
	cmd2.activeConnection= MyConnectionString2	
	cmd2.commandText= strSql2
	cmd2.execute
	set cmd2= nothing
end function

function inserir2(strSql2, byRef erro2)
	on error resume next
	dim cmd2
	dim MyConnectionString2
	getConnection2 MyConnectionString2
	set cmd2= server.CreateObject("ADODB.Command")
	cmd2.activeConnection= MyConnectionString2	
	cmd2.commandText= strSql2
	cmd2.execute
	erro2= err.number
	set cmd2= nothing
end function


function atualizar2(strSql2)
	dim cmd2 
	dim MyConnectionString2
	getConnection2 MyConnectionString2
	set cmd2= server.CreateObject("ADODB.Command")
	cmd2.activeConnection= MyConnectionString2
	cmd2.commandText= strSql2
	cmd2.execute
	set cmd2= nothing
end function
%>