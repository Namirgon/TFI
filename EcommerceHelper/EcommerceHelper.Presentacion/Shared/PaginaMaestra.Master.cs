using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Shared
{
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {


        private UsuarioBLL _manager;
        private HttpContext Current = HttpContext.Current;
        public UsuarioEntidad usuario { get; set; }
        private IdiomaEntidad idioma;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!this.IsPostBack)
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

        public string obtenerIdiomaCombo()
        {
            var val = (ddlIdioma.SelectedItem.Value);
            var val2 = ddlIdioma.SelectedValue;
            return (val2);

        }

        public PaginaMaestra()
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

    }
}