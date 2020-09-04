using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Shared
{
    public partial class PaginaMaestraAdministracion : System.Web.UI.MasterPage
    {

        private HttpContext Current = HttpContext.Current;

        UsuarioEntidad usuario = new UsuarioEntidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string nombre = Session["NomUsuario"].ToString();
                lblNombreUsuario.Text = " Hola " + nombre;

            }
            catch (Exception ex)
            {

                Response.Redirect("/Views/Public/Default.aspx");
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            usuario = new UsuarioEntidad();
            usuario = (UsuarioEntidad)Current.Session["Usuario"];
            if (usuario != null && !string.IsNullOrWhiteSpace(usuario.Apellido))
                ServicioLog.CrearLogEventos("Deslogueo", "Deslogueo Correcto", usuario.Apellido, (usuario.IdUsuario).ToString());
            else
                ServicioLog.CrearLogEventos("Deslogueo", "Deslogueo Correcto", "", (usuario.IdUsuario).ToString());
            Session.Abandon();
            Response.Redirect("/Views/Public/Default.aspx");
        }
    }
}