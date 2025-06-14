<%
Response.ContentType = "text/html"
Response.Charset = "UTF-8"

' Incluir conexión
<!--#include file="../Clases/conexion.asp" -->

On Error Resume Next

Set cmd = Server.CreateObject("ADODB.Command")
With cmd
    .ActiveConnection = conn
    .CommandText = "SELECT MN, Nombre, Apellido, Tipo, Planta, Habilitado FROM Usuarios ORDER BY Apellido, Nombre"
    .CommandType = 1 ' adCmdText
End With

Set rs = Server.CreateObject("ADODB.Recordset")
rs.CursorLocation = 3 ' adUseClient

rs.Open cmd, , 1, 3 ' adOpenKeyset, adLockOptimistic

If Err.Number <> 0 Then
    Response.Write "<p><strong>Error al abrir recordset:</strong> " & Err.Description & "</p>"
    Response.End
End If
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
    <link rel="stylesheet" href="../Clases/bootstrap.min.css">
    <link rel="stylesheet" href="../Clases/style.css">
</head>
<body>

<div class="container mt-4">
    <div class="row align-items-center mb-4">
        <div class="col-auto">
            <img src="../Clases/Logo.png" alt="Logo" style="height: 60px;">
        </div>
        <div class="col text-center">
            <h2 class="mb-0">Listado de Usuarios</h2>
        </div>
    </div>

<%
If rs.State = 1 Then
%>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>MN</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Tipo</th>
                <th>Planta</th>
                <th>Habilitado</th>
            </tr>
        </thead>
        <tbody>
        <%
        If Not rs.EOF Then
            Do Until rs.EOF
                Response.Write "<tr>"
                Response.Write "<td><a href='usuarios_editar.asp?MN=" & rs("MN") & "'>" & rs("MN") & "</a></td>"
                Response.Write "<td>" & rs("Nombre") & "</td>"
                Response.Write "<td>" & rs("Apellido") & "</td>"
                Response.Write "<td>" & rs("Tipo") & "</td>"
                Response.Write "<td>" & rs("Planta") & "</td>"
                Response.Write "<td>" & IIf(rs("Habilitado"), "Sí", "No") & "</td>"
                Response.Write "</tr>"
                rs.MoveNext
            Loop
        Else
            Response.Write "<tr><td colspan='6'>No hay usuarios cargados.</td></tr>"
        End If
        %>
        </tbody>
    </table>
<%
Else
    Response.Write "<p><strong>No se pudo abrir el recordset.</strong></p>"
End If
%>

</div>

<%
If rs.State = 1 Then rs.Close
Set rs = Nothing
Set cmd = Nothing
conn.Close
Set conn = Nothing
%>
</body>
</html>
