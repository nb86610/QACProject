
# 🧭 Guía para formularios de Alta/Edición en ASP.NET con VB.NET y Access

Esta guía resume los pasos seguidos en el formulario de usuarios para reutilizar el mismo patrón con otras entidades como Plantas, Materiales, Privilegios, etc.

---

## 📁 Estructura del proyecto

- `APP_DATA`: contiene la base de datos `QACWEBData.mdb`
- `Clases`: incluye `bootstrap.min.css`, `style.css`, `jquery.js`, `logo.png`
- Formularios ASPX como `UsuariosAlta.aspx`, `UsuariosListado.aspx`

---

## 🧩 Componentes del formulario

### 1. `EntidadAlta.aspx`
- Controles: `asp:TextBox`, `asp:CheckBox`, `asp:Button`
- Logo alineado a la izquierda, título centrado
- Incluye Bootstrap + estilos personalizados
- Botón **Guardar** cambia de texto según el modo
- Botón **Borrar** aparece solo en modo edición

### 2. `EntidadAlta.aspx.vb`
- Detecta si se recibe `?ID=` en la URL (ej. `?MN=...`)
- Si lo hay, carga los datos y desactiva la edición de la clave
- Guarda cambios o crea nuevo registro
- Borra si se solicita
- Siempre redirige al listado

---

## ⚙️ Lógica general para todas las entidades

- Clave primaria única (ej: MN) visible en el listado
- Desde el listado se abre el formulario en modo edición
- Validación mínima (`IsPostBack`, campos vacíos)
- Control de duplicados antes de insertar
- Siempre volver al listado tras guardar o borrar

---

## 🔁 Flujo sugerido

1. Alta de registro → redirige a listado
2. Clic en clave (MN) desde listado → abre en modo edición
3. Editar datos (clave deshabilitada) → guardar cambios o borrar
4. Volver al listado tras acción

---

> 💡 Guardar esta guía como referencia en el repositorio (`guia_formularios.md`).
