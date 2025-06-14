<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UsuariosAlta.aspx.vb" Inherits="UsuariosAlta" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <title>Alta / Edición de Usuario</title>
    <link href="../Clases/bootstrap.min.css" rel="stylesheet" />
    <link href="../Clases/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="row align-items-center mb-4">
                <div class="col-auto">
                    <img src="../Clases/logo.png" alt="Logo" style="height: 60px;" />
                </div>
                <div class="col text-center">
                    <h2 class="mb-0">Alta / Edición de Usuario</h2>
                </div>
            </div>

            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>

            <div class="row g-3">
                <div class="col-md-6">
                    <label for="txtMN">MN (Email)</label>
                    <asp:TextBox ID="txtMN" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label for="txtApellido">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label for="txtPlanta">Planta</label>
                    <asp:TextBox ID="txtPlanta" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label for="txtTipo">Tipo</label>
                    <asp:TextBox ID="txtTipo" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label for="txtAtribuciones">Atribuciones</label>
                    <asp:TextBox ID="txtAtribuciones" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label for="chkHabilitado">Habilitado</label><br />
                    <asp:CheckBox ID="chkHabilitado" runat="server" CssClass="form-check-input" />
                </div>
            </div>

            <div class="mt-4">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Usuario" CssClass="btn btn-primary me-2" OnClick="btnGuardar_Click" />
                <asp:Button ID="btnBorrar" runat="server" Text="Borrar Usuario" CssClass="btn btn-danger" OnClick="btnBorrar_Click" Visible="false" />
            </div>
        </div>
    </form>
</body>
</html>
