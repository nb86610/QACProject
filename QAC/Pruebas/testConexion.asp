<%
' testConexion.asp - Prueba de conexión a base .accdb en red

Response.ContentType = "text/html"
Response.Charset = "UTF-8"

' Cadena de conexión para Access .accdb
dbPath = "\\HWNT03\QACWEB\APP_DATA\QACWEBData.accdb"
connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath & ";Persist Security Info=False;"

Set conn = Server.CreateObject("ADODB.Connection")

On Error Resume Next
conn.Open connStr

If Err.Number <> 0 Then
    Response.Write "<p><strong>Error al conectar:</strong><br>" & Err.Description & "</p>"
Else
    Response.Write "<p><strong>Conexión exitosa a:</strong><br>" & dbPath & "</p>"
    conn.Close
End If

Set conn = Nothing
%>
