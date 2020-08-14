using EcommerceHelper.BLL;
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


                CargarDirecciones();
            }
        }

        

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GVMisDirecciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }


        public void CargarDirecciones()
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            List<DireccionEntidad> MisDirecciones = new List<DireccionEntidad>();
            DireccionBLL ListDireccion = new DireccionBLL();

            ListDireccion.ListarDirecciones(numeroIdUsuario);


            GVMisDirecciones.DataSource = ListDireccion;
            GVMisDirecciones.DataBind();


        }
    }
}