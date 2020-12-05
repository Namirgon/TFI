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
        private List<IdiomaEntidad> idiomaEntidad;
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

                ElegirIdioma();
                CargarGrilla();
            }
            string[] unosPermisosTest = new string[] { "GestionIdioma" };
            if (usuarioentidad == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }

        }

        public void ElegirIdioma()
        {


            ddlIdioma.Items.Clear();
            ddlIdioma.SelectedValue = null;
            idiomaEntidad = GestorIdioma.FindAll();
            ddlIdioma.DataSource = idiomaEntidad;
            ddlIdioma.DataValueField = "IdIdioma";
            ddlIdioma.DataTextField = "Descripcion";
            ddlIdioma.DataBind();

        }
        public void CargarGrilla()
        {
            List<MultiIdiomaEntidad> listaControles = new List<MultiIdiomaEntidad>();

            listaControles = GestorIdioma.MultidiomaSelectAllControles();

            GVGrilla.DataSource = null;
            GVGrilla.DataSource = listaControles;
            GVGrilla.DataBind();
        }

        protected void GVGrilla_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GVGrilla.PageIndex = e.NewPageIndex;
            CargarGrilla();
            
        }

        protected void BtnAltaIdioma_Click(object sender, EventArgs e)
        {
            MultiIdiomaEntidad unIdioma = new MultiIdiomaEntidad();


            try
            {
                unIdioma.MiIdioma = new IdiomaEntidad();
                unIdioma.MiIdioma.IdIdioma=int.Parse (ddlIdioma.SelectedValue);
                unIdioma.NombreDelControl = TXTNombreDelControl.Text;
                unIdioma.Texto = TxtTextoControl.Text;
                GestorIdioma.RegistrarControlTraduccion(unIdioma);
                LimpiarTextos();
               CargarGrilla();
               

            }
            catch (Exception ex)
            {


            }


        }

        public void LimpiarTextos()
        {
            TxtTextoControl.Text = string.Empty;
            TXTNombreDelControl.Text = string.Empty;
        


        }
        protected void GVGrilla_RowCommand(object sender, GridViewCommandEventArgs e)

        {
            int id = Int32.Parse(GVGrilla.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            MultiIdiomaEntidad idioma;
            idioma = GestorIdioma.ControlFind(id);
            switch (e.CommandName)
            {

                case "btnModificar":
                    {
                        hid.Value = idioma.IdMultiIdioma.ToString();
                        TXTNombreDelControl.Text = idioma.NombreDelControl;
                        TxtTextoControl.Text = idioma.Texto;

                        break;
                    }
                case "btnEliminar":

                    {

                        
                        
                            GestorIdioma.EliminarControlMultiIdioma(id);
                            CargarGrilla();
                            LimpiarTextos();
                        

                        break;
                    }
            }

        }

       

   

        protected void btnGuardarModificacion_Click(object sender, EventArgs e)
        {

            try
            {
         

                if (TXTNombreDelControl .Text == " " | TxtTextoControl.Text == " ")
                {
                    LbMensaje.Text =" Debe ingresar valores";
                    LbMensaje.Visible = true;
                }
                else
                {

                    LbMensaje.Visible = false;

                    MultiIdiomaEntidad  unIdioma = new MultiIdiomaEntidad();

                    unIdioma.IdMultiIdioma = int.Parse(hid.Value);
                    unIdioma.MiIdioma = new IdiomaEntidad();
                    unIdioma.MiIdioma.IdIdioma = int.Parse(ddlIdioma.SelectedValue);
                    unIdioma.NombreDelControl = TXTNombreDelControl.Text;
                    unIdioma.Texto = TxtTextoControl.Text;
                   

                    GestorIdioma.ModificarControlMultiIdioma(unIdioma);
                    LimpiarTextos();
                    CargarGrilla();
                }
            }
            catch { }
        }

        protected void GVGrilla_DataBound(object sender, EventArgs e)
        {
            GVGrilla.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GVGrilla.Rows)
            {
                row.Cells[0].Visible = false;
            }
        }

        protected void GVGrilla_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}