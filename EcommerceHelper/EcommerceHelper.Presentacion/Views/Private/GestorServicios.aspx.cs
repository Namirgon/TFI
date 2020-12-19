using EcommerceHelper.BLL;
using EcommerceHelper.BLL.Servicios;
using EcommerceHelper.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceHelper.Presentacion.Views.Private
{
    public partial class GestorServicios : System.Web.UI.Page, IObservador
    {
        public UsuarioEntidad unUsuario = new UsuarioEntidad();
        ServicioBLL ServicioBLL = new ServicioBLL();
        UsuarioEntidad usuario;
        public HttpContext Current = HttpContext.Current;//xxxxx
        private List<object> ListaResultado = new List<object>(); //xxxxx
        List<MultiIdiomaEntidad> Traducciones; // xxxxx
        public GestorServicios() : base()
        {



            IObservable.AgregarObservador(this); //xxxxxxxx copiar en formularios xxxxxxx
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            unUsuario = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();

            if (!IsPostBack)
            {

                Cargargrilla();
                Traducciones = new List<MultiIdiomaEntidad>();

                Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;


            }

            // nombre de la patente de la pagina
            string[] unosPermisosTest = new string[] { "ABMServicios" };
            if (unUsuario == null || !this.Master.Autenticar(unosPermisosTest))
            {
                Response.Redirect("../Private/MenuAdministracion.aspx");
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

                        Cargargrilla();
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
                    unServicio.URLimagen = "/Content/Image/ " + urlServicio.FileName;
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
              
                if (urlServicio.HasFile)
                {
                    string ext = System.IO.Path.GetExtension(urlServicio.FileName);
                    ext.ToLower();
                   
                    if (ext== ".jpg" | ext == ".gif" | ext ==".png")
                    {
                        urlServicio.SaveAs(Server.MapPath("/Content/Image/ " + urlServicio.FileName));

                    }
                    unServicio.URLimagen = "/Content/Image/ " + urlServicio.FileName;
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

                throw;
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

        void IObservador.Traducirme()
        {

            ListaResultado.Clear();
            RecorrerControles(this);



            Traducciones = IdiomaBLL.GetBLLServicioIdiomaUnico().TraduccionesSgl;

            try
            {

                foreach (Control Control in ListaResultado)
                {
                   
                    foreach (var traduccion in Traducciones)
                    {



                        if (Equals(Control.ID, traduccion.NombreDelControl))
                        {
                           
                            //ESTO SON LOS <a>
                            if (Control is Label lbltradu)
                            {

                                lbltradu.Text = traduccion.Texto;

                            }
                            //ESTOS SON LOS INPUT CON TYPE TEXT O PASSWORD
                            else if (Control is TextBox)
                            {

                                var mapeo = (TextBox)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <BUTTON>
                            else if (Control is IButtonControl)
                            {
                                var mapeo = (IButtonControl)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            //ESTOS SON LOS <INPUT> TYPE BUTTON O SUBMIT
                            else if ((Control) is LinkButton)
                            {
                                var mapeo = (LinkButton)Control;
                                mapeo.Text = traduccion.Texto;
                            }
                            else if (Control is Button)
                            {
                                var mapeo = (Button)Control;
                                mapeo.Text = traduccion.Texto;
                            }

                        }

                    }

                }

            }
            catch (Exception es)
            {
                throw;
            }

        }
        private void RecorrerControles(Control pObjetoContenedor)
        {
            foreach (Control Controlobj in pObjetoContenedor.Controls)
            {
                ListaResultado.Add(Controlobj);

               

                if (Controlobj.Controls.Count > 0)
                {
                    RecorrerControles(Controlobj);
                }

                ListaResultado.Add(Controlobj);
            }
        }

        private void RecorrerDropDown(System.Web.UI.WebControls.DropDownList pMenuStrip)
        {
            ListaResultado.Add(pMenuStrip);
            foreach (System.Web.UI.WebControls.ListItem item in pMenuStrip.Items)
            {
                ListaResultado.Add(item);
            }


        }
    }
}