' UsuariosAlta.aspx.vb
Imports System.Data.OleDb

Partial Class UsuariosAlta
    Inherits System.Web.UI.Page

    Private connStr As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("~/APP_DATA/QACWEBData.mdb")
    Private modoEdicion As Boolean = False

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim mnParam As String = Request.QueryString("MN")
            If Not String.IsNullOrEmpty(mnParam) Then
                CargarUsuario(mnParam)
                txtMN.Enabled = False
                btnGuardar.Text = "Actualizar Usuario"
                btnBorrar.Visible = True
                modoEdicion = True
            Else
                btnBorrar.Visible = False
            End If
        End If
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Dim mn As String = txtMN.Text.Trim()

        If mn = "" Then
            lblMensaje.Text = "El campo MN no puede estar vacío."
            Exit Sub
        End If

        Using conn As New OleDbConnection(connStr)
            conn.Open()

            If Request.QueryString("MN") IsNot Nothing Then
                ' Modo edición
                Dim updateCmd As New OleDbCommand("UPDATE Usuarios SET Nombre=?, Apellido=?, Planta=?, Tipo=?, Atribuciones=?, Habilitado=? WHERE MN=?", conn)
                updateCmd.Parameters.AddWithValue("@Nombre", txtNombre.Text.Trim())
                updateCmd.Parameters.AddWithValue("@Apellido", txtApellido.Text.Trim())
                updateCmd.Parameters.AddWithValue("@Planta", txtPlanta.Text.Trim())
                updateCmd.Parameters.AddWithValue("@Tipo", Convert.ToInt32(txtTipo.Text.Trim()))
                updateCmd.Parameters.AddWithValue("@Atribuciones", Convert.ToInt32(txtAtribuciones.Text.Trim()))
                updateCmd.Parameters.AddWithValue("@Habilitado", chkHabilitado.Checked)
                updateCmd.Parameters.AddWithValue("@MN", mn)
                updateCmd.ExecuteNonQuery()
            Else
                ' Modo alta
                Dim checkCmd As New OleDbCommand("SELECT COUNT(*) FROM Usuarios WHERE MN = ?", conn)
                checkCmd.Parameters.AddWithValue("@MN", mn)
                Dim count As Integer = Convert.ToInt32(checkCmd.ExecuteScalar())
                If count > 0 Then
                    lblMensaje.Text = "Ya existe un usuario con ese MN."
                    Exit Sub
                End If

                Dim insertCmd As New OleDbCommand("INSERT INTO Usuarios (MN, Nombre, Apellido, Planta, Tipo, Atribuciones, Habilitado) VALUES (?, ?, ?, ?, ?, ?, ?)", conn)
                insertCmd.Parameters.AddWithValue("@MN", mn)
                insertCmd.Parameters.AddWithValue("@Nombre", txtNombre.Text.Trim())
                insertCmd.Parameters.AddWithValue("@Apellido", txtApellido.Text.Trim())
                insertCmd.Parameters.AddWithValue("@Planta", txtPlanta.Text.Trim())
                insertCmd.Parameters.AddWithValue("@Tipo", Convert.ToInt32(txtTipo.Text.Trim()))
                insertCmd.Parameters.AddWithValue("@Atribuciones", Convert.ToInt32(txtAtribuciones.Text.Trim()))
                insertCmd.Parameters.AddWithValue("@Habilitado", chkHabilitado.Checked)
                insertCmd.ExecuteNonQuery()
            End If
        End Using

        Response.Redirect("UsuariosListado.aspx")
    End Sub

    Private Sub CargarUsuario(mn As String)
        Using conn As New OleDbConnection(connStr)
            conn.Open()
            Dim cmd As New OleDbCommand("SELECT * FROM Usuarios WHERE MN = ?", conn)
            cmd.Parameters.AddWithValue("@MN", mn)
            Dim reader As OleDbDataReader = cmd.ExecuteReader()
            If reader.Read() Then
                txtMN.Text = reader("MN").ToString()
                txtNombre.Text = reader("Nombre").ToString()
                txtApellido.Text = reader("Apellido").ToString()
                txtPlanta.Text = reader("Planta").ToString()
                txtTipo.Text = reader("Tipo").ToString()
                txtAtribuciones.Text = reader("Atribuciones").ToString()
                chkHabilitado.Checked = Convert.ToBoolean(reader("Habilitado"))
            End If
        End Using
    End Sub

    Protected Sub btnBorrar_Click(sender As Object, e As EventArgs)
        Dim mn As String = txtMN.Text.Trim()
        Using conn As New OleDbConnection(connStr)
            conn.Open()
            Dim delCmd As New OleDbCommand("DELETE FROM Usuarios WHERE MN = ?", conn)
            delCmd.Parameters.AddWithValue("@MN", mn)
            delCmd.ExecuteNonQuery()
        End Using
        Response.Redirect("UsuariosListado.aspx")
    End Sub
End Class
