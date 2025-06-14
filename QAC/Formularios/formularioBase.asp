<%
Response.ContentType = "text/html"
Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Prueba</title>

    <!-- CSS local -->
    <link rel="stylesheet" href="../Clases/bootstrap.min.css">
    <link rel="stylesheet" href="../Clases/jquery-ui.css">
    <link rel="stylesheet" href="../Clases/style.css">
</head>
<body>

    <div class="container mt-4">

        <!-- Encabezado con logo e identificación -->
        <div class="d-flex align-items-center mb-4">
            <img src="../Clases/Logo.png" alt="Logo" style="height: 60px;">
            <h2 class="flex-fill text-center">Formulario de Prueba</h2>
        </div>

        <!-- Formulario base -->
        <form>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>

            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
    </div>

</body>
</html>
