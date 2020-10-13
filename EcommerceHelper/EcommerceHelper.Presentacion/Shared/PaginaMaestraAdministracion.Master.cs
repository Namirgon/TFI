using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using EcommerceHelper.Funciones.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EcommerceHelper.BLL.Servicios;
using System.Globalization;
using EcommerceHelper.BLL.Managers;

namespace EcommerceHelper.Presentacion.Shared
{
    public partial class PaginaMaestraAdministracion : System.Web.UI.MasterPage
    {

        private HttpContext Current = HttpContext.Current;

       
      
        public UsuarioEntidad usuario { get; set; }
        private IdiomaEntidad idioma;
        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();

        protected void Page_Load(object sender, EventArgs e)
        {

            usuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];
            try
            {
                string nombre = Session["NomUsuario"].ToString();
                lblNombreUsuario.Text = "  Hola " + nombre;

            }
            catch (Exception ex)
            {

                Response.Redirect("/Views/Public/Default.aspx");
            }


            if (!IsPostBack)
            {
                if (ddlIdioma.Items.FindByValue(CultureInfo.CurrentCulture.Name) != null)
                {
                    ddlIdioma.Items.FindByValue(CultureInfo.CurrentCulture.Name).Selected = true;
                }
                if (idioma == null)
                {
                    Session["Idioma"] = obtenerIdiomaCombo();
                }
            }

        }

        public PaginaMaestraAdministracion()
        {
            idioma = new IdiomaEntidad();

        }


        public bool Autenticar(string elPermiso)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];

            string[] PermisosPagina = { elPermiso };

            if (usuarioAutenticado != null)
            {
                if (usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == elPermiso))
                    return true;
                if (FamiliaBLL.BuscarPermiso(usuarioAutenticado.Permisos, PermisosPagina))
                    return true;
                //return usuarioAutenticado.Permisos.Any(X => X.NombreIFamPat == elPermiso);
            }
            return false;

        }
        public bool Autenticar(string[] losPermisosARevisar)
        {
            UsuarioEntidad usuarioAutenticado = new UsuarioEntidad();
            usuarioAutenticado = (UsuarioEntidad)Current.Session["Usuario"];


            if (usuarioAutenticado != null)
            {
                foreach (string unTag in losPermisosARevisar)
                {
                    if (usuarioAutenticado.Permisos.Exists(x => x.NombreIFamPat == unTag))
                        return true;
                }

                return FamiliaBLL.BuscarPermiso(usuarioAutenticado.Permisos, losPermisosARevisar);
            }
            return false;

        }

        public string obtenerIdiomaCombo()
        {
            var val = (ddlIdioma.SelectedItem.Value);
            var val2 = ddlIdioma.SelectedValue;
            return (val2);

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            usuario = new UsuarioEntidad();
            usuario = (UsuarioEntidad)Current.Session["Usuario"];
            if (usuario != null && !string.IsNullOrWhiteSpace(usuario.Apellido))
                ServicioLog.CrearLogEventos("Deslogueo", "Deslogueo Correcto", usuario.Apellido, (usuario.IdUsuario).ToString());
            else
                ServicioLog.CrearLogEventos("Deslogueo", "Deslogueo Correcto", "", (usuario.IdUsuario).ToString());
            Session["Usuario"] = null;
            Session.Abandon();
            Response.Redirect("../Public/Default.aspx");
        }
    }
}