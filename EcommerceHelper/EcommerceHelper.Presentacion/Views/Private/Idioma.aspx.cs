using EcommerceHelper.BLL;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{

   
    public partial class Idioma : BasePage
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        IdiomaBLL GestorIdioma = new IdiomaBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!Page.IsPostBack)
            {


                CargarGrilla();
            }

        }

        protected void BtnAltaIdioma_Click(object sender, EventArgs e)
        {
            IdiomaEntidad unIdioma = new IdiomaEntidad();


            try
            {
                unIdioma.IdIdioma = 1;
                unIdioma.Descripcion = txtIdioma.Text;
                GestorIdioma.RegistrarIdioma(unIdioma);
              
                CargarGrilla();
                LimpiarTextos();

            }
            catch (Exception ex)
            {


            }


        }

        public void LimpiarTextos()
        {
            txtIdioma.Text = string.Empty;
            
        }
        protected void GVGrilla_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }

        public void CargarGrilla()
        {

            GVGrilla.DataSource = GestorIdioma.FindAll();
            GVGrilla.DataBind();
        }
    }
}