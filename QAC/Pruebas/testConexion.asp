<%
Response.ContentType = "text/html"
Response.Charset = "UTF-8"

On Error Resume Next

dbPath = "\\HWNT03\QACWEB\APP_DATA\QACWEBData.accdb"
connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath & ";Persist Security Info=False;"

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connStr

If Err.Number <> 0 Then
    Response.Write "<p><strong>Error al conectar:</strong><br>" & Err.Description & "</p>"
ElseIf conn.State = 1 Then
    Response.Write "<p><strong>Conexión exitosa</strong></p>"
    conn.Close
Else
    Response.Write "<p><strong>No hay error, pero la conexión no se abrió</strong></p>"
End If

Set conn = Nothing
%>
