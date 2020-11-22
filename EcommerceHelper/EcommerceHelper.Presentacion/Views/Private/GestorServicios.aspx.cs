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
    public partial class GestorServicios : System.Web.UI.Page
    {
        public UsuarioEntidad unUsuario = new UsuarioEntidad();
        ServicioBLL ServicioBLL = new ServicioBLL();
        UsuarioEntidad usuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            unUsuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!IsPostBack)
            {

                Cargargrilla();

            }
            // nombre de la patente de la pagina
            string[] unosPermisosTest = new string[] {"GestionServicios"};
            if (usuario == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Public/Default.aspx");
            }

            
        }


        public void Cargargrilla()
        {

            GrillaServicios.DataSource = ServicioBLL.SelectALLServicios();
            GrillaServicios.DataBind();
        }
        public void LimpiarTextos()
        {
            txtTitulo.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtPrecio.Text = string.Empty;



        }

        protected void GrillaServicios_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            int id = Int32.Parse(GrillaServicios.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);


            ServicioEntidad unServicio;
            unServicio = ServicioBLL.FindServicio(id);
            switch (e.CommandName)
            {

                case "btnModificar":
                    {
                        hidServicio.Value = unServicio.IdServicio.ToString();
                        txtTitulo.Text = unServicio.Titulo;
                        txtDescripcion.Text = unServicio.Descripcion;
                        txtPrecio.Text = ( unServicio.Precio).ToString();
                        

                        break;
                    }
                case "btnEliminar":

                    {


                            ServicioBLL.EliminarServicio(id);
                            Cargargrilla();
                            LimpiarTextos();
                       

                        break;
                    }
            }
        }
        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            ServicioEntidad unServicio = new ServicioEntidad();

            try
            {
                unServicio.IdServicio = 1;
                unServicio.Titulo = txtTitulo.Text;
                unServicio.Descripcion = txtDescripcion.Text;
                unServicio.Precio = decimal.Parse( txtPrecio.Text) ;
               
                if (urlServicio.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(urlServicio.FileName);
                    ext.ToLower();
                     unServicio.URLimagen= ext;
                    if (ext == ".jpeg" | ext == ".gif" | ext == ".png" | ext ==".jpg")
                    {
                        urlServicio.SaveAs(Server.MapPath("/Content/Image/ " + urlServicio.FileName));

                    }
                    unServicio.URLimagen = urlServicio.FileName;
                }

                else
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('Seleccione un archivo');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "CrearOK", sb.ToString(), false);
                }


                ServicioBLL.RegistrarServicio(unServicio);
                LimpiarTextos();
                Cargargrilla();


            }
            catch (Exception ex)
            {


            }
        }

        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            ServicioEntidad unServicio = new ServicioEntidad();

            try
            {
                unServicio.IdServicio= Int32.Parse(hidServicio.Value ) ;
               unServicio.Titulo = txtTitulo.Text  ;
                unServicio.Descripcion= txtDescripcion.Text  ;
                unServicio.Precio =decimal.Parse( txtPrecio.Text );
                unServicio.URLimagen = urlServicio.FileName;
                if (urlServicio.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(urlServicio.FileName);
                    ext.ToLower();
                   
                    if (ext== ".jpg" | ext == ".gif" | ext ==".png")
                    {
                        urlServicio.SaveAs("../Content/Image/" + urlServicio.FileName);

                    }
                   
                }
            
                else
                {

                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("alert('Seleccione un archivo');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                               "CrearOK", sb.ToString(), false);
                }
                ServicioBLL.ModificarServicio(unServicio);
                LimpiarTextos();
                Cargargrilla();


            }
            catch (Exception ex)
            {


            }
        }

        protected void GrillaServicios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             Image img = new Image();
                img.ImageUrl = e.Row.Cells[4].Text;
                img.Attributes.Add("width", "50%");

                e.Row.Cells[4].Controls.Add(img);
            
        }

        protected void GrillaServicios_DataBound(object sender, EventArgs e)
        {

            GrillaServicios.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GrillaServicios.Rows)
            {
                row.Cells[0].Visible = false;
            }
        }
    }
}