<!--#include file="../includes/incDB_dir_2.asp" -->

<%
codigo=Request.querystring("c")
cada_var=split(codigo,"_")

id_cliente=cada_var(0)
num_empree=cada_var(1)
verific=cada_var(2)

verific1=3*CDbl(id_cliente)+5*CDbl(num_empree) 
verific2= Abs (  6*CDbl(id_cliente)-4*CDbl(num_empree)   )
verific3= Abs (  3*CDbl(id_cliente)-3*CDbl(num_empree)   )

if  (verific=verific1 & "S" &  verific2 & "C" & verific3)  then

else
    response.write("Acesso inv�lido")
	Response.end
end if


login=request.querystring("l")
senha=request.querystring("s")

quallogin=Replace(login,"'","")
quallogin=Replace(quallogin,chr(34),"")

qualsenha=Replace(senha,"'","")
qualsenha=Replace(qualsenha,chr(34),"")
qualsenha=Replace(qualsenha,"=","")
qualsenha=cStr(qualsenha)

Set cLi =Server.CreateObject("ADODB.Recordset")
SQL_busca2="Select tab_proprietario.id_prop FROM tab_proprietario WHERE email='" & quallogin & "' AND senha='" & qualsenha & "';" 
cLi.Open SQL_busca2,conn 

	  if Not cLi.EOF then
			id_prop=cLi.Fields("id_prop")
	  end if

cLi.close
Set cLi = Nothing

%>


<%'''''''''''''''''''''''''''''''''''''''''
Response.Buffer = true
%>

<div id='interstitial'>
  <table width="100%" height="35" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="100%" height="35">
        <div align="center"><img src="imagens/loader_blue.gif" width="35" height="35"><br>Aguarde o carregamento...
        </div>
      </td>
    </tr>
  </table>

</div>

<%
response.flush
''''''''''''''''''''''''''''''''''''''''''''
%>



<%
'seguran�a '''
Set aUx =Server.CreateObject("ADODB.Recordset")
SQL_buscaaUx="Select * FROM tab_empree WHERE tab_empree.id_empree='" & num_empree & "' ;" 
aUx.Open SQL_buscaaUx,conn 

  if Not aUx.EOF then
		nome_empree=aUx.Fields("nome_empree")
  else
		aUx.close
		Set aUx = Nothing
		conn.close   
		Set conn = Nothing 
        response.redirect("../index.asp")
		Response.end
  end if

aUx.close
Set aUx = Nothing

Set aUx =Server.CreateObject("ADODB.Recordset")
SQL_buscaaUx="Select tab_empree.id_empree  FROM tab_proprietario INNER JOIN tab_empree ON tab_proprietario.id_cliente=tab_empree.id_cliente WHERE tab_proprietario.id_prop='" & id_prop & "' AND tab_empree.id_empree='" & num_empree & "' ;" 
aUx.Open SQL_buscaaUx,conn 

  if aUx.EOF then
		aUx.close
		Set aUx = Nothing
		conn.close   
		Set conn = Nothing 
        response.redirect("../index.asp")
		Response.end
  end if

aUx.close
Set aUx = Nothing
'seguran�a '''

%>

<!--#include file="topo_empty.asp" -->
<article>
  <header class="titulo">

    <img src="../clientes/le/<%=num_empree%>.jpg" width="125" height="70">


    <hgroup>
      <h1>CheckPoints</h1>
      <h2>Hist&oacute;rico</h2>
    </hgroup>
  </header>
  <!--Google Charts-->
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>

  <%
if Request.Querystring("m")<>"" then
	mes=Request.Querystring("m")
else
   mes=month(now())
end if


if Request.Querystring("a")<>"" then
	ano=Request.Querystring("a")
else
   ano=year(now())  
end if

'''''''''''''''''''''''''''''

mes=right("0" & mes,2)
data_ini_p_busca="01/" & mes & "/" & ano
data_final_p_busca=DateAdd("m",1,data_ini_p_busca) 
data_final_p_busca=DateAdd("d",-1,data_final_p_busca) 

marcar1=""
marcar2=""
marcar3=""
marcar4=""
marcar5=""
marcar6=""
marcar7=""
marcar8=""
marcar9=""
marcar10=""
marcar11=""
marcar12=""
marcar2010=""
marcar2011=""
marcar2012=""
marcar2013=""
marcar2014=""
marcar2015=""
marcar2016=""
marcar2017=""
marcar2018=""
marcar2019=""
marcar2020=""

Select Case mes
  Case 01
    marcar1="selected"
  Case 02
    marcar2="selected"
  Case 03
    marcar3="selected"
  Case 04
    marcar4="selected"
  Case 05
    marcar5="selected"
  Case 06
    marcar6="selected"
  Case 07
    marcar7="selected"
  Case 08
    marcar8="selected"
  Case 09
    marcar9="selected"
  Case 10
    marcar10="selected"
  Case 11
    marcar11="selected"
  Case 12
    marcar12="selected"
End Select


Select Case ano
  Case 2010
    marcar2010="selected"
  Case 2011
    marcar2011="selected"
  Case 2012
    marcar2012="selected"
  Case 2013
    marcar2013="selected"
  Case 2014
    marcar2014="selected"
  Case 2015
    marcar2015="selected"
  Case 2016
    marcar2016="selected"
  Case 2017
    marcar2017="selected"
  Case 2018
    marcar2018="selected"
  Case 2019
    marcar2019="selected"
  Case 2020
    marcar2020="selected"
End Select

data_inicial=data_ini_p_busca
data_final=data_final_p_busca

qtde_dias=datediff("d",data_inicial,data_final) + 1


%>
  <form name="form2" id="form2" action="" method="post">


    <table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td width="26" height="27">
            <div align="left"> </div>
          </td>
          <td width="98" class="menu_2"> <select name="select_mes" onChange="gerar()">
              <option value="1" <%=marcar1%>>Janeiro</option>
              <option value="2" <%=marcar2%>>Fevereiro</option>
              <option value="3" <%=marcar3%>>Mar&ccedil;o</option>
              <option value="4" <%=marcar4%>>Abril</option>
              <option value="5" <%=marcar5%>>Maio</option>
              <option value="6" <%=marcar6%>>Junho</option>
              <option value="7" <%=marcar7%>>Julho</option>
              <option value="8" <%=marcar8%>>Agosto</option>
              <option value="9" <%=marcar9%>>Setembro</option>
              <option value="10" <%=marcar10%>>Outubro</option>
              <option value="11" <%=marcar11%>>Novembro</option>
              <option value="12" <%=marcar12%>>Dezembro</option>
            </select></td>
          <td width="75" class="menu_2"> <select name="select_ano" onChange="gerar()">
              <option value="2010" <%=marcar2010%>>2010</option>
              <option value="2011" <%=marcar2011%>>2011</option>
              <option value="2012" <%=marcar2012%>>2012</option>
              <option value="2013" <%=marcar2013%>>2013</option>
              <option value="2014" <%=marcar2014%>>2014</option>
              <option value="2015" <%=marcar2015%>>2015</option>
              <option value="2016" <%=marcar2016%>>2016</option>
              <option value="2017" <%=marcar2017%>>2017</option>
              <option value="2018" <%=marcar2018%>>2018</option>
              <option value="2019" <%=marcar2019%>>2019</option>
              <option value="2020" <%=marcar2020%>>2020</option>
            </select></td>
          <td width="1033" class="menu_2">
            <div align="left"><img src="imagens/icon_go.gif" width="24" height="24" onClick="gerar()"
                style="cursor:pointer"></div>
          </td>
        </tr>
      </tbody>
    </table>

  </form>


  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th width="50%">
          <div align="left">
            <font size="3">sistema</font>
          </div>
        </th>
        <th width="25%">
          <div align="left">
            <font size="3">data</font>
          </div>
        </th>
        <th width="25%">
          <div align="left">
            <font size="3">usu&aacute;rio</font>
          </div>
        </th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
  <%Set cLi =Server.CreateObject("ADODB.Recordset")
SQL_busca22="Select  tab_checkpoints.id_sistema,tab_checkpoints.data,tab_checkpoints.latitude,tab_checkpoints.longitude,tab_checkpoints.altura,tab_sistemas.nome_sistema,tab_proprietario.email  FROM  (tab_checkpoints INNER JOIN tab_sistemas ON tab_checkpoints.id_sistema=tab_sistemas.id_sistema) INNER JOIN tab_proprietario ON tab_checkpoints.id_prop=tab_proprietario.id_prop  WHERE  tab_checkpoints.id_empree='" & num_empree & "' AND tab_checkpoints.id_prop='" & id_prop & "' AND tab_checkpoints.data>='" & formata_data(data_inicial) & " 00:00:00' AND tab_checkpoints.data<='" & formata_data(data_final) & " 23:59:59' ORDER BY  tab_checkpoints.data DESC, tab_sistemas.nome_sistema ASC  LIMIT 300"
cLi.Open SQL_busca22,conn 

	  if Not cLi.EOF then
		cLi.movefirst
		do while Not cLi.EOF 
	
			data=cLi.Fields("data")
			nome_sistema=cLi.Fields("nome_sistema")
			latitude=cLi.Fields("latitude")
			longitude=cLi.Fields("longitude")
			email=cLi.Fields("email")
			%>

  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="50%">
        <div align="left">
          <font size="3"><%=nome_sistema%></font>
        </div>
      </td>
      <td width="25%">
        <div align="left">
          <font size="3">
            <font color="#FF3300"><%=data%></font>
          </font>
        </div>
      </td>
      <td width="25%">
        <div align="left">
          <font size="3">
            <font color="#3399FF"><%=email%></font>
          </font>
        </div>
      </td>
    </tr>
  </table>
  <%cLi.movenext	
		loop
	  else
	    Response.write("<br>N�o existem checagens nesse intervalo de datas")
	  end if
	  

cLi.close
Set cLi = Nothing
%>
  <%
' ver quais sistemas existem '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
cont_sist=0
Dim q_sistemas()
ReDim q_sistemas(500)
pontos_grafico="['Datas',"

Set cLi =Server.CreateObject("ADODB.Recordset")
SQL_busca22="Select  tab_checkpoints.id_sistema,tab_checkpoints.data,tab_checkpoints.latitude,tab_checkpoints.longitude,tab_checkpoints.altura,tab_sistemas.nome_sistema,tab_proprietario.email  FROM  (tab_checkpoints INNER JOIN tab_sistemas ON tab_checkpoints.id_sistema=tab_sistemas.id_sistema) INNER JOIN tab_proprietario ON tab_checkpoints.id_prop=tab_proprietario.id_prop  WHERE  tab_checkpoints.id_empree='" & num_empree & "' AND tab_checkpoints.id_prop='" & id_prop & "' AND tab_checkpoints.data>='" & formata_data(data_inicial) & " 00:00:00' AND tab_checkpoints.data<='" & formata_data(data_final) & " 23:59:59'  GROUP BY  tab_checkpoints.id_sistema  ORDER BY  tab_sistemas.nome_sistema ASC "
cLi.Open SQL_busca22,conn 

	  if Not cLi.EOF then
		cLi.movefirst
		do while Not cLi.EOF 

			 pontos_grafico=pontos_grafico & "'" & cLi.Fields("nome_sistema")  & "',"
			 q_sistemas(cont_sist)=cLi.Fields("id_sistema")
		
		cont_sist=cont_sist+1
		cLi.movenext	
		loop
	  end if


cLi.close
Set cLi = Nothing 

pontos_grafico=Left(pontos_grafico,Len(pontos_grafico)-1)
pontos_grafico=pontos_grafico & "],"

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

for i = 1 to qtde_dias

    nova_data=DateAdd("d",i-1,data_inicial)

	pontos_grafico=pontos_grafico & "['" & formata_data2(nova_data) & "',"
    
	for k = 0 to cont_sist-1

		Set cLi =Server.CreateObject("ADODB.Recordset")
		SQL_busca22="Select  Count(tab_checkpoints.id_checkpoint) AS contador1  FROM  (tab_checkpoints INNER JOIN tab_sistemas ON tab_checkpoints.id_sistema=tab_sistemas.id_sistema) INNER JOIN tab_proprietario ON tab_checkpoints.id_prop=tab_proprietario.id_prop  WHERE  tab_checkpoints.id_empree='" & num_empree & "' AND tab_checkpoints.id_prop='" & id_prop & "' AND tab_checkpoints.id_sistema='" & q_sistemas(k) & "' AND tab_checkpoints.data>='" & formata_data(nova_data) & " 00:00:00' AND tab_checkpoints.data<='" & formata_data(nova_data) & " 23:59:59' "
		cLi.Open SQL_busca22,conn 
		
			  if Not cLi.EOF then
					 pontos_grafico=pontos_grafico & cLi.Fields("contador1") & ","
			  else
					 pontos_grafico=pontos_grafico &  0 & ","
			  end if
		
		
		cLi.close
		Set cLi = Nothing 
		
	next
    pontos_grafico=Left(pontos_grafico,Len(pontos_grafico)-1)
	pontos_grafico=pontos_grafico & "],"
	
next

pontos_grafico=Left(pontos_grafico,Len(pontos_grafico)-1)

%>

  <br>
  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th>
          <div align="left">
            <font size="3">Quantidade de checkpoints por dia</font>
          </div>
        </th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
  <br>
  <table width="100%" height="158" border="1" cellpadding="0" cellspacing="0" bordercolor="#E5E5E5" class="menu_7">
    <tr>
      <td width="100%" height="156" class="menu_7">
        <div align="center">
          <!--Load the AJAX API-->
          <script type="text/javascript">

            google.load('visualization', '1.0', { 'packages': ['corechart'] });
            google.setOnLoadCallback(drawChart);

            function drawChart() {

              var novo_data = google.visualization.arrayToDataTable([
				        <%=pontos_grafico %>
			        ]);


              //['Datas','�rea de recrea��o infantil','CFTV / Seguran�a perimetral','Cobertura','Infraestrutura para pr�tica recreativa','Instala��es hidr�ulicas - �gua pot�vel'],
              //['3/10/2018', 1, 1, 1, 1, 1],
              //['03/10/2018', 1, 0, 1, 0, 1],
              //['03/10/2018', 1, 1, 1, 1, 1],
              //['2030', 1, 1, 1, 1, 1]
              //]);

              var options = {
                width: 900,
                height: 450,
                chartArea: { left: 5, top: 5, width: "600", height: "300" },
                legend: { position: 'right', maxLines: 3 },
                tooltip: { showColorCode: true, textStyle: { color: '#30768a', fontSize: 11 } },
                bar: { groupWidth: '70%' },
                vAxis: { textPosition: 'in', minValue: 0, gridlines: { count: -1 } },
                //	vAxis: { textPosition: 'in' , gridlines:{count: 10} , format:'#' , maxValue:100,minValue:0,viewWindowMode:'maximized'},
                hAxis: { textStyle: { color: '#333333', fontSize: 11 }, slantedTextAngle: 90 },
                isStacked: true,
              };

              view = new google.visualization.DataView(novo_data);
              novo_chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
				
				<% if cont_sist <> 0 then %>
                novo_chart.draw(view, options);
				<% end if %>

				var selectHandler = function (e) {
                  window.location = novo_data.getValue(novo_chart.getSelection()[0]['row'], 1);
                }

              google.visualization.events.addListener(novo_chart, 'select', selectHandler);

            }
          </script>
          <div id="chart_div1"></div>
        </div>
      </td>
    </tr>
  </table>
</article>

<!--#include file="rodape_empty.asp" -->

<%
conn.close   
Set conn = Nothing 
%>


<%
Function formata_data(data_inicial)
 
	aux1=InStr(1,data_inicial,"/")
	aux2=Mid(data_inicial,1,aux1-1)
	aux2=Right("00" & aux2 , 2)
	aux3=InStr(aux1+1,data_inicial,"/")
	aux4=Mid(data_inicial,aux1+1,aux3-aux1-1)
	aux4=Right("00" & aux4 , 2)
	aux5=Mid(data_inicial,aux3+1)
	aux5=Right("20" & aux5 , 4)
	
	aux6=aux5 & "-" & aux4 & "-" & aux2

	formata_data=aux6

End Function

Function formata_data2(data_inicial)
 
	aux1=InStr(1,data_inicial,"/")
	aux2=Mid(data_inicial,1,aux1-1)
	aux2=Right("00" & aux2 , 2)
	aux3=InStr(aux1+1,data_inicial,"/")
	aux4=Mid(data_inicial,aux1+1,aux3-aux1-1)
	aux4=Right("00" & aux4 , 2)
	aux5=Mid(data_inicial,aux3+1)
	aux5=Right("20" & aux5 , 4)
	
	aux6=aux2 & "/" & aux4 & "/" & aux5

	formata_data2=aux6

End Function

%>

<script>

  function gerar() {
    document.form2.action = "new_checkpoint_hist.asp?c=" + '<%=codigo%>' + "&m=" + document.form2.select_mes.value + "&a=" + document.form2.select_ano.value + "&l=" + '<%=quallogin%>' + "&s=" + '<%=qualsenha%>'
    document.form2.submit();
  }

</script>

<script language="javascript">
  interstitial.style.display = "none";
</script>