
<%
' testSelect.asp - Conexión a base MDB y lectura de tabla Clientes

Response.ContentType = "text/html"
Response.Charset = "UTF-8"

' Ruta absoluta a la base MDB
dbPath = Server.MapPath("../APP_DATA/QACWEBData.mdb")
connStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";Persist Security Info=False;"

Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")

On Error Resume Next
conn.Open connStr

If Err.Number <> 0 Then
    Response.Write "<p><b>Error al conectar:</b> " & Err.Description & "</p>"
    Response.End
End If

sql = "SELECT ID, Nombre, Apellido FROM Clientes"
rs.Open sql, conn

If Not rs.EOF Then
    Response.Write "<h3>Listado de Clientes</h3><ul>"
    Do Until rs.EOF
        Response.Write "<li>" & rs("ID") & " - " & rs("Nombre") & " " & rs("Apellido") & "</li>"
        rs.MoveNext
    Loop
    Response.Write "</ul>"
Else
    Response.Write "<p>No hay registros en la tabla Clientes.</p>"
End If

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
%>
