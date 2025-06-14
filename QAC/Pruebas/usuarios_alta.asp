<%
Response.ContentType = "text/html"
Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Alta de Usuarios</title>
    <link rel="stylesheet" href="../Clases/bootstrap.min.css">
    <link rel="stylesheet" href="../Clases/style.css">
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex align-items-center mb-4">
            <img src="../Clases/Logo.png" alt="Logo" style="height: 60px;">
            <h2 class="flex-fill text-center">Alta de Usuarios</h2>
        </div>
        <form action="" method="post">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="text" class="form-control" id="email" name="email">
            </div>
            <div class="mb-3">
                <label for="tipo" class="form-label">Tipo</label>
                <input type="text" class="form-control" id="tipo" name="tipo">
            </div>
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="activo" name="activo" value="1">
                <label class="form-check-label" for="activo">Activo</label>
            </div>
            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
    </div>
</body>
</html>
