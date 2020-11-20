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
    public partial class ABMTarjetasDeCredito : System.Web.UI.Page
    {

        private UsuarioEntidad usuarioentidad = new UsuarioEntidad();
        HttpContext Current = HttpContext.Current;
        TipoTarjetaBLL GestorTipoTarjeta = new TipoTarjetaBLL();
       List<TipoTarjetaEntidad> UnaTarjeta = new  List<TipoTarjetaEntidad>();
        TarjetaBLL GestorTarjeta = new TarjetaBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            var Current = HttpContext.Current;
            usuarioentidad = (UsuarioEntidad)HttpContext.Current.Session["Usuario"];

            string nombre = Session["NomUsuario"].ToString();
            if (!Page.IsPostBack)
            {

                cargarTipoTarjetas();

                CargarTarjetas();
            }
        }


      

        public void cargarTipoTarjetas()
        {
            ddlTipoTarjeta.DataSource = null;
            UnaTarjeta = GestorTipoTarjeta.FindAll ();
            ddlTipoTarjeta.DataSource = UnaTarjeta;
            ddlTipoTarjeta.DataValueField = "IdTipoTarjeta";
            ddlTipoTarjeta.DataTextField = "Descripcion";
            ddlTipoTarjeta.DataBind();

        }


        protected void GVTarjetas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Int32.Parse(GVTarjetas.Rows[Int32.Parse(e.CommandArgument.ToString())].Cells[0].Text);
           


            TarjetaEntidad unaTarjeta;
            unaTarjeta = GestorTarjeta.Find(id);
            switch (e.CommandName)
            {

                case "btnModificar":
                    {
                        hid.Value = unaTarjeta.IdTarjeta.ToString();
                        txtNombreTitular.Text= unaTarjeta.NombreTitular ;
                        txtNumeroTarjeta.Text = (unaTarjeta.NumeroTarjeta).ToString();
                        txtFecha.Value = unaTarjeta.FechaVencimiento.ToString();
                        txtcodseguridad.Text =  unaTarjeta.CodigoSeguridad.ToString();
                      
                        ddlTipoTarjeta.DataTextField=   unaTarjeta.MiTipoTarjeta.Descripcion.ToString();
                       
                        break;
                    }
                case "btnEliminar":

                    {

                        
                            GestorTarjeta.EliminarTarjeta(id);
                            CargarTarjetas();
                            limpiarCampos();
                        

                        break;
                    }
            }
        }

       
        protected void BtnModificarTarjeta_Click(object sender, EventArgs e)
        {

           
            TarjetaEntidad nuevatarjeta = new TarjetaEntidad();

            nuevatarjeta.IdTarjeta = int.Parse( hid.Value);

            nuevatarjeta.MiTipoTarjeta = new TipoTarjetaEntidad();
            nuevatarjeta.MiTipoTarjeta.IdTipoTarjeta = int.Parse(ddlTipoTarjeta.SelectedValue);
            nuevatarjeta.NombreTitular = txtNombreTitular.Text;
            nuevatarjeta.NumeroTarjeta = Int64.Parse(txtNumeroTarjeta.Text);
            nuevatarjeta.FechaVencimiento = DateTime.Parse(txtFecha.Value);
            nuevatarjeta.CodigoSeguridad = int.Parse(txtcodseguridad.Text);
            GestorTarjeta.UpdateTarjeta(nuevatarjeta);
            limpiarCampos();
            CargarTarjetas();
           
        }

        protected void btnAltaTarjeta_Click(object sender, EventArgs e)
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            TarjetaEntidad nuevatarjeta = new TarjetaEntidad();


            try
            {

                if (Page.IsValid)

                {
                    nuevatarjeta.IdUsuario = logueadoStatic.IdUsuario;
                    nuevatarjeta.MiTipoTarjeta = new TipoTarjetaEntidad();
                    nuevatarjeta.MiTipoTarjeta.IdTipoTarjeta = int.Parse(ddlTipoTarjeta.SelectedValue);
                    nuevatarjeta.NombreTitular = txtNombreTitular.Text;
                    nuevatarjeta.NumeroTarjeta = Int64.Parse(txtNumeroTarjeta.Text);
                    nuevatarjeta.FechaVencimiento = DateTime.Parse(txtFecha.Value);
                    nuevatarjeta.CodigoSeguridad = int.Parse(txtcodseguridad.Text);
                    GestorTarjeta.InsertTarjeta(nuevatarjeta);
                    CargarTarjetas();
                    limpiarCampos();
                }
                else
                {


                }

            }

            catch (Exception ex)
            {


            }

        }

        public void CargarTarjetas()
        {

            UsuarioEntidad logueadoStatic;
            var Current = HttpContext.Current;
            logueadoStatic = (UsuarioEntidad)Current.Session["Usuario"];
            int numeroIdUsuario = logueadoStatic.IdUsuario;

            List<TarjetaEntidad> MisTarjetas = new List<TarjetaEntidad>();
           

            MisTarjetas = GestorTarjeta.ListarTarjetas(numeroIdUsuario);


            GVTarjetas.DataSource = null;
            GVTarjetas .DataSource = MisTarjetas;
            GVTarjetas.DataBind();


        }

        public void limpiarCampos()
        {

            ddlTipoTarjeta.SelectedIndex = 0;
            txtcodseguridad.Text = string.Empty;
            txtFechaVencimiento.Text = string.Empty;
            txtNumeroTarjeta.Text = string.Empty;
            txtNombreTitular.Text = string.Empty;
        }

            protected void btnVolverPago_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pago.aspx");
        }

        protected void GVTarjetas_DataBound(object sender, EventArgs e)
        {
            GVTarjetas.HeaderRow.Cells[0].Visible = false;
            foreach (GridViewRow row in GVTarjetas.Rows)
            {
                row.Cells[0].Visible = false;
            }
        }
    }
}