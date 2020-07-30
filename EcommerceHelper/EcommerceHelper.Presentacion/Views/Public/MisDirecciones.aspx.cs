using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Public
{
    public partial class MisDirecciones : System.Web.UI.Page
    {


        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;

        protected void Page_Load(object sender, EventArgs e)
        {


            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {


                CargarMisDirecciones();
            }
        }

        private void CargarMisDirecciones()
        {
            UsuarioEntidad logueadoStatic;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numerodocumento = logueadoStatic.NumeroDocumento;


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}