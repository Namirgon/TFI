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


    public partial class Idioma : System.Web.UI.Page
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
            string[] unosPermisosTest = new string[] { "GestionIdioma" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }

        }
        public void CargarGrilla()
        {

            GVGrilla.DataSource = GestorIdioma.FindAll();
            GVGrilla.DataBind();
        }

        protected void BtnAltaIdioma_Click(object sender, EventArgs e)
        {
            IdiomaEntidad unIdioma = new IdiomaEntidad();


            try
            {
                unIdioma.IdIdioma = 1;
                unIdioma.Descripcion = txtIdioma.Text;
                GestorIdioma.RegistrarIdioma(unIdioma);
                LimpiarTextos();
                CargarGrilla();
               

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
            int id = Int32.Parse(GVGrilla.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            IdiomaEntidad idioma;
            idioma = GestorIdioma.Find(id);
            switch (e.CommandName)
            {

                case "btnModificar":
                    {
                        hid.Value = idioma.IdIdioma.ToString();  
                        txtIdioma.Text =idioma.Descripcion;

                        break;
                    }
                case "btnEliminar":

                    {

                        System.Text.StringBuilder sb = new System.Text.StringBuilder();

                        if (idioma.Descripcion == "Ingles" | idioma.Descripcion == "Español")
                        {
                            sb.Append(@"<script type='text/javascript'>");
                            sb.Append("alert('No se puede Eliminar Idioma');");
                            sb.Append(@"</script>");
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                                       "CrearOK", sb.ToString(), false);
                            CargarGrilla();
                        }
                        else
                        {
                            GestorIdioma.EliminarIdioma(id);
                            CargarGrilla();
                            LimpiarTextos();
                        }

                        break;
                    }
            }

        }

       

   

        protected void btnGuardarModificacion_Click(object sender, EventArgs e)
        {

            try
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                if (txtIdioma.Text == "Ingles" | txtIdioma.Text == "Español")
                {
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('No se puede modificar Idioma');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "CrearOK", sb.ToString(), false);
                }
                else
                {
                    IdiomaEntidad unIdioma = new IdiomaEntidad();
                    unIdioma.IdIdioma = Int32.Parse(hid.Value);
                    unIdioma.Descripcion = txtIdioma.Text;

                    GestorIdioma.ModificarIdioma(unIdioma);
                    LimpiarTextos();
                    CargarGrilla();
                }
            }
            catch { }
        }
    }
}